#!/usr/bin/env bash
# Checks: frontmatter, name matches repo folder, SKILL.md < 500 lines, evals exist, linked refs exist.
set -uo pipefail
root="$(cd "$(dirname "$0")/.." && pwd)"; s="$(basename "$root")"; f="$root/SKILL.md"; fail=0
[ -f "$f" ] || { echo "FAIL: missing SKILL.md"; exit 1; }
grep -q "^name: $s$" "$f" || { echo "FAIL: frontmatter name != folder ($s)"; fail=1; }
grep -q "^description:" "$f" || { echo "FAIL: missing description"; fail=1; }
[ "$(wc -l < "$f")" -lt 500 ] || { echo "FAIL: SKILL.md >= 500 lines"; fail=1; }
[ -f "$root/evals/evals.json" ] || { echo "FAIL: missing evals/evals.json"; fail=1; }
for p in $(grep -o '`\(references\|assets\)/[^`]*`' "$f" | tr -d '`' | sort -u); do
  [ -e "$root/$p" ] || { echo "FAIL: referenced file missing: $p"; fail=1; }
done
grep -rqi "cpm" "$root/SKILL.md" "$root/references" "$root/assets" && { echo "WARN: CPM mention found (out of scope)"; }
[ $fail -eq 0 ] && echo "OK" || exit 1
