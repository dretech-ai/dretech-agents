#!/usr/bin/env bash
# portfolio-advisor PII guard (PreToolUse on Write|Edit|MultiEdit in Claude Code,
# apply_patch in Codex).
#
# Blocks a file write when the new content contains a digit run that looks
# like an account number. Only active inside a portfolio workspace (a cwd with
# portfolio/profile.md) or when the target path is under portfolio/ or reviews/,
# so it stays out of the way in unrelated projects.
#
# Flagged:  8+ digits, optionally hyphen-separated (12345678, 1234-5678-9012, 123-45-6789)
# Allowed:  dollar amounts ($1,234,567.89), decimals, ISO dates (2026-10-17),
#           YYYYMMDD dates, year ranges (2026-2036), ISO date ranges
#           (2026-01-01-2026-12-31), masked numbers (••••1234)
# Disable:  PORTFOLIO_ADVISOR_PII_GUARD=off
#
# Exit 2 blocks the tool call and sends stderr back to the model.

[ "${PORTFOLIO_ADVISOR_PII_GUARD:-on}" = "off" ] && exit 0

# No perl (e.g. Windows without Git for Windows): say so instead of silently
# doing nothing. Exit 1 is a non-blocking error, so writes still go through.
if ! command -v perl >/dev/null 2>&1; then
  echo "portfolio-advisor PII guard is OFF: perl not found (on Windows, install Git for Windows)" >&2
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
  tr{\\}{/} for $cwd, @paths;   # Windows paths: C:\x\portfolio -> C:/x/portfolio
  my $path = join(", ", grep { $_ ne "" } @paths);

  my $in_workspace = ($cwd ne "" && -e "$cwd/portfolio/profile.md")
                  || grep { m{(^|/)(portfolio|reviews)/} } @paths;
  exit 0 unless $in_workspace;

  # travel/ belongs to vacation-planner, which keeps confirmation codes and
  # runs its own guard.
  my @real = grep { $_ ne "" } @paths;
  exit 0 if @real && !grep { !m{(^|/)travel/} } @real;

  my @hits;
  for my $t (@texts) {
    while ($t =~ /(?<![\d.,\$])(\d[\d-]{6,}\d)(?![\d.,]*\d)/g) {
      my $run = $1;
      (my $digits = $run) =~ s/-//g;
      next if length($digits) < 8;
      next if $run =~ /^(19|20)\d\d-(0[1-9]|1[0-2])-(0[1-9]|[12]\d|3[01])$/;   # ISO date
      next if $run =~ /^(19|20)\d\d(0[1-9]|1[0-2])(0[1-9]|[12]\d|3[01])$/;     # YYYYMMDD
      next if $run =~ /^(19|20)\d\d-(19|20)\d\d$/;                             # year range
      my $iso = qr/(19|20)\d\d-(0[1-9]|1[0-2])-(0[1-9]|[12]\d|3[01])/;
      next if $run =~ /^$iso-$iso$/;                                         # ISO date range
      push @hits, "...." . substr($digits, -4);
    }
  }
  exit 0 unless @hits;

  print STDERR "portfolio-advisor PII guard: blocked write to $path\n",
    "Found digit run(s) that look like account numbers: ", join(", ", @hits), "\n",
    "Remove account numbers from files entirely (use an account label like \"Fidelity Roth IRA\"). ",
    "If this is not an account number (e.g. a CUSIP or phone number), reformat or drop it.\n";
  exit 2;
'
