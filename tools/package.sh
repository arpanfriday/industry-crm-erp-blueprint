#!/usr/bin/env bash
# Builds dist/<skill-name>.zip (skill folder as zip root). Excludes evals, tools, README, git files.
set -euo pipefail
root="$(cd "$(dirname "$0")/.." && pwd)"; name="$(basename "$root")"
stage="$(mktemp -d)"; mkdir -p "$root/dist" "$stage/$name"
cp "$root/SKILL.md" "$stage/$name/"
for d in references assets scripts; do [ -d "$root/$d" ] && cp -r "$root/$d" "$stage/$name/"; done
rm -f "$root/dist/$name.zip"
(cd "$stage" && zip -qr "$root/dist/$name.zip" "$name" -x "*/.gitkeep" "*/__pycache__/*")
rm -rf "$stage"; echo "Built dist/$name.zip"
