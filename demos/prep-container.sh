#!/usr/bin/env bash
# prep-container.sh — devcontainer-era demo prep (superseded by prep-vm.sh):
# pre-warms the nix store, installs direnv, hooks it into zsh.
# Run once before the talk, then open a fresh terminal (or `exec zsh`).
#
# Deliberately does NOT `direnv allow` the potions — trusting the .envrc
# files live is the Act 6 reveal, and an allowed .envrc would auto-load
# the shells and spoil the Act 4/5 contrast.
set -euo pipefail
cd "$(dirname "$0")"

# Quiet this container's "ignoring ssl-cert-file" daemon warning for this
# run, and for every future shell:
export NIX_USER_CONF_FILES=
if ! grep -q 'NIX_USER_CONF_FILES' ~/.zshrc 2>/dev/null; then
  echo 'export NIX_USER_CONF_FILES=  # demo: silence ssl-cert-file warning' >>~/.zshrc
fi

# A `nix develop` zsh exports ZDOTDIR=/nix/store/…-nix-env-shell-rc/…; if you
# ever `exec zsh` inside one it leaks and hijacks every future zsh (breaking
# ~/.zshrc and the direnv hook). Guard both zshenv files (the nix-profile zsh
# reads /etc/zshenv, Debian's reads /etc/zsh/zshenv) so shells self-heal.
for f in /etc/zshenv /etc/zsh/zshenv; do
  if ! sudo grep -q 'nix-env-shell-rc' "$f" 2>/dev/null; then
    echo "==> installing ZDOTDIR guard in $f"
    sudo tee -a "$f" >/dev/null <<'EOF'

# demo guard: drop a stale nix-develop ZDOTDIR leaked via `exec zsh`
if [[ "$ZDOTDIR" == /nix/store/*nix-env-shell-rc* ]]; then
  unset ZDOTDIR
fi
EOF
  fi
done

echo "==> pre-warming the nix store (nothing downloads mid-demo)"
nix run nixpkgs#hello >/dev/null
nix run nixpkgs#cowsay -- prewarm >/dev/null
nix build --no-link ./snake-potion
for potion in snake-potion crab-potion rabbit-potion; do
  nix develop "./$potion" --command true
  nix print-dev-env "./$potion" >/dev/null # what direnv calls under the hood
done

echo "==> installing direnv + eza + bat into the user profile"
command -v direnv >/dev/null || nix profile install nixpkgs#direnv
command -v eza >/dev/null || nix profile install nixpkgs#eza
command -v bat >/dev/null || nix profile install nixpkgs#bat
if ! grep -q 'eza --icons' ~/.zshrc 2>/dev/null; then
  cat >>~/.zshrc <<'EOF'
# nicer ls (eza with icons), same aliases as the drift nix-env config
if command -v eza >/dev/null 2>&1; then
  alias ls='eza --icons'
  alias la='eza -a --icons'
  alias ll='eza -la --icons --group-directories-first'
  alias lt='eza --tree --icons'
fi
EOF
fi
if ! grep -q 'alias cat=' ~/.zshrc 2>/dev/null; then
  cat >>~/.zshrc <<'EOF'
# nicer cat (bat: syntax highlighting, no pager)
if command -v bat >/dev/null 2>&1; then
  alias cat='bat --paging=never'
fi
EOF
fi

echo "==> hooking direnv into zsh"
if ! grep -q 'direnv hook zsh' ~/.zshrc 2>/dev/null; then
  echo 'eval "$(direnv hook zsh)"' >>~/.zshrc
fi
if ! grep -q '_potion_precmd' ~/.zshrc 2>/dev/null; then
  cat >>~/.zshrc <<'EOF'
# prompt socket: an env (a potion, via direnv) may export POTION_PROMPT to
# take over the prompt while it's loaded — what it shows is up to the potion
setopt prompt_subst
_potion_base_prompt="$PROMPT"
_potion_precmd() {
  if [[ -n "$POTION_PROMPT" ]]; then
    PROMPT="$POTION_PROMPT"
  else
    PROMPT="$_potion_base_prompt"
  fi
}
precmd_functions+=(_potion_precmd)
EOF
fi
if ! grep -q '_direnv_hook()' ~/.zshrc 2>/dev/null; then
  cat >>~/.zshrc <<'EOF'
# quieter direnv: hide the giant "direnv: export +A +B …" env-diff line
_direnv_hook() {
  trap -- '' SIGINT
  eval "$(direnv export zsh 2> >(grep -v 'direnv: export' >&2))"
  trap - SIGINT
}
EOF
fi

echo "==> resetting direnv trust (only rabbit pre-trusted — snake's allow is the live reveal)"
direnv allow ./rabbit-potion
direnv deny ./snake-potion >/dev/null 2>&1 || true
direnv deny ./crab-potion >/dev/null 2>&1 || true

echo
echo "Done. Open a fresh terminal (or run: exec zsh), then follow demos/README.md."
echo "snake-potion is NOT direnv-allowed on purpose — Act 5 does that live."
