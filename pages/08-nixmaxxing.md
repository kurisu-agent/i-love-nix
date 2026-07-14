---
layout: center
class: text-center
---

<SectionBookend image="/alice-nixmaxxing.png" title="NixMaxxing" subtitle="power moves for going all-in" />

---
layout: center
class: text-center
---

# NixMaxxing <span class="text-3xl">💪</span>

<div class="opacity-80 text-xl pt-2">when "it works" isn't enough — declare <em>everything</em></div>

<div class="grid grid-cols-2 gap-x-10 gap-y-2 text-left max-w-2xl mx-auto pt-8">
<div>🏠 dotfiles → <b>Home Manager</b></div>
<div>🍎 your Mac → <b>nix-darwin</b></div>
<div>🔐 secrets → <b>sops-nix / agenix</b></div>
<div>🌐 the whole fleet → <b>clan.lol</b></div>
<div>💾 disks → <b>disko</b></div>
<div>🚀 any remote box → <b>nixos-anywhere</b></div>
<div>🖥️ patch your compositor → <b>COSMIC-comp overlay</b></div>
<div>📦 dev shells → <b>devenv / direnv</b></div>
</div>

<div class="opacity-60 text-sm pt-8">no config left behind — now let's go deeper…</div>

---

# The dendritic pattern <span class="text-2xl">🌳</span>

> One rule: **every file is a flake-parts module** — so a file is a _feature_, not a machine

```nix
# modules/japanese-input.nix — one aspect, every layer it touches
{
  flake.modules.nixos.desktop = { … };          # the system side
  flake.modules.homeManager.base = { … };       # the user side
}
```

- **Cross-cutting, solved** — one file configures NixOS + Home Manager + nix-darwin together, instead of the same feature scattered across three trees
- **Auto-imported** — no `imports = [ … ]` bookkeeping; move or rename files freely, the path is just a label
- **Scales without reorganizing** — one laptop or a whole fleet, same shape

<div class="opacity-60 text-sm pt-4"><a href="https://github.com/mightyiam/dendritic">github.com/mightyiam/dendritic</a> · built on <a href="https://flake.parts">flake-parts</a> + <a href="https://github.com/vic/import-tree">import-tree</a></div>

<!--
The usual config repo is organized by *machine* or by *layer* (nixos/ vs home/), so one logical feature — say Japanese input — ends up as three fragments in three trees that have to be kept in sync by hand.

Dendritic flips the axis: every file is a flake-parts module describing one *feature*, and it contributes option values to whichever layers it touches. The module system itself becomes the coordination layer across NixOS, Home Manager, and nix-darwin.

Because files are auto-imported (import-tree), the tree structure carries zero semantics — it's pure documentation. Several community maintainers have adopted it and it pairs naturally with the flake-parts style you saw in the nix-common example earlier.
-->

---
layout: center
class: text-center
---

# Going deeper

<div class="opacity-70 text-xl pt-2">the parts still under construction</div>

<div class="pt-6 text-sm opacity-50">🚧 the following are <b>TODO</b> placeholders</div>

---

# `nix-ld` — running foreign binaries <span class="text-xs font-bold px-2 py-1 rounded bg-amber-400 text-black align-middle">🚧 TODO</span>

- Pre-built dynamic executables can't find `ld.so` / their libs on NixOS
- `nix-ld` = shim loader + `NIX_LD_LIBRARY_PATH` to satisfy them
- **Hint:** this is the trick for getting **Claude Code** (and similar tooling) to run on NixOS

---

# Overlays vs patches <span class="text-xs font-bold px-2 py-1 rounded bg-amber-400 text-black align-middle">🚧 TODO</span>

> _Painting the roses_ — change a package without forking the world

- **Overlay:** override / extend a package in the package set
- **Patch:** modify source before the build (`patches = [ … ]`)
- **Case study:** the "Tempest" fix — write up overlay-vs-patch trade-off

<div class="grid grid-cols-2 gap-8 pt-4 text-left">
<div>

### 🌳 a device-tree overlay

```nix
hardware.deviceTree = {
  enable = true;
  overlays = [{
    name = "enable-spi";
    dtsFile = ./spi-on.dtso;
  }];
};
```

<div class="opacity-60 text-sm pt-1">ARM board: amend the <b>hardware description</b> — no vendor image, no fork</div>

</div>
<div>

### 🩹 a kernel patch

```nix
boot.kernelPatches = [{
  name = "fix-suspend";
  patch = ./0001-fix-suspend.patch;
}];
```

<div class="opacity-60 text-sm pt-1">the kernel is <b>just another package</b> — re-applied automatically on every update</div>

</div>
</div>

<!--
Both examples are the cosmic-comp story from the intro, at lower levels of the stack.

Device-tree overlays: on ARM/embedded boards the DT describes the hardware to the kernel. Vendors make you rebuild a boot image to change it; NixOS takes a `.dtso` file as declarative config and splices it in on every rebuild — same pattern as any overlay: describe the delta, never fork the base.

Kernel patches: `boot.kernelPatches` rebuilds the kernel derivation with your patch in `patches = [ … ]`. The point isn't that you *can* patch a kernel — any distro can — it's that the patch is *declared*: every kernel update re-applies it, and rolling back the generation rolls back the kernel. (Fair warning to deliver aloud: you're now building your own kernel — that's real compile time unless a cache serves it.)
-->


---

# Two doors, one store <span class="text-xs font-bold px-2 py-1 rounded bg-amber-400 text-black align-middle">🚧 TODO</span>

> Input-addressed vs **content-addressed** derivations

- **IA:** path = hash of _inputs_ (recipe) → known _before_ building
- **CA:** path = hash of _output content_ → known only _after_ building
- Both coexist in the same `/nix/store` and the same dependency graph
- **Hint:** the bridge between them is a record called a **realisation**

---

# Realisations & mixed graphs <span class="text-xs font-bold px-2 py-1 rounded bg-amber-400 text-black align-middle">🚧 TODO</span>

- CA outputs carry **realisation** records: `(drv-output-id → path, signatures)`
- **IA → CA** works via **placeholder strings** rewritten to the real path at build time
- **Substitution:** IA = pure path lookup · CA = "realise drv X" round trip first
- **Trust:** independent builders agreeing on a content hash = evidence of reproducibility

---

# Perfect refactors → the same hash <span class="text-xs font-bold px-2 py-1 rounded bg-amber-400 text-black align-middle">🚧 TODO</span>

> The Cheshire grin — same output even when the recipe changed

- **IA pain:** a comment change in `glibc` → invalidated hash → _the whole world rebuilds_
- **CA payoff:** bit-identical output → same content hash → dependents reuse cache (**early cutoff**)
- **Status:** `ca-derivations` still experimental; nixpkgs is overwhelmingly IA today
