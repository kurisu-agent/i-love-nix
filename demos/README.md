# Live demo run-sheet 🧪

Start at the **Drink me** bookend slide. Run the acts top to bottom.

## Act 0 — before the talk

Runs in the native demo VM (`nix/run-vm.sh ssh`) — `git`, `zellij`, `bat` are
already in the image. `enable-devenv.sh` is the old devcontainer path; skip it
and set up by hand:

```bash
cd ~/Code/nix-pres-draft/demos

# direnv, hooked into bash — plus a prompt socket: a loaded potion may
# export POTION_PROMPT to take over the prompt (direnv can't touch PS1)
nix profile install nixpkgs#direnv
cat >>~/.bashrc <<'EOF'
eval "$(direnv hook bash)"
_potion_base_ps1="$PS1"
_potion_prompt() { PS1="${POTION_PROMPT:-$_potion_base_ps1}"; }
PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND;}_potion_prompt"
EOF

# pre-warm the nix store (nothing downloads mid-demo)
nix run nixpkgs#hello >/dev/null
nix run nixpkgs#cowsay -- prewarm >/dev/null
nix build --no-link ./snake-potion
for p in snake-potion crab-potion rabbit-potion; do
  nix develop "./$p" --command true
  nix print-dev-env "./$p" >/dev/null
done

# trust rabbit only — snake's `direnv allow` is the live reveal in Act 5
direnv allow ./rabbit-potion
direnv deny ./snake-potion 2>/dev/null || true
direnv deny ./crab-potion 2>/dev/null || true

exec bash
```

## Act 1 — kick off the vibe-coding demo 🤖

Switch to the VM, start Claude Code on the NixOS config, leave it running.

## Act 2 — run things without installing them 🏃

```bash
nix run nixpkgs#hello
nix run nixpkgs#cowsay -- "sup?"
```

## Act 3 — the language is just values

```bash
cat sample.nix
nix eval -f sample.nix message
nix eval -f sample.nix message --argstr name "Alice"
nix eval -f sample.nix doubled
```

## Act 4 — crab potion: allow it, get a toolchain 🦀

```bash
cargo --version          # command not found
cd crab-potion
cat flake.nix
nix develop -c bash      # step into the devShell explicitly
cargo --version          # a whole toolchain appeared
rustc hello.rs -o hello && ./hello
exit                     # leave the shell…
cargo --version          # …and it's gone again
cd ..
```

## Act 5 — snake potion: never type nix develop again 🐍

```bash
python3 --version        # command not found — no python on the box
cd snake-potion          # nothing happens — this .envrc isn't trusted yet
cat .envrc               # one line: use flake
direnv allow             # trust it → the shell loads right here, on cd
python3 --version        # 3.14 from the flake
which python3            # /nix/store/…
cat flake.nix
nix run .                # the packaged script, from the flake
cd ..                    # unloads on the way out
python3 --version        # gone again
```

## Act 6 — rabbit potion: even the prompt 🐇

```bash
cd rabbit-potion         # pre-trusted → the 🐇 hops into your prompt
cat flake.nix            # …and it's all declared in the shellHook
cowsay "we're all mad here"
cd ..                    # prompt back to normal
```

## Act 7 — nix profile 📌

```bash
nix profile install nixpkgs#cmatrix
cmatrix
nix profile rollback
cmatrix             # command not found
```

## Act 8 — back to the vibe demo 🤖

Review the config Claude wrote, `nixos-rebuild test`, roll back if it lied.

---

**If something looks weird:**

- Tools follow you after `cd`? You're still inside a `nix develop` shell — `exit`. (direnv always prints `direnv: …` lines when it acts; no lines = old shell.)
- direnv totally silent, even on `allow`? Run `exec bash` — heals the shell.
- Everything else (quirks, why the flags): comments in `enable-devenv.sh`.
