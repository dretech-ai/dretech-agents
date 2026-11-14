#!/usr/bin/env bash
# home-improvement PII guard (PreToolUse on Write|Edit|MultiEdit in Claude Code,
# apply_patch in Codex).
#
# Blocks a file write when the new content contains a digit run that looks
# like a mortgage, HELOC, utility, insurance policy, bank, parcel, or card
# number. Only active inside a home workspace (a cwd with home/profile.md) or
# when the target path is under home/, so it stays out of the way in unrelated
# projects.
#
# Flagged:  8+ digits, optionally hyphenated (123456789, 1234-5678-9012), and
#           space-grouped card numbers (4111 1111 1111 1111)
# Allowed:  lines labeled License / Quote # / Estimate # / Invoice # / Permit /
#           Confirmation / Contract #, dollar amounts ($1,234,567.89),
#           decimals, ISO dates (2026-10-17), YYYYMMDD dates, year ranges
#           (2026-2036), ISO date ranges (2026-01-01-2026-12-31), masked
#           numbers (••••1234)
# Disable:  HOME_IMPROVEMENT_PII_GUARD=off
#
# Exit 2 blocks the tool call and sends stderr back to the model.

[ "${HOME_IMPROVEMENT_PII_GUARD:-on}" = "off" ] && exit 0

# No perl (e.g. Windows without Git for Windows): say so instead of silently
# doing nothing. Exit 1 is a non-blocking error, so writes still go through.
if ! command -v perl >/dev/null 2>&1; then
  echo "home-improvement PII guard is OFF: perl not found (on Windows, install Git for Windows)" >&2
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
  tr{\\}{/} for $cwd, @paths;   # Windows paths: C:\x\home -> C:/x/home
  my $path = join(", ", grep { $_ ne "" } @paths);

  # Match on paths relative to cwd: "home/" also appears in absolute paths
  # (/home/user/...) on Linux.
  my @rel = map { my $p = $_; $p =~ s{^\Q$cwd\E/}{} if $cwd ne ""; $p } grep { $_ ne "" } @paths;

  my $in_workspace = ($cwd ne "" && -e "$cwd/home/profile.md")
                  || grep { m{^(\./)?home/} } @rel;
  exit 0 unless $in_workspace;

  # travel/, portfolio/, reviews/, comms/, and insurance/ belong to the sibling agents,
  # which run their own guards.
  exit 0 if @rel && !grep { !m{^(\./)?(travel|portfolio|reviews|comms|insurance)/} } @rel;

  my $iso = qr/(19|20)\d\d-(0[1-9]|1[0-2])-(0[1-9]|[12]\d|3[01])/;
  my @hits;
  for my $line (map { split /\n/ } @texts) {
    # Contractor license, quote, invoice, permit, and confirmation numbers are
    # kept on purpose.
    next if $line =~ /\b(license|lic\b|quote ?(#|no\b|number)|estimate ?(#|no\b|number)|invoice ?(#|no\b|number)|permit|confirmation|conf\b|contract ?(#|no\b|number)|proposal ?(#|no\b|number))/i;
    # Card numbers written with spaces: 4-4-4-4, or Amex 4-6-5.
    while ($line =~ /(?<!\d)(\d{4} \d{4} \d{4} \d{4}|\d{4} \d{6} \d{5})(?!\d)/g) {
      (my $digits = $1) =~ s/ //g;
      push @hits, "ending " . substr($digits, -4);
    }
    while ($line =~ /(?<![\d.,\$])(\d[\d-]{6,}\d)(?![\d.,]*\d)/g) {
      my $run = $1;
      (my $digits = $run) =~ s/-//g;
      next if length($digits) < 8;
      next if $run =~ /^$iso$/;                                               # ISO date
      next if $run =~ /^(19|20)\d\d(0[1-9]|1[0-2])(0[1-9]|[12]\d|3[01])$/;   # YYYYMMDD
      next if $run =~ /^(19|20)\d\d-(19|20)\d\d$/;                           # year range
      next if $run =~ /^$iso-$iso$/;                                         # ISO date range
      push @hits, "ending " . substr($digits, -4);
    }
  }
  exit 0 unless @hits;

  print STDERR "home-improvement PII guard: blocked write to $path\n",
    "Found digit run(s) that look like loan, account, policy, parcel, or card numbers: ", join(", ", @hits), "\n",
    "Drop them and use a label (\"Mortgage — Rocket\", \"State Farm homeowners\"). ",
    "If this is a contractor license, quote, invoice, permit, or confirmation number, put it on a line labeled ",
    "\"License:\", \"Quote #:\", \"Invoice #:\", \"Permit:\", or \"Confirmation:\".\n";
  exit 2;
'
