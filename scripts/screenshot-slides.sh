#!/usr/bin/env bash
# Render deck slides to PNGs via `slidev export`, with Playwright supplied by Nix.
#
# Usage:
#   scripts/screenshot-slides.sh            # all slides → shots/<n>.png
#   scripts/screenshot-slides.sh 17-22      # only that slide range
#   scripts/screenshot-slides.sh 17-22 out  # custom output dir
set -euo pipefail
cd "$(dirname "$0")/.."

range="${1:-}"
out="${2:-shots}"

browsers="$(nix build --print-out-paths --no-link nixpkgs#playwright-driver.browsers)"

# The npm playwright-chromium version must match the nixpkgs driver, or it
# won't find the browser revision inside $browsers.
want="$(nix eval --raw nixpkgs#playwright-driver.version)"
have="$(node -p "require('playwright-chromium/package.json').version" 2>/dev/null || echo none)"
if [ "$want" != "$have" ]; then
  echo "installing playwright-chromium@$want (npm has: $have)"
  npm i -D "playwright-chromium@$want"
fi

# Nix Chromium renders emoji as tofu unless fontconfig knows a color-emoji font.
if ! fc-list | grep -qi 'color emoji'; then
  emoji="$(nix build --print-out-paths --no-link nixpkgs#noto-fonts-color-emoji)"
  mkdir -p ~/.local/share/fonts
  ln -sf "$emoji"/share/fonts/noto/*.ttf ~/.local/share/fonts/
  fc-cache -f >/dev/null
fi

rm -rf "$out"
PLAYWRIGHT_BROWSERS_PATH="$browsers" \
  PLAYWRIGHT_SKIP_VALIDATE_HOST_REQUIREMENTS=true \
  npx slidev export --format png ${range:+--range "$range"} --output "$out"

echo "PNGs in $out/, named by slide number"
