# Security Policy

## Reporting a vulnerability

**Don't open a public issue.** Report it privately through GitHub:
[Report a vulnerability](https://github.com/dretech-ai/dretech-agents/security/advisories/new)
(the **Security** tab → **Report a vulnerability**). Only the maintainers can
see the report.

Examples of what to report:

- An account number, SSN, or similar identifier that gets past the
  portfolio-advisor PII guard (`plugins/portfolio-advisor/hooks/pii-guard.sh`)
  into a file the advisor writes
- A hook or script that makes a network call, runs untrusted input, or touches
  files outside the user's workspace
- Skill instructions that lead Claude to send personal financial data somewhere
  other than the user's own folder

Include the agent and version, and the smallest input that shows the problem.
**Use made-up numbers.** Never send a real statement or account number, even
in a private report.

You'll get an acknowledgement within 7 days. Fixes ship as a new plugin
version; the advisory is published once the fix is out.

## Supported versions

Only the latest version of each agent gets fixes. Update with
`/plugin marketplace update dretech-ai`.

## Scope

The PII guard is a pattern match, not a guarantee. Its documented limits,
like account numbers under 8 digits, numbers written with spaces, and writes
made through shell commands, are known gaps (see the
[plugin README](plugins/portfolio-advisor/README.md#the-pii-guard)). Ideas for
closing them are welcome as regular issues or PRs.
