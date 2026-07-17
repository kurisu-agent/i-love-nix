#!/usr/bin/env bash
# prep-vm.sh — one-shot demo prep (Act 0 of README.md) for the native demo
# VM (nix/run-vm.sh): installs direnv, hooks it into bash, pre-warms the
# potions, and EVICTS hello/cowsay so Act 2 shows a real fetch.
# Run once before the talk, then `exec bash`.
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
if ! grep -q '_direnv_hook()' ~/.bashrc 2>/dev/null; then
  cat >>~/.bashrc <<'EOF'
# quieter direnv: hide the giant "direnv: export +A +B …" env-diff line
# (keeps "direnv: loading" etc. — those are the demo's feedback)
_direnv_hook() {
  local previous_exit_status=$?
  trap -- '' SIGINT
  eval "$(direnv export bash 2> >(grep -v 'direnv: export' >&2))"
  trap - SIGINT
  return $previous_exit_status
}
EOF
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

echo "==> configuring zellij (no shortcut hints) + bat (print fully, no pager)"
mkdir -p ~/.config/zellij ~/.config/bat
if ! grep -q 'default_layout' ~/.config/zellij/config.kdl 2>/dev/null; then
  cat >>~/.config/zellij/config.kdl <<'EOF'
// demo: single compact bar — no keybinding hints at the bottom
default_layout "compact"
show_startup_tips false
EOF
fi
if ! grep -q 'paging' ~/.config/bat/config 2>/dev/null; then
  echo '--paging=never' >>~/.config/bat/config
fi

echo "==> pre-warming the potions (their toolchains shouldn't download mid-demo)"
nix build --no-link ./snake-potion
for potion in snake-potion crab-potion rabbit-potion; do
  nix develop "./$potion" --command true
  nix print-dev-env "./$potion" >/dev/null # what direnv calls under the hood
done

# Act 2's whole point is watching nix fetch something on the fly, so make
# sure its packages are cold. The `nix eval` still warms the nixpkgs
# eval cache — the demo should stall on the download, not on evaluation.
# (Not cowsay: the pre-warmed potion shells reference the same store path,
# so it can't be deleted — Act 6 covers cowsay from inside rabbit anyway.)
echo "==> un-warming hello + ponysay (Act 2 shows the real fetch)"
for attr in hello ponysay; do
  path=$(nix eval --raw "nixpkgs#$attr.outPath")
  if nix store delete "$path" >/dev/null 2>&1; then
    echo "    evicted $attr"
  else
    echo "    $attr already cold (or pinned by a gc root — fine)"
  fi
done

echo "==> resetting direnv trust (only rabbit pre-trusted — snake's allow is the live reveal)"
direnv allow ./rabbit-potion
direnv deny ./snake-potion >/dev/null 2>&1 || true
direnv deny ./crab-potion >/dev/null 2>&1 || true

echo
echo "Done. Run: exec bash — then follow demos/README.md."
echo "snake-potion is NOT direnv-allowed on purpose — Act 5 does that live."
