#!/usr/bin/env bash
# start-slidev.sh — serve the deck on :3000 via the flake dev shell.
# Inside the demo VM (demos/run-vm.sh) the host reaches it at
# http://localhost:3000 through the qemu port forward.
set -euo pipefail
# Script lives in demos/; the deck (slides.md, flake.nix) is one level up.
cd "$(dirname "$0")/.."

[ -d node_modules ] || nix develop -c npm install
exec nix develop -c npx slidev slides.md --port 3000 --remote "$@"
