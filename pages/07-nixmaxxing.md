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
