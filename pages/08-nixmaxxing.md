---
layout: center
class: text-center
---

<SectionBookend image="/alice-nixmaxxing.png" title="NixMaxxing" subtitle="power moves for going all-in" />

---
layout: center
class: text-center
---

# NixMaxxing <Ico name="barbell" class="text-3xl" />

<div class="opacity-80 text-xl pt-2">when "it works" isn't enough — declare <em>everything</em></div>

<div class="grid grid-cols-2 gap-x-10 gap-y-2 text-left max-w-2xl mx-auto pt-8">
<div><Ico name="house" /> dotfiles → <b>Home Manager</b></div>
<div><Ico name="logos:apple" /> your Mac → <b>nix-darwin</b></div>
<div><Ico name="lock-key" /> secrets → <b>sops-nix / agenix</b></div>
<div><Ico name="globe" /> the whole fleet → <b>clan.lol</b></div>
<div><Ico name="floppy-disk" /> disks → <b>disko</b></div>
<div><Ico name="rocket-launch" /> any remote box → <b>nixos-anywhere</b></div>
<div><Ico name="desktop" /> patch your compositor → <b>COSMIC-comp overlay</b></div>
<div><Ico name="package" /> dev shells → <b>devenv / direnv</b></div>
</div>

<div class="opacity-60 text-sm pt-8">no config left behind — now let's go deeper…</div>

---

# The dendritic pattern <Ico name="tree" class="text-2xl" />

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
- Usual repos split by machine/layer — one feature scattered across three trees, synced by hand
- Dendritic: every file is a flake-parts module for one feature, feeding whichever layers it touches
- Auto-imported (import-tree), so the tree is pure documentation — move/rename files freely
-->

---
layout: center
class: text-center
---

# Going deeper

<div class="opacity-70 text-xl pt-2">the parts still under construction</div>

<div class="pt-6 text-sm opacity-50"><Ico name="barricade" /> the following are <b>TODO</b> placeholders</div>

---

# `nix-ld` — running foreign binaries <span class="text-xs font-bold px-2 py-1 rounded bg-amber-400 text-black align-middle"><Ico name="barricade" /> TODO</span>

- Pre-built dynamic executables can't find `ld.so` / their libs on NixOS
- `nix-ld` = shim loader + `NIX_LD_LIBRARY_PATH` to satisfy them
- **Hint:** this is the trick for getting **Claude Code** (and similar tooling) to run on NixOS

---

# Overlays vs patches <span class="text-xs font-bold px-2 py-1 rounded bg-amber-400 text-black align-middle"><Ico name="barricade" /> TODO</span>

> _Painting the roses_ — change a package without forking the world

- **Overlay:** override / extend a package in the package set
- **Patch:** modify source before the build (`patches = [ … ]`)
- **Case study:** the "Tempest" fix — write up overlay-vs-patch trade-off

<div class="grid grid-cols-2 gap-8 pt-4 text-left">
<div>

### <Ico name="tree" /> a device-tree overlay

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

### <Ico name="bandaids" /> a kernel patch

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
- Same cosmic-comp story from the intro, deeper in the stack: describe the delta, never fork the base
- Device-tree overlay: declarative `.dtso` spliced in on every rebuild — no vendor boot image
- Kernel patch is *declared*: re-applied every update, rolls back with the generation — warn: real compile time without a cache
-->


---

# Two doors, one store <span class="text-xs font-bold px-2 py-1 rounded bg-amber-400 text-black align-middle"><Ico name="barricade" /> TODO</span>

> Input-addressed vs **content-addressed** derivations

- **IA:** path = hash of _inputs_ (recipe) → known _before_ building
- **CA:** path = hash of _output content_ → known only _after_ building
- Both coexist in the same `/nix/store` and the same dependency graph
- **Hint:** the bridge between them is a record called a **realisation**

---

# Realisations & mixed graphs <span class="text-xs font-bold px-2 py-1 rounded bg-amber-400 text-black align-middle"><Ico name="barricade" /> TODO</span>

- CA outputs carry **realisation** records: `(drv-output-id → path, signatures)`
- **IA → CA** works via **placeholder strings** rewritten to the real path at build time
- **Substitution:** IA = pure path lookup · CA = "realise drv X" round trip first
- **Trust:** independent builders agreeing on a content hash = evidence of reproducibility

---

# Perfect refactors → the same hash <span class="text-xs font-bold px-2 py-1 rounded bg-amber-400 text-black align-middle"><Ico name="barricade" /> TODO</span>

> The Cheshire grin — same output even when the recipe changed

- **IA pain:** a comment change in `glibc` → invalidated hash → _the whole world rebuilds_
- **CA payoff:** bit-identical output → same content hash → dependents reuse cache (**early cutoff**)
- **Status:** `ca-derivations` still experimental; nixpkgs is overwhelmingly IA today
