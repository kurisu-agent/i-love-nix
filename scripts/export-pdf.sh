#!/usr/bin/env bash
# Export the deck to PDF with real, selectable text and correctly embedded fonts.
#
# Why not plain `slidev export`? The deck's Google-served fonts are *variable*
# fonts, and Chromium's PDF backend embeds variable fonts as Type 3 glyph
# drawings — many viewers (macOS Preview, mobile) render those as unfilled or
# miscolored outlines ("the font color is not set"). The fix: instantiate
# static TrueType weights locally, disable the webfont provider just for the
# export, and let Chromium embed proper CID TrueType fonts.
#
# Usage: scripts/export-pdf.sh [output.pdf]   (default: i-love-nix.pdf)
set -euo pipefail
cd "$(dirname "$0")/.."

out="${1:-i-love-nix.pdf}"
dest="$HOME/.local/share/fonts/deck-static"

# --- one-time: static instances of the deck fonts (idempotent) ---------------
if [ ! -f "$dest/NotoSans-static-900.ttf" ]; then
  mkdir -p "$dest"
  noto="$(nix build --print-out-paths --no-link nixpkgs#noto-fonts)"
  jb="$(nix build --print-out-paths --no-link nixpkgs#jetbrains-mono)"
  # Pin BOTH axes (wght + wdth) — partial instancing leaves fvar/gvar behind
  # and Chromium falls back to Type 3 again.
  for w in 400 700 900; do
    nix shell nixpkgs#python3Packages.fonttools -c \
      fonttools varLib.instancer --update-name-table \
      "$noto/share/fonts/noto/NotoSans.ttf" wght=$w wdth=100 \
      -o "$dest/NotoSans-static-$w.ttf" >/dev/null
  done
  nix shell nixpkgs#python3Packages.fonttools -c \
    fonttools varLib.instancer \
    "$noto/share/fonts/noto/NotoSans-Italic.ttf" wght=400 wdth=100 \
    -o "$dest/NotoSans-static-Italic.ttf" >/dev/null
  # JetBrains Mono ships static per-weight TTFs — link all but the variable ones.
  for f in "$jb/share/fonts/truetype/"JetBrainsMono-*.ttf; do
    case "$f" in *Variable* | *\[*) ;; *) ln -sf "$f" "$dest/" ;; esac
  done
  nix shell nixpkgs#fontconfig -c fc-cache -f >/dev/null
fi

# --- browsers, same self-healing setup as screenshot-slides.sh ---------------
browsers="$(nix build --print-out-paths --no-link nixpkgs#playwright-driver.browsers)"
want="$(nix eval --raw nixpkgs#playwright-driver.version)"
have="$(node -p "require('playwright-chromium/package.json').version" 2>/dev/null || echo none)"
[ "$want" = "$have" ] || npm i -D "playwright-chromium@$want"

# --- export with the webfont provider off, so local statics are used ---------
trap 'rm -f .slides-export.md' EXIT
sed '/^fonts:$/a\  provider: none' slides.md > .slides-export.md
PLAYWRIGHT_BROWSERS_PATH="$browsers" \
  PLAYWRIGHT_SKIP_VALIDATE_HOST_REQUIREMENTS=true \
  npx slidev export .slides-export.md --format pdf --output "$out"

# --- sanity: only the italic (1 word) and color emoji may be Type 3 ----------
bad="$(nix shell nixpkgs#poppler-utils -c pdffonts "$out" |
  awk '$2=="Type" && $3=="3" {print $1}' | grep -cv 'Italic\|Emoji' || true)"
[ "$bad" = 0 ] || echo "WARNING: unexpected Type 3 fonts in $out — check pdffonts"
echo "exported $out"
