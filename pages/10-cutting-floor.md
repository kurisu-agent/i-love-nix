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
curl -fsSL https://install.determinate.systems/nix | sh -s -- install
```

</div>
<div>

### <Ico name="simple-icons:nixos" /> NixOS
The **whole OS** is Nix — config to bootloader. More on that in a moment.

</div>
</div>

<div class="opacity-60 text-sm pt-8">Try it on the machine you already have — going full NixOS is the deep end, not the entry fee.</div>

<!--
- Determinate Systems installer is the de-facto standard — APFS volume on macOS, survives upgrades, real uninstaller, flakes on by default
- nix-darwin: NixOS module system on the Mac — declarative packages, launchd, `defaults`, `darwin-rebuild switch`
- nix-darwin layers on top of the standalone install; gets its own ecosystem slide
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
- Expressions, not statements — the whole file is ONE expression
- Its value is the attrset at the bottom
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
- ~100 `builtins`, always in scope, no imports — the whole stdlib
- Impure-looking ones (`readFile`, `fetchGit`) stay pure: what they return becomes a hashed input
- `builtins.derivation` is the ur-primitive; `nixpkgs.lib` (`mkIf`, `mapAttrs`) is the community layer on top
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

```mermaid {scale: 0.7}
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
- The whole machine is ONE `system` derivation through the same evaluate → realise → activate pipeline
- Nothing is live until activation — a failed build changes nothing; previous generation is one reboot away
- Variants: `boot` = apply next reboot · `test` = activate without a boot entry
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

### <Ico name="simple-icons:ansible" style="color:#e00" /> Ansible
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
- Input-addressed (default): hash of the recipe, known before building — the whole cache runs on it
- Content-addressed (opt-in): hash of the output bytes, self-verifying — today mostly fixed-output fetchers
- CA chases early cutoff: a bit-identical rebuild keeps its path, so dependents don't rebuild; a realisation bridges the two
-->

---
layout: center
class: text-center
---

# Where to go next

[nix.dev](https://nix.dev) · [Zero to Nix](https://zero-to-nix.com) · [nixos.org](https://nixos.org)

Thanks!

<!--
Cut as a standalone slide — the links now live in the NixCon slide's footer at the end of the ecosystem tour.
-->

---
layout: center
---

<div class="absolute inset-0 grid grid-cols-2 gap-0 items-stretch" style="background: #EDF2FA;">
  <div class="flex flex-col justify-center p-14">
    <div class="h-10 flex items-center gap-3 px-4" style="background: #27385D;">
      <Ico name="wrench" class="text-base text-white" />
      <span class="font-mono text-xs tracking-widest text-white">my world</span>
    </div>
    <div class="bg-white p-8 text-left text-xl leading-relaxed" style="color: #0D1B2E;">
      Patch the source, rebuild, repeat after every update. <b>Forever.</b>
    </div>
    <div class="h-9 flex items-center px-4 font-mono text-xs tracking-widest" style="background: #e2e8f0; color: #475569;">by hand</div>
  </div>
  <div class="flex flex-col justify-center p-14">
    <div class="h-10 flex items-center gap-3 px-4" style="background: #5277C3;">
      <simple-icons-nixos class="text-base text-white" />
      <span class="font-mono text-xs tracking-widest text-white">a friend on nixos</span>
    </div>
    <div class="bg-white p-8 text-left text-xl leading-relaxed" style="color: #0D1B2E;">
      A ~10-line <b>overlay</b> — declared once, re-applied on every rebuild.
    </div>
  </div>
</div>

<!--
Cut from the themed rabbit-hole section — replaced by a [todo: COSMIC window manager screenshot] placeholder; the my-world / a-friend contrast moved into that slide's speaker notes.
-->

---
layout: center
class: text-center
---

<div class="absolute inset-0 grid grid-cols-10">
  <div class="col-span-4 relative" style="background: #5277C3;">
    <div class="absolute top-12 left-12"><simple-icons-nixos class="text-5xl text-white" /></div>
    <div class="absolute bottom-12 left-12 text-left">
      <div class="font-mono text-sm tracking-[0.4em]" style="color: #7EBAE4;">SECTION 00</div>
      <div class="text-7xl font-black text-white leading-none pt-3">theme</div>
    </div>
  </div>
  <div class="col-span-6" style="background: url(/alice-looking-glass.png) center / cover no-repeat;"></div>
</div>

<!--
Theme-development scaffolding (was pages/00-theme.md) — the example and template slides all graduated into the live sections; only this divider (for the style rules below) and the swatch are kept. Style rules:
- palette: nix-logo-blue only (see swatch next slide) — flat fills, no gradients, no shadows
- blocky: square corners everywhere, full-bleed blocks, hard edges between color/image areas
- no slide titles — a small mono microlabel (lowercase, tracking-widest) is the only text chrome
- images and logos carry the slide; text is a caption at most
- section dividers are a solid color block + a full-bleed image, hard-split
- recurring brand mark: the white snowflake on a nix-blue block — accent on dividers, watermark on image blocks, checkmark in tables

-->

---
layout: center
---

<div class="absolute inset-0 grid grid-cols-[1fr_1fr_2fr_1fr_1fr]">
  <div class="relative" style="background: #0D1B2E;">
    <div class="absolute bottom-10 left-8 text-left font-mono text-xs leading-relaxed text-white">ink<br />#0D1B2E</div>
  </div>
  <div class="relative" style="background: #27385D;">
    <div class="absolute bottom-10 left-8 text-left font-mono text-xs leading-relaxed text-white">deep<br />#27385D</div>
  </div>
  <div class="relative" style="background: #5277C3;">
    <div class="absolute bottom-10 left-8 text-left font-mono text-xs leading-relaxed text-white">nix<br />#5277C3</div>
    <div class="absolute top-10 left-8"><simple-icons-nixos class="text-4xl text-white" /></div>
  </div>
  <div class="relative" style="background: #7EBAE4;">
    <div class="absolute bottom-10 left-8 text-left font-mono text-xs leading-relaxed" style="color: #0D1B2E;">sky<br />#7EBAE4</div>
  </div>
  <div class="relative" style="background: #EDF2FA;">
    <div class="absolute bottom-10 left-8 text-left font-mono text-xs leading-relaxed" style="color: #0D1B2E;">paper<br />#EDF2FA</div>
  </div>
</div>

<!--
The swatch. `nix` (#5277C3) and `sky` (#7EBAE4) are the two blues of the official snowflake logo; `ink`, `deep`, and `paper` are derived from them — a darkened navy scale and a near-white cool tint. The nix column is double-width: it's the primary. No accent color outside this scale.
-->

---

<PbjTime />

<!--
Cut from Why people love it — the peanut-butter-&-jelly payoff that followed the "LLMs ❤️ Nix" slide (its punchline used to end "they go together like…").
-->

---
layout: center
---

<Wilhelmus />

<div class="absolute inset-0 p-14 grid grid-cols-3 grid-rows-2 gap-3">
  <div v-click style="background: url(/dutch-windmills.jpg) center / cover no-repeat;"></div>
  <div v-click style="background: url(/dutch-tulips.jpg) center / cover no-repeat;"></div>
  <div v-click style="background: url(/dutch-clogs.jpg) center / cover no-repeat;"></div>
  <div v-click style="background: url(/dutch-gouda.jpg) center / cover no-repeat;"></div>
  <div v-click style="background: url(/dutch-beurs.jpg) center / cover no-repeat;"></div>
  <div v-click class="flex items-center justify-center" style="background: #5277C3;">
    <simple-icons-nixos class="text-7xl text-white" />
  </div>
</div>

<!--
Cut from Meet Nix — the Dutch-appreciation gag. Wilhelmus swells, say nothing. Click the Dutch icons in one by one — windmills, tulips, clogs, gouda, the world's first stock market (De Witte's 1653 Amsterdam exchange) — then the Netherlands' latest gift: reproducible builds. The whole origin story is Dutch (Utrecht, "niks" = nothing); they also invented tulip mania.
Photos: Wikimedia Commons. Audio: US Navy Band "Het Wilhelmus", public domain, via Wikimedia Commons.
The punchline cell is a flat nix block with the snowflake; each cell reveals on click. The Wilhelmus component's animated waving flag shows through the frame and gaps behind the grid.
-->

---
layout: center
---
<div class="absolute inset-0 flex flex-col" style="background: #EDF2FA;">
  <div class="flex h-10 gap-2 m-2">
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="books" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="house" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="terminal" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="pen-nib" class="text-sm" /></div>
    <div class="flex-none flex items-center justify-center gap-2 px-4 text-white" style="background: #5277C3;"><Ico name="magnifying-glass" class="text-sm" /><span class="font-mono text-xs tracking-widest">ergonomics</span></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="apple-logo" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="shipping-container" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="cloud-arrow-down" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="lock-key" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="hard-drives" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="fire" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="users-three" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="rocket-launch" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="share-network" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="confetti" class="text-sm" /></div>
  </div>
  <div class="flex-1 grid grid-cols-2 gap-10 items-center px-14 py-10">
    <div class="text-left">
      <div class="text-xl leading-relaxed" style="color: #0D1B2E;">The small tools that make daily Nix pleasant.</div>
      <div class="mt-5 space-y-2 font-mono text-sm" style="color: #27385D;">
        <div>search.nixos.org — find any package or option</div>
        <div>comma (,) — run anything uninstalled: , cowsay hi</div>
        <div>nh — nicer rebuild / switch, pretty diffs</div>
      </div>
    </div>
    <div class="relative h-full" style="background: #5277C3;">
      <simple-icons-nixos class="absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 text-8xl text-white" />
      <div class="absolute bottom-4 left-5 font-mono text-xs tracking-widest" style="color: #7EBAE4;">img: search.nixos.org + , + nh</div>
    </div>
  </div>
</div>

<!--
- search.nixos.org — find any package or option
- comma (`,`) — run anything without installing
- nh — nicer rebuilds with diffs and smarter GC
-->

---
layout: center
---

<div class="absolute inset-0 flex items-center justify-center" style="background: #EDF2FA;">
  <div class="w-[680px]">
    <div class="h-10 flex items-center gap-3 px-4" style="background: #5277C3;">
      <Ico name="puzzle-piece" class="text-base text-white" />
      <span class="font-mono text-xs tracking-widest text-white">composable</span>
    </div>
    <div class="text-left text-lg leading-relaxed bg-white px-8 py-6" style="color: #0D1B2E;">

- **Modules merge** — a hundred `.nix` files fold into one system
- **Overlays &amp; `overrideAttrs`** — bend any package without forking
- **Flake inputs** — pull in someone's whole system as a dependency
- **The boundaries dissolve** — app, module, deployment, OS all compose the same way

</div>
  </div>
</div>

<!--
Cut from Why people love it — the "composable" step's bullet slide. Its bullets were absorbed into the boundaries-dissolve example slide (moved there from Meet Nix) when the stepper collapsed to the landing page's three words.
-->

---
layout: center
---

<div class="absolute inset-0 flex items-center justify-center" style="background: #EDF2FA;">
  <div class="w-[680px]">
    <div class="h-10 flex items-center gap-3 px-4" style="background: #5277C3;">
      <Ico name="gift" class="text-base text-white" />
      <span class="font-mono text-xs tracking-widest text-white">shareable</span>
    </div>
    <div class="text-left text-lg leading-relaxed bg-white px-8 py-6" style="color: #0D1B2E;">

- Your whole machine is **one repo** — push it, someone else can `nix build` it verbatim
- Publish reusable **modules** as flake outputs; others `import` them like a library
- The `flake.lock` travels too → **byte-identical** inputs, never "works on my machine"

</div>
  </div>
</div>

<!--
Cut from Why people love it — the "shareable" step's bullet slide. Merged into the nix-common example slide's speaker notes when the stepper collapsed to reproducible / declarative / reliable.
-->

---
layout: center
class: text-center
---

<div class="absolute inset-0 flex flex-col items-center justify-center gap-8 bg-white">
  <div class="w-[900px] h-[232px]" style="background: url(/nixos-org-pitch-cropped.png) center / contain no-repeat;"></div>
  <div class="font-mono text-xs tracking-widest" style="color: #27385D;">nixos.org — above the fold</div>
</div>

<!--
Cut from Why people love it — the whole-homepage screenshot intro. Replaced by three per-step pillar slides built from nixos.org's raw SVG icons and verbatim copy (public/pillar-*.svg), so the section now opens directly on the reproducible step.
-->

---
layout: center
---

<div class="absolute inset-0 grid grid-cols-2 gap-10 items-center px-14 py-10" style="background: #EDF2FA;">
  <div class="text-left text-xl leading-relaxed" style="color: #0D1B2E;">
    Builds run in <b>isolation</b> — nothing undeclared can leak in. Same inputs → the same output, <b>bit for bit</b>: works on one machine, works on <b>every</b> machine.
  </div>
  <div class="h-full" style="background: url(/love-reproducible.png) center / cover no-repeat;"></div>
</div>

<!--
Cut from Why people love it — the reproducible step's Alice explainer (Tweedledum & Tweedledee holding identical hash-cubes). Redundant once the nixos.org pillar slide states the same claim; the step keeps only demonstrations.
-->

---
layout: center
---

<div class="absolute inset-0 grid grid-cols-2 gap-10 items-center px-14 py-10" style="background: #EDF2FA;">
  <div class="text-left text-xl leading-relaxed" style="color: #0D1B2E;">
    Your whole machine in one config. No snowflake servers, no config drift — the system <b>is</b> the code.
  </div>
  <div class="h-full" style="background: url(/love-declarative.png) center / cover no-repeat;"></div>
</div>

<!--
Cut from Why people love it — the declarative step's Alice explainer (quill materializing a desktop). Redundant next to the nixos.org pillar slide.
-->

---
layout: center
---

<div class="absolute inset-0 grid grid-cols-2 gap-10 items-center px-14 py-10" style="background: #EDF2FA;">
  <div class="text-left text-xl leading-relaxed" style="color: #0D1B2E;">
    Every rebuild is a new <b>generation</b>, switched in one atomic flip — never a half-upgraded system. Booted something broken? Pick the previous one from the boot menu.
  </div>
  <div class="h-full" style="background: url(/love-reliable.png) center / cover no-repeat;"></div>
</div>

<!--
Cut from Why people love it — the reliable step's Alice explainer (hall of generation doors, one smoking). Redundant next to the pillar slide; its atomic-flip content moved into the GRUB boot-menu slide's speaker note.
-->

---
layout: center
---

<div class="absolute inset-0 grid grid-cols-2">
  <div style="background: url(/build-dirty-factory.png) center / cover no-repeat;"></div>
  <div style="background: url(/build-cleanroom.png) center / cover no-repeat;"></div>
</div>

<!--
Cut from Why people love it — the first reproducibility analogy (dirty factory floor vs wafer-fab cleanroom / the sandbox as airlock). Superseded by the carpenter-vs-flat-pack slide, which covers undeclared dependencies and works-everywhere in one image pair.
-->

---
layout: center
---

<div class="absolute inset-0 flex items-center justify-center" style="background: #EDF2FA;">
  <div class="w-[760px]">
    <div class="h-10 flex items-center gap-3 px-4" style="background: #5277C3;">
      <simple-icons-nixos class="text-base text-white" />
      <span class="font-mono text-xs tracking-widest text-white">distributed builds</span>
    </div>
    <div class="text-left">

```nix
# desktop.nix — serve your store to the LAN, like a private cache.nixos.org
services.harmonia.enable = true;
boot.binfmt.emulatedSystems = [ "aarch64-linux" ];   # …and build for the phone

# android.nix / old-laptop.nix — outsource the work
nix.distributedBuilds = true;                # evaluate here, build over there
nix.buildMachines = [{
  hostName = "ssh://desktop";                # the beefy box does the lifting
  systems  = [ "x86_64-linux" "aarch64-linux" ];   # each build routes by arch
  maxJobs  = 8;
}];
nix.settings.substituters = [ "http://desktop:5000" ];   # already built? download, don't compile
```

</div>
    <div class="h-9 flex items-center px-4 font-mono text-xs tracking-widest" style="background: #e2e8f0; color: #475569;">an android phone (nix-on-droid), a 2012 laptop → full system builds in minutes</div>
  </div>
</div>

<style>
.slidev-code {
  border-radius: 0 !important;
  margin: 0 !important;
  background: white !important;
  padding: 1.25rem 1.5rem !important;
}
.slidev-code .line::before {
  color: #cbd5e1 !important;
}
</style>

<!--
Cut from Why people love it — the distributed-builds config panel, replaced by the phone ↔ desktop substitution flowchart. Keep handy as the "show me the actual config" backup: harmonia serves the LAN, buildMachines ships compilation to the desktop (arch-routed), substituters pull finished paths. On the phone it's `nix-on-droid switch`; on NixOS boxes `nixos-rebuild switch --target-host X --build-host desktop`.
-->

---
layout: center
---

<div class="absolute inset-0 flex flex-col" style="background: #EDF2FA;">
  <div class="flex h-10 gap-2 m-2">
    <div class="flex-none flex items-center justify-center gap-2 px-4 text-white" style="background: #5277C3;"><Ico name="lock-key" class="text-sm" /><span class="font-mono text-xs tracking-widest">secrets</span></div>
  </div>
  <div class="flex-1 relative" style="background: url(/site-sops-nix.png?v=2) top center / cover no-repeat;">
    <div class="absolute bottom-0 right-0 px-4 py-2 font-mono text-xs tracking-widest text-white" style="background: #0D1B2E;">github.com/Mic92/sops-nix</div>
  </div>
</div>

<!--
Cut from The ecosystem — the sops-nix secrets slide (stepper trimmed to just its own pill).
- Where passwords go in a git-committed config
- Encrypted at rest, decrypted at activation into tmpfs — never in the world-readable /nix/store
- sops-nix — many secrets & backends (age, GPG, cloud KMS); agenix the simpler alternative
-->
