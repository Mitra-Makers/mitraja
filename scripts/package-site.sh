#!/usr/bin/env bash
# Packages the static site into a zip ready for Hostinger File Manager upload.
# Usage: ./scripts/package-site.sh
set -euo pipefail

cd "$(dirname "$0")/.."

OUT_DIR="dist"
OUT_ZIP="$OUT_DIR/mitraja-site.zip"

rm -rf "$OUT_DIR"
mkdir -p "$OUT_DIR"

zip -r "$OUT_ZIP" . \
  -x ".git/*" \
  -x ".github/*" \
  -x ".claude/*" \
  -x ".vscode/*" \
  -x "scripts/*" \
  -x "dist/*" \
  -x ".gitignore" \
  -x ".DS_Store" \
  -x "*/.DS_Store" \
  -x "README.md" \
  -x "TODO.md" \
  > /dev/null

echo "Packaged: $OUT_ZIP"
