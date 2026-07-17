#!/usr/bin/env bash
# prep-vm.sh — one-shot demo prep (Act 0 of README.md) for the native demo
# VM (nix/run-vm.sh): installs direnv, hooks it into bash, pre-warms the
# nix store. Run once before the talk, then `exec bash`.
# (prep-container.sh is the devcontainer-era equivalent.)
#
# Deliberately does NOT `direnv allow` snake/crab — trusting the .envrc
# files live is the Act 5 reveal; only rabbit is pre-trusted.
set -euo pipefail
cd "$(dirname "$0")"

echo "==> installing direnv into the user profile"
command -v direnv >/dev/null || nix profile install nixpkgs#direnv

echo "==> hooking direnv into bash"
if ! grep -q 'direnv hook bash' ~/.bashrc 2>/dev/null; then
  echo 'eval "$(direnv hook bash)"' >>~/.bashrc
fi
if ! grep -q '_potion_prompt' ~/.bashrc 2>/dev/null; then
  cat >>~/.bashrc <<'EOF'
# prompt socket: a loaded potion may export POTION_PROMPT to take over
# the prompt (direnv itself refuses to touch PS1)
_potion_base_ps1="$PS1"
_potion_prompt() { PS1="${POTION_PROMPT:-$_potion_base_ps1}"; }
PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND;}_potion_prompt"
EOF
fi

echo "==> pre-warming the nix store (nothing downloads mid-demo)"
nix run nixpkgs#hello >/dev/null
nix run nixpkgs#cowsay -- prewarm >/dev/null
nix build --no-link ./snake-potion
for potion in snake-potion crab-potion rabbit-potion; do
  nix develop "./$potion" --command true
  nix print-dev-env "./$potion" >/dev/null # what direnv calls under the hood
done

echo "==> resetting direnv trust (only rabbit pre-trusted — snake's allow is the live reveal)"
direnv allow ./rabbit-potion
direnv deny ./snake-potion >/dev/null 2>&1 || true
direnv deny ./crab-potion >/dev/null 2>&1 || true

echo
echo "Done. Run: exec bash — then follow demos/README.md."
echo "snake-potion is NOT direnv-allowed on purpose — Act 5 does that live."
