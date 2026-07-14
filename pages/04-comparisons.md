---
layout: center
class: text-center
---

<SectionBookend image="/alice-looking-glass.png" title="Through the looking-glass" subtitle="Nix, mirrored against Docker, npm & friends" />

---

# The traditional way <span class="text-2xl">🔥</span>

> _"…but it works on my machine"_

<div class="opacity-70 pt-1">☝️ this is the <b>entropy</b> we mean — unrecorded change piling up until no one can explain the machine. Its four favorite faces:</div>

<div class="grid grid-cols-2 gap-x-10 gap-y-6 pt-4">
<div>

### 🎲 one global, mutable pile
`/usr/lib` is a shared variable every install mutates — apps fight over one copy of everything

</div>
<div>

### 🧟 zombie machines
a system is the sum of every command ever run on it — still shambling, but nobody remembers why it's alive

</div>
<div>

### 🔧 build-system roulette
your gcc 13 vs CI's gcc 12 · system openssl vs brew's — "install the deps" means something different everywhere

</div>
<div>

### 🙏 setup by folklore
a README of steps, a wiki page, that one teammate who remembers — replayed by hand, drifting every time

</div>
</div>

<div class="opacity-60 text-sm pt-8">Nothing pins anything, so everything drifts. Every tool in this section is an attempt to fix some of this — Nix goes after the root.</div>

<!--
Open with the shared pain — every hand in the room has lost a day to one of these quadrants.

Name the villain explicitly: this slide is the **entropy** from the "Extropy Harvesting" slide, out in the wild. "It works on my machine" *is* entropy talking — the machine works for reasons nobody recorded, so the knowledge exists only as accumulated accident. Every untracked `apt install`, every hand-edit in `/etc`, every "just run this once" adds disorder that can't be replayed, only archaeologically excavated.

The common root cause: implicit, mutable, global state. The build "works" because of what *happens* to be installed, at whatever version happens to be there, configured by whoever touched the box last. Nothing records the real inputs, so nothing can reproduce them.

Frame for the section: npm, Ansible, Terraform, Docker each attack a slice of this — per-language deps, machine setup, infra, snapshots. Keep the four quadrants in mind as each comparison goes by.
-->

---

# A flake ≈ `package.json` — for anything Nix builds

> _If you've used npm, you already know the shape of this_

<div class="grid grid-cols-2 gap-8 mt-2">
<div>

### 📦 Node
- `package.json` — declares **inputs** (deps) & **outputs** (scripts, bin)
- `package-lock.json` — pins every dep to an **exact** version + hash
- `npm ci` — rebuild the exact tree anywhere

```json
// package.json
{
  "dependencies": { "left-pad": "^1.3.0" }
}
```

</div>
<div>

### ❄️ Nix
- `flake.nix` — declares **inputs** (other flakes) & **outputs** (packages, devShells, whole NixOS systems)
- `flake.lock` — pins every input to an **exact** git rev + hash
- `nix build` / `develop` — rebuild it anywhere

```nix
# flake.nix
{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs";
  outputs = { nixpkgs, ... }: { /* … */ };
}
```

</div>
</div>

<div class="opacity-60 text-sm pt-2">Same idea, bigger reach: the same lockfile discipline scales from <b>one dev shell</b> all the way up to <b>a whole NixOS machine</b> — not just one language's libraries.</div>

---

# …and vs npm <span class="text-2xl">📦</span>

> You already met the `package.json` analogy — under the hood the **models** are worlds apart

<div class="grid grid-cols-2 gap-10 mt-2">
<div>

### 📦 npm / `node_modules`
- Deps live in a per-project **`node_modules`** — nested, duplicated, mutated in place
- Version **ranges** (`^1.3.0`) → the tree drifts unless the lockfile holds it
- **Phantom deps** — you can `require` a package you never declared (it got hoisted)
- `postinstall` runs **arbitrary code** at install time — supply-chain surface
- Only the JS layer — a native `.node` addon still needs system libs &amp; a compiler

</div>
<div>

### ❄️ Nix
- One shared **`/nix/store`**, content-addressed — every version coexists, shared not copied
- Every input **pinned by hash** in `flake.lock`; the store path _is_ the identity
- **No phantom deps** — a build sees only what it declared; nothing ambient leaks in
- Builds run in a **sandbox** — no network, no arbitrary install-time side effects
- Packages the **whole closure** down to `glibc`, not just the JS

</div>
</div>

<div class="opacity-60 text-sm pt-4">npm resolves a <b>tree per project</b> you hope matches the lock · Nix resolves a <b>graph — shared &amp; hashed</b> — that can't drift.</div>

---

# …and vs Ansible / Vagrant <span class="text-2xl">🛠️</span>

> Same goal — a machine set up _just so_ — but they **run steps**; Nix **declares a result**

<div class="grid grid-cols-2 gap-10 mt-2">
<div>

### 📜 Ansible
- Playbooks **run top-to-bottom** — order &amp; current state matter; re-runs only _hope_ to be idempotent
- "Configured" = whatever the tasks _did_, not a value you can inspect or diff
- Roles don't really compose — no merge/override, you just append more tasks

### 📦 Vagrant
- One imperative `Vagrantfile` per box; provisioners are **shell scripts** mutating a VM
- No generations, no shared graph — reprovision and pray

</div>
<div>

### ❄️ Nix
- The system **is a value** — evaluated, not executed → same config, same machine
- **Modules merge &amp; override** — compose configs across hosts, no copy-paste drift
- **Atomic** switch + rollback; nothing is mutated in place
- One graph from bootloader → dotfiles, where the others stop at "packages installed"

</div>
</div>

<div class="opacity-60 text-sm pt-4">Imperative tools automate the <b>steps</b> to a machine · Nix <b>defines the machine</b> and derives the steps.</div>

---

# …and vs Terraform <span class="text-2xl">🌍</span>

> The closest cousin — both **declare**, not script — but they declare **different layers**

<div class="grid grid-cols-2 gap-10 mt-2">
<div>

### 🏗️ Terraform
- Declarative like Nix — but for **cloud infra**: VMs, networks, DNS, buckets
- Source of truth is a **mutable state file** → **drift** when reality diverges; `refresh` / `import` to reconcile
- Pins _provider_ versions, not the **software inside** the box — the AMI/image is still an opaque blob
- `apply` mutates live resources in place; rollback = re-apply the old config

</div>
<div>

### ❄️ Nix
- Declares what's **inside** the machine — packages, services, users, dotfiles — hashed to `glibc`
- **No external state file** — the `/nix/store` _is_ the state; the config fully determines it
- Reproducible by content hash, not "whatever the image happened to contain"
- **Atomic** generation switch + instant rollback

</div>
</div>

<div class="opacity-60 text-sm pt-4">Not rivals — <b>pair them</b>: Terraform provisions the <b>box</b> ☁️, Nix (via <code>nixos-anywhere</code>) defines what <b>runs inside</b> it.</div>

---

# Docker vs Nix <span class="text-2xl">🐳❄️</span>

> Two very different routes to the same goal

<div class="grid grid-cols-2 gap-10 mt-2">
<div>

### 🐳 Docker
- Ships a **filesystem snapshot** — an opaque image, layer on layer
- Reproducible-_ish_: `FROM ubuntu:22.04` + `apt install` drifts as upstream moves
- Isolates at **runtime** — the unit is a running **container**
- A `Dockerfile` is an imperative script that _happens_ to leave an image behind

</div>
<div>

### ❄️ Nix
- Ships an **exact dependency graph** — hashed all the way down to `glibc`
- Reproducible by construction: same inputs → same output, this year or next
- Isolates at **build time** — the unit is a **`/nix/store` path**
- A `.nix` file is a declarative expression that _is_ the build

</div>
</div>

<div class="opacity-60 text-sm pt-4">Docker pins the <b>outcome</b> · Nix pins the <b>process that produces it</b>.</div>

---

# Docker ➕ Nix — better together

> Not either/or — the store travels **both** directions

<div class="grid grid-cols-2 gap-8 mt-2">
<div>

### ❄️ → 🐳 Nix builds the image
`dockerTools.buildLayeredImage` — an OCI image straight from Nix. No `Dockerfile`, just your **exact closure** (a few MB, no base distro) as reproducible layers.

```nix
dockerTools.buildLayeredImage {
  name = "my-app";
  contents = [ pkgs.my-app ];
  config.Cmd = [ "/bin/my-app" ];
}
```

</div>
<div>

### 🐳 → ❄️ Nix inside the container
The **devcontainer feature** drops Nix into any image — reproducible tooling in Docker, Codespaces & CI, no NixOS required.

```jsonc
// .devcontainer/devcontainer.json
"features": {
  "ghcr.io/devcontainers/features/nix:1": {
    "packages": "nodejs_24,git"
  }
}
```

</div>
</div>

<div class="opacity-60 text-sm pt-2">Nix as the <b>builder</b> 🔧 or Nix as the <b>guest</b> 🏠 — hermetic builds, universal runtime.</div>
