#!/usr/bin/env bash
# insurance-advisor PII guard (PreToolUse on Write|Edit|MultiEdit in Claude Code,
# apply_patch in Codex).
#
# Blocks a file write when the new content contains something that looks like
# a policy number, member or group ID, Medicare Beneficiary Identifier (MBI),
# VIN, bank, or card number. Only active inside an insurance workspace (a cwd
# with insurance/profile.md) or when the target path is under insurance/, so
# it stays out of the way in unrelated projects.
#
# Flagged:  8+ digits, optionally hyphenated (123456789, 1234-5678-9012);
#           space-grouped card numbers (4111 1111 1111 1111); 17-character
#           VINs; 11-character MBIs (1EG4-TE5-MK73); letter-and-digit IDs
#           with 6+ digits (HO3 1234567, ABC-123456789)
# Allowed:  lines labeled Quote # / Claim # / License / Confirmation / NAIC,
#           dollar amounts ($1,234,567.89), decimals, ISO dates (2026-10-17),
#           YYYYMMDD dates, year ranges (2026-2036), ISO date ranges
#           (2026-01-01-2026-12-31), masked numbers (••••1234)
# Disable:  INSURANCE_ADVISOR_PII_GUARD=off
#
# Exit 2 blocks the tool call and sends stderr back to the model.

[ "${INSURANCE_ADVISOR_PII_GUARD:-on}" = "off" ] && exit 0

# No perl (e.g. Windows without Git for Windows): say so instead of silently
# doing nothing. Exit 1 is a non-blocking error, so writes still go through.
if ! command -v perl >/dev/null 2>&1; then
  echo "insurance-advisor PII guard is OFF: perl not found (on Windows, install Git for Windows)" >&2
  exit 1
fi

exec perl -MJSON::PP -e '
  local $/;
  my $in = eval { decode_json(<STDIN>) } or exit 0;
  my $ti = $in->{tool_input} || {};
  my $cwd = $in->{cwd} // "";
  my @paths = ($ti->{file_path} // "");
  my @texts = grep { defined } ($ti->{content}, $ti->{new_string});
  push @texts, map { $_->{new_string} } @{ $ti->{edits} || [] };

  # Codex edits files with apply_patch: the whole patch is in tool_input.command.
  # Check its target paths and added ("+") lines.
  if (($in->{tool_name} // "") eq "apply_patch") {
    my $patch = $ti->{command} // "";
    $patch = join("\n", @$patch) if ref $patch eq "ARRAY";
    @paths = $patch =~ /^\*\*\* (?:Add File|Update File|Move to): (.+?)\s*$/mg;
    push @texts, join("\n", $patch =~ /^\+(.*)$/mg);
  }
  tr{\\}{/} for $cwd, @paths;   # Windows paths: C:\x\insurance -> C:/x/insurance
  my $path = join(", ", grep { $_ ne "" } @paths);

  # Match on paths relative to cwd, so the sibling folder names below are not
  # confused with parts of an absolute path (/home/user/...) on Linux.
  my @rel = map { my $p = $_; $p =~ s{^\Q$cwd\E/}{} if $cwd ne ""; $p } grep { $_ ne "" } @paths;

  my $in_workspace = ($cwd ne "" && -e "$cwd/insurance/profile.md")
                  || grep { m{^(\./)?insurance/} } @rel;
  exit 0 unless $in_workspace;

  # portfolio/, reviews/, travel/, home/, and comms/ belong to the sibling
  # agents, which run their own guards.
  exit 0 if @rel && !grep { !m{^(\./)?(portfolio|reviews|travel|home|comms)/} } @rel;

  my $iso = qr/(19|20)\d\d-(0[1-9]|1[0-2])-(0[1-9]|[12]\d|3[01])/;
  # MBI letters exclude S, L, O, I, B, Z.
  my $mL = qr/[AC-HJKMNP-RT-Y]/;
  my $mA = qr/[AC-HJKMNP-RT-Y0-9]/;
  my @hits;
  for my $line (map { split /\n/ } @texts) {
    # Quote, claim, agent license, confirmation, and NAIC codes are kept on purpose.
    next if $line =~ /\b(quote ?(#|no\b|number)|claim ?(#|no\b|number)|license|lic\b|confirmation|conf\b|naic)/i;
    # Card numbers written with spaces: 4-4-4-4, or Amex 4-6-5.
    while ($line =~ /(?<!\d)(\d{4} \d{4} \d{4} \d{4}|\d{4} \d{6} \d{5})(?!\d)/g) {
      (my $digits = $1) =~ s/ //g;
      push @hits, "card ending " . substr($digits, -4);
    }
    # Medicare Beneficiary Identifier, with or without dashes.
    while ($line =~ /(?<![A-Za-z0-9])([1-9]$mL$mA\d-?$mL$mA\d-?$mL$mL\d\d)(?![A-Za-z0-9])/g) {
      push @hits, "MBI-like ID ending " . substr($1, -4);
    }
    # VIN: 17 characters, no I, O, or Q, with both letters and digits.
    while ($line =~ /(?<![A-Za-z0-9])([A-HJ-NPR-Z0-9]{17})(?![A-Za-z0-9])/g) {
      my $v = $1;
      next unless $v =~ /\d/ && $v =~ /[A-Z]/;
      push @hits, "VIN-like ID ending " . substr($v, -4);
    }
    # Letter-prefixed or mixed IDs (policy, member, group numbers) with 6+ digits.
    while ($line =~ /(?<![A-Za-z0-9\$])((?=[A-Z0-9-]*[A-Z])[A-Z0-9][A-Z0-9-]{2,})(?![A-Za-z0-9])/g) {
      my $tok = $1;
      (my $digits = $tok) =~ s/\D//g;
      next if length($digits) < 6 || length($tok) > 24;
      next if $tok =~ /^[A-HJ-NPR-Z0-9]{17}$/;   # reported as a VIN above
      next if $tok =~ /^${iso}T\d/;             # ISO date-time (2026-11-14T09)
      push @hits, "ID ending " . substr($digits, -4);
    }
    # Plain digit runs.
    while ($line =~ /(?<![\d.,\$A-Za-z])(\d[\d-]{6,}\d)(?![\d.,]*\d)(?![A-Za-z])/g) {
      my $run = $1;
      (my $digits = $run) =~ s/-//g;
      next if length($digits) < 8;
      next if $run =~ /^$iso$/;                                               # ISO date
      next if $run =~ /^(19|20)\d\d(0[1-9]|1[0-2])(0[1-9]|[12]\d|3[01])$/;   # YYYYMMDD
      next if $run =~ /^(19|20)\d\d-(19|20)\d\d$/;                           # year range
      next if $run =~ /^$iso-$iso$/;                                         # ISO date range
      push @hits, "number ending " . substr($digits, -4);
    }
  }
  exit 0 unless @hits;

  my %seen;
  @hits = grep { !$seen{$_}++ } @hits;
  print STDERR "insurance-advisor PII guard: blocked write to $path\n",
    "Found what looks like a policy, member, MBI, VIN, account, or card number: ", join(", ", @hits), "\n",
    "Drop it and use a label (\"State Farm auto\", \"2021 Honda CR-V\", \"Aetna PPO — employer\"). ",
    "If this is a quote, claim, agent license, confirmation, or NAIC number, put it on a line labeled ",
    "\"Quote #:\", \"Claim #:\", \"License:\", \"Confirmation:\", or \"NAIC:\".\n";
  exit 2;
'
