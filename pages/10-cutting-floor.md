---
layout: center
class: text-center
---

<div class="text-7xl pb-2"><Ico name="film-strip" /></div>

# The cutting floor

<div class="text-xl opacity-80 pt-2">bonus slides — the hands-on tour, in still form</div>

---

# Getting Nix <span class="text-2xl"><Ico name="download-simple" /></span>

Two ways in — same language, same store, same commands:

<div class="grid grid-cols-2 gap-8 pt-6">
<div>

### <Ico name="logos:linux-tux" /> standalone
On **any Linux**, macOS, or WSL — one installer, no reboot:

```bash
curl -fsSL https://install.determinate.systems/nix \
  | sh -s -- install
```

</div>
<div>

### <Ico name="simple-icons:nixos" /> NixOS
The **whole OS** is Nix — config to bootloader. More on that in a moment.

</div>
</div>

<div class="opacity-60 text-sm pt-8">Try it on the machine you already have — going full NixOS is the deep end, not the entry fee.</div>

<!--
The installer is Determinate Systems' — the de-facto standard now: creates the /nix APFS volume on macOS, survives OS upgrades, has a real uninstaller, flakes on by default.

On macOS there's also **nix-darwin** worth mentioning aloud: the NixOS module system ported to the Mac — packages, launchd services, `defaults`-style settings, all declarative with generations and `darwin-rebuild switch`. It layers *on top of* this standalone install (the installer answers "how do I get Nix", nix-darwin answers "how do I make my Mac declarative"). It gets its own slide in the ecosystem section.
-->

---

# The everyday toolbox <span class="text-2xl"><Ico name="toolbox" /></span>

> A handful of verbs cover most of daily Nix

<div class="grid grid-cols-2 gap-10 mt-2">
<div>

### <Ico name="person-simple-run" /> Ephemeral — try it, then it's gone

```bash
nix run   nixpkgs#hello      # run once, no install
nix shell nixpkgs#cowsay     # tools on PATH (subshell)
nix develop                  # enter a flake's devShell
nix search nixpkgs ripgrep   # find in 100k+ packages
```

</div>
<div>

### <Ico name="push-pin" /> Persistent — sticks around

```bash
nix profile install nixpkgs#ripgrep
nix profile list | remove | rollback
nix build nixpkgs#hello      # → ./result symlink
nix flake init | update      # scaffold | bump lock
```

</div>
</div>

<div class="opacity-60 text-sm pt-4"><code>run</code>/<code>shell</code>/<code>develop</code> vanish when you exit · <code>profile</code> persists — with generations &amp; rollbacks, just like the system. Sweep up with <code>nix-collect-garbage -d</code>.</div>

---

# `nix profile` — installs that roll back too <span class="text-2xl"><Ico name="push-pin" /></span>

> Unlike `run` / `shell` / `develop`, this one **sticks around** — but it's still just symlinks &amp; generations

```bash
nix profile install nixpkgs#ripgrep   # add to your user profile
nix profile list                      # what's installed
nix profile rollback                  # undo the last change
```

<div class="grid grid-cols-2 gap-10 items-center mt-2">
<div>

- Your profile is a **generation-backed symlink tree** — `~/.nix-profile → /nix/store/…-profile`
- Every `install` / `remove` / `upgrade` mints a **new generation**; the old one stays for `rollback`
- Same model as `nixos-rebuild` — atomic &amp; reversible — but scoped to **one user**, no root needed
- Content-addressed underneath → two tools wanting different `glibc`s coexist happily

</div>
<div>
<Placeholder label="~/.nix-profile → one generation per change" />
</div>
</div>

<div class="opacity-60 text-sm pt-4">Ephemeral: <code>run</code> · <code>shell</code> · <code>develop</code> — vs — persistent &amp; rollback-able: <code>profile</code>.</div>

---

# The Nix language in 30 seconds

```nix
let
  pkgs = import <nixpkgs> {};
  greeting = name: "Hello, ${name}!";
in
{
  message = greeting "Nix";
  tools   = [ pkgs.git pkgs.jq pkgs.ripgrep ];
}
```

- **Attribute sets** (`{ ... }`) and **lists** (`[ ... ]`) are the building blocks
- Functions are `arg: body`, applied by juxtaposition: `greeting "Nix"`
- `let … in` binds names for the expression below; `${…}` interpolates into strings

<!--
The Meet Nix theory (expressions, not statements) in real syntax: the whole file is ONE expression whose value is the attrset at the bottom.
-->

---

# Batteries included — `builtins` <span class="text-2xl"><Ico name="battery-charging" /></span>

The language is tiny — the standard library is one global attrset:

```nix
builtins.length [ 1 2 3 ]                    # 3
builtins.map (x: x * 2) [ 1 2 3 ]            # [ 2 4 6 ]
builtins.readFile ./motd.txt                 # "hello, wonderland\n"
builtins.fromJSON ''{ "port": 443 }''        # { port = 443; }
builtins.fetchGit { url = "…"; rev = "…"; }  # a pinned source, as a value
```

- ~100 functions — strings, lists, attrsets, paths, JSON/TOML — no imports needed
- Even I/O stays honest: what `readFile` / `fetchGit` return **becomes part of the inputs** the build is hashed on
- `builtins.derivation` is the primitive underneath it all — everything else is sugar over it

<div class="opacity-60 text-sm pt-4">Day to day you'll mostly use the richer layer on top: <code>nixpkgs.lib</code> (<code>lib.mkIf</code>, <code>lib.mapAttrs</code>, …).</div>

<!--
The language itself has almost no keywords — everything lives in the `builtins` attrset, always in scope, no imports. Roughly a hundred functions.

The interesting ones are the impure-looking ones: `readFile`, `fetchGit`, `getEnv`. They don't break purity because whatever they return is captured as an *input* to evaluation — read a file and its content is part of what gets hashed; fetch a repo and (in flakes) it must be pinned to a rev. The escape hatches are all accounted for.

`builtins.derivation` is the ur-primitive: literally every package — all 100k in nixpkgs — bottoms out in calls to it. `mkDerivation`, `mkShell`, buildRustPackage… all sugar.

nixpkgs.lib is the community stdlib layered on top — that's where the module system helpers (mkIf, mkForce, mapAttrs) live. builtins = the language's; lib = nixpkgs's.
-->

---

# Anatomy of a flake <span class="text-2xl"><Ico name="snowflake" /></span>

> A flake is just an attrset with two keys

```nix
{
  inputs = {                                 # what this flake depends on
    nixpkgs.url      = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
  };

  outputs = { self, nixpkgs, ... }: {        # a function → what it produces
    packages.x86_64-linux.default  = …;      #  → nix build
    devShells.x86_64-linux.default = …;      #  → nix develop
    nixosConfigurations.laptop     = …;      #  → nixos-rebuild switch
  };
}
```

- **`inputs`** — other flakes, each pinned in `flake.lock` to an exact git rev + hash
- **`outputs`** — a **function of the resolved inputs**, returning a well-known schema the CLI knows how to consume
- **Pure &amp; hermetic** — no ambient `<nixpkgs>`, no network mid-eval → the lock makes it reproducible anywhere
- **Field note:** a `flake.nix` in a GitHub repo is a reliable sign the maintainer is an extremely cool person <Ico name="sunglasses" />

---

# A reproducible dev shell

Drop a `flake.nix` in a repo and `nix develop` gives everyone the same toolchain:

```nix
{
  description = "dev shell";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }:
    let pkgs = import nixpkgs { system = "x86_64-linux"; };
    in {
      devShells.x86_64-linux.default = pkgs.mkShell {
        packages = [ pkgs.nodejs_24 pkgs.git ];
      };
    };
}
```

`nix develop` → you're in a shell with Node 24 and Git, pinned by the flake lock.

---

# `direnv` — you don't even type it <span class="text-2xl"><Ico name="door-open" /></span>

<div class="grid grid-cols-2 gap-10 items-center mt-2">
<div>

One line in a repo's `.envrc`:

```bash
# .envrc
use flake
```

- `cd` **in** → the flake's devShell auto-loads · `cd` **out** → it unloads. Nothing leaks into your global shell.
- **nix-direnv** caches the evaluated shell → re-entry is **instant**, not a fresh flake eval every time
- Your editor &amp; terminal just _see_ the right `PATH`, env vars &amp; tools — per directory

</div>
<div>
<Placeholder label="cd into repo → tools appear · cd out → gone" />
</div>
</div>

<div class="opacity-60 text-sm pt-4">First visit: <code>direnv allow</code> to trust the file · <a href="https://direnv.net">direnv.net</a> · <a href="https://github.com/nix-community/nix-direnv">nix-direnv</a></div>

---

# `nixos-rebuild switch` — what actually happens

<div class="flex justify-center items-center h-[380px]">

```mermaid {scale: 0.6}
graph LR
  A["⌨️ nixos-rebuild<br/>switch"] --> E["λ evaluate<br/>one system derivation"]
  E --> B["🔨 realise<br/>build ∪ substitute"]
  B --> G["📦 new<br/>generation"]
  G --> L["🥾 boot entry"]
  G --> S["⚡ activate<br/>/etc + services"]
  L --> R(["✅ new system<br/>old ones kept"])
  S --> R
```

</div>

<div class="text-center opacity-70">the <b>same pipeline</b> from "under the hood" — the "package" is your <b>entire machine</b> · nothing mutates until activation</div>

<!--
The whole machine goes through the exact evaluate → realise → store → share pipeline from the "under the hood" section, as ONE derivation.

- **Evaluate** — the whole config becomes one `system` derivation (toplevel), hashed like any other build
- **Realise** — substitute unchanged paths from a binary cache, build only the delta; nothing is live yet
- **New generation** — registered in /nix/var/nix/profiles/system, right next to the old ones
- **Boot entry + activation** — systemd-boot/GRUB entry added, then `switch-to-configuration` swaps /etc atomically and starts/stops/restarts only the changed systemd units

Everything before activation is side-effect-free — a failed build changes *nothing*, and the previous generation is always one reboot away.

Variants: `boot` = same, minus activation (applies next reboot) · `test` = activate without a boot entry.
-->

---

# The traditional way <Ico name="fire" class="text-2xl" />

> _"…but it works on my machine"_

<div class="opacity-70 pt-1"><Ico name="hand-pointing" /> this is the <b>entropy</b> we mean — unrecorded change piling up until no one can explain the machine. Its four favorite faces:</div>

<div class="grid grid-cols-2 gap-x-10 gap-y-6 pt-4">
<div>

### <Ico name="dice-five" /> one global, mutable pile
`/usr/lib` is a shared variable every install mutates — apps fight over one copy of everything

</div>
<div>

### <Ico name="ghost" /> zombie machines
a system is the sum of every command ever run on it — still shambling, but nobody remembers why it's alive

</div>
<div>

### <Ico name="wrench" /> build-system roulette
your gcc 13 vs CI's gcc 12 · system openssl vs brew's — "install the deps" means something different everywhere

</div>
<div>

### <Ico name="hands-praying" /> setup by folklore
a README of steps, a wiki page, that one teammate who remembers — replayed by hand, drifting every time

</div>
</div>

<div class="opacity-60 text-sm pt-8">Nothing pins anything, so everything drifts. Every tool in this section is an attempt to fix some of this — Nix goes after the root.</div>

---

# …and vs npm <Ico name="logos:npm-icon" class="text-2xl" />

> You already met the `package.json` analogy — under the hood the **models** are worlds apart

<div class="grid grid-cols-2 gap-10 mt-2">
<div>

### <Ico name="logos:npm-icon" /> npm / `node_modules`
- Deps live in a per-project **`node_modules`** — nested, duplicated, mutated in place
- Version **ranges** (`^1.3.0`) → the tree drifts unless the lockfile holds it
- **Phantom deps** — you can `require` a package you never declared (it got hoisted)
- `postinstall` runs **arbitrary code** at install time — supply-chain surface
- Only the JS layer — a native `.node` addon still needs system libs &amp; a compiler

</div>
<div>

### <Ico name="simple-icons:nixos" /> Nix
- One shared **`/nix/store`**, content-addressed — every version coexists, shared not copied
- Every input **pinned by hash** in `flake.lock`; the store path _is_ the identity
- **No phantom deps** — a build sees only what it declared; nothing ambient leaks in
- Builds run in a **sandbox** — no network, no arbitrary install-time side effects
- Packages the **whole closure** down to `glibc`, not just the JS

</div>
</div>

<div class="opacity-60 text-sm pt-4">npm resolves a <b>tree per project</b> you hope matches the lock · Nix resolves a <b>graph — shared &amp; hashed</b> — that can't drift.</div>

---

# …and vs Ansible / Vagrant <Ico name="toolbox" class="text-2xl" />

> Same goal — a machine set up _just so_ — but they **run steps**; Nix **declares a result**

<div class="grid grid-cols-2 gap-10 mt-2">
<div>

### <Ico name="logos:ansible" /> Ansible
- Playbooks **run top-to-bottom** — order &amp; current state matter; re-runs only _hope_ to be idempotent
- "Configured" = whatever the tasks _did_, not a value you can inspect or diff
- Roles don't really compose — no merge/override, you just append more tasks

### <Ico name="logos:vagrant-icon" /> Vagrant
- One imperative `Vagrantfile` per box; provisioners are **shell scripts** mutating a VM
- No generations, no shared graph — reprovision and pray

</div>
<div>

### <Ico name="simple-icons:nixos" /> Nix
- The system **is a value** — evaluated, not executed → same config, same machine
- **Modules merge &amp; override** — compose configs across hosts, no copy-paste drift
- **Atomic** switch + rollback; nothing is mutated in place
- One graph from bootloader → dotfiles, where the others stop at "packages installed"

</div>
</div>

<div class="opacity-60 text-sm pt-4">Imperative tools automate the <b>steps</b> to a machine · Nix <b>defines the machine</b> and derives the steps.</div>

---

# …and vs Terraform <Ico name="logos:terraform-icon" class="text-2xl" />

> The closest cousin — both **declare**, not script — but they declare **different layers**

<div class="grid grid-cols-2 gap-10 mt-2">
<div>

### <Ico name="logos:terraform-icon" /> Terraform
- Declarative like Nix — but for **cloud infra**: VMs, networks, DNS, buckets
- Source of truth is a **mutable state file** → **drift** when reality diverges; `refresh` / `import` to reconcile
- Pins _provider_ versions, not the **software inside** the box — the AMI/image is still an opaque blob
- `apply` mutates live resources in place; rollback = re-apply the old config

</div>
<div>

### <Ico name="simple-icons:nixos" /> Nix
- Declares what's **inside** the machine — packages, services, users, dotfiles — hashed to `glibc`
- **No external state file** — the `/nix/store` _is_ the state; the config fully determines it
- Reproducible by content hash, not "whatever the image happened to contain"
- **Atomic** generation switch + instant rollback

</div>
</div>

<div class="opacity-60 text-sm pt-4">Not rivals — <b>pair them</b>: Terraform provisions the <b>box</b> <Ico name="cloud" />, Nix (via <code>nixos-anywhere</code>) defines what <b>runs inside</b> it.</div>

---

# Docker vs Nix <Ico name="logos:docker-icon" class="text-2xl" /> <Ico name="simple-icons:nixos" class="text-2xl" />

> Two very different routes to the same goal

<div class="grid grid-cols-2 gap-10 mt-2">
<div>

### <Ico name="logos:docker-icon" /> Docker
- Ships a **filesystem snapshot** — an opaque image, layer on layer
- Reproducible-_ish_: `FROM ubuntu:22.04` + `apt install` drifts as upstream moves
- Isolates at **runtime** — the unit is a running **container**
- A `Dockerfile` is an imperative script that _happens_ to leave an image behind

</div>
<div>

### <Ico name="simple-icons:nixos" /> Nix
- Ships an **exact dependency graph** — hashed all the way down to `glibc`
- Reproducible by construction: same inputs → same output, this year or next
- Isolates at **build time** — the unit is a **`/nix/store` path**
- A `.nix` file is a declarative expression that _is_ the build

</div>
</div>

<div class="opacity-60 text-sm pt-4">Docker pins the <b>outcome</b> · Nix pins the <b>process that produces it</b>.</div>

---

# Anatomy of a flake <Ico name="snowflake" class="text-2xl" />

> A flake is just an attrset with two keys

```nix
{
  inputs = {                                 # what this flake depends on
    nixpkgs.url      = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
  };

  outputs = { self, nixpkgs, ... }: {        # a function → what it produces
    packages.x86_64-linux.default  = …;      #  → nix build
    devShells.x86_64-linux.default = …;      #  → nix develop
    nixosConfigurations.laptop     = …;      #  → nixos-rebuild switch
  };
}
```

- **`inputs`** — other flakes, each pinned in `flake.lock` to an exact git rev + hash
- **`outputs`** — a **function of the resolved inputs**, returning a well-known schema the CLI knows how to consume
- **Pure &amp; hermetic** — no ambient `<nixpkgs>`, no network mid-eval → the lock makes it reproducible anywhere
- **Field note:** a `flake.nix` in a GitHub repo is a reliable sign the maintainer is an extremely cool person <Ico name="sunglasses" />

---

# Two doors, one store <Ico name="door-open" class="text-2xl" />

<div class="grid grid-cols-2 gap-8 max-w-4xl mx-auto pt-6">
<div>

### <Ico name="key" /> input-addressed — the default
path = hash of the **recipe**: every input, flag &amp; compiler. Known **before** building — it's right there in the `.drv`'s `outputs`. The whole store &amp; cache system runs on it.

</div>
<div>

### <Ico name="fingerprint" /> content-addressed — opt-in
path = hash of the **output bytes**. Known only **after** building. Today's everyday case: **fixed-output** fetchers — a source tarball's declared `sha256`.

</div>
</div>

<div class="text-center opacity-70 pt-8">name a path by <b>what goes in</b> — or by <b>what comes out</b> · both live in the same <code>/nix/store</code></div>

<div class="text-center opacity-60 text-sm pt-2">the bridge between the doors: a <b>realisation</b> — a signed record mapping "output of drv <code>X</code>" → content path</div>

<!--
The two-hashes distinction, made explicit — people conflate them constantly.

**Input-addressed** (the default): the address is a hash of the *recipe* — known before the build starts, everyone agrees on it, cache lookup is a pure name check. Subtle consequence: the same address can, in principle, hold different bytes if a build isn't perfectly reproducible — which is why caches *sign* their paths and why reproducible-builds work matters.

**Content-addressed**: the address is a hash of the *bytes produced* — it can't exist until after the build, but it's self-verifying: the bytes either hash to the name or they don't, no signature needed. The everyday case: `fetchurl`-style **fixed-output derivations**, where the content hash is declared up front and the fetch must match it. Full **`ca-derivations`** (every build content-addressed) is still experimental; nixpkgs is overwhelmingly input-addressed today.

The payoff CA is chasing — *early cutoff*: under IA, adding a comment to glibc changes glibc's recipe hash, so every downstream address changes and the whole world rebuilds. Under CA, the rebuilt glibc comes out bit-identical → same content hash → same path → dependents' cache stays valid. The bridge between the two worlds is a **realisation** — a record mapping "output of drv X" to a content path, with signatures.
-->
