#!/bin/bash
# Build .zip package for Chrome Tab Index extension
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$SCRIPT_DIR"

OUTPUT="tab-index-chrome.zip"

# Remove old build
rm -f "$OUTPUT"

# Package as .zip
zip -r "$OUTPUT" \
  manifest.json \
  background.js \
  content.js \
  popup/ \
  icons/ \
  -x "*.DS_Store"

echo "Built: $OUTPUT"
echo ""
echo "To install:"
echo "  1. Open Chrome → chrome://extensions"
echo "  2. Enable 'Developer mode' (top right)"
echo "  3. Click 'Load unpacked' and select this directory"
echo "  OR"
echo "  4. Drag $OUTPUT onto the extensions page"
