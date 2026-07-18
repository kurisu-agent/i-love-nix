# Live demo run-sheet 🧪

Start at the **Drink me** bookend slide. Run the acts top to bottom.

## Act 0 — before the talk

Runs in the native demo VM (`demos/run-vm.sh ssh`) — `git`, `zellij`, `bat` are
already in the image. (`prep-container.sh` is the devcontainer-era version.)

```bash
cd ~/Code/nix-pres-draft/demos
./prep-vm.sh
exec bash
```

(The script pre-trusts rabbit only — snake's `direnv allow` is the live reveal in Act 6. Don't allow it early.)

## Act 1 — kick off the vibe-coding demo 🤖

Switch to the VM, start Claude Code on the NixOS config, leave it running.

## Act 2 — run things without installing them 🏃

```bash
nix run nixpkgs#hello    # cold on purpose — watch it fetch, run, install nothing
nix run nixpkgs#ponysay -- "sup?"
```

## Act 3 — nix profile 📌

```bash
nix profile install nixpkgs#cmatrix
cmatrix
nix profile rollback
cmatrix             # command not found
```

## Act 4 — the language is just values

```bash
bat sample.nix
nix eval -f sample.nix message
nix eval -f sample.nix message --argstr name "Alice"
nix eval -f sample.nix doubled
```

## Act 5 — crab potion: allow it, get a toolchain 🦀

```bash
cargo --version          # command not found
cd crab-potion
bat flake.nix
nix develop -c bash      # step into the devShell explicitly
cargo --version          # a whole toolchain appeared
rustc hello.rs -o hello && ./hello
exit                     # leave the shell…
cargo --version          # …and it's gone again
cd ..
```

## Act 6 — snake potion: never type nix develop again 🐍

```bash
python3 --version        # command not found — no python on the box
cd snake-potion          # nothing happens — this .envrc isn't trusted yet
bat .envrc               # one line: use flake
direnv allow             # trust it → the shell loads right here, on cd
python3 --version        # 3.14 from the flake
which python3            # /nix/store/…
bat flake.nix
nix run .                # the packaged script, from the flake
cd ..                    # unloads on the way out
python3 --version        # gone again
```

## Act 7 — rabbit potion: even the prompt 🐇

```bash
cd rabbit-potion         # pre-trusted → the 🐇 hops into your prompt
bat flake.nix            # …and it's all declared in the shellHook
cowsay "we're all mad here"
cd ..                    # prompt back to normal
```

## Act 8 — back to the vibe demo 🤖

Review the config Claude wrote, `nixos-rebuild test`, roll back if it lied.

---

**If something looks weird:**

- Tools follow you after `cd`? You're still inside a `nix develop` shell — `exit`. (direnv always prints `direnv: …` lines when it acts; no lines = old shell.)
- direnv totally silent, even on `allow`? Run `exec bash` — heals the shell.
- Everything else (quirks, why the flags): comments in `prep-vm.sh`.
