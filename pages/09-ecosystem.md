---
layout: center
class: text-center
---

<div class="absolute inset-0" style="background: url(/alice-ecosystem.png) center / cover no-repeat;">
  <div class="absolute top-0 right-0 flex items-stretch">
    <div class="px-10 py-6 text-left" style="background: #0D1B2E;">
      <div class="text-5xl font-black text-white leading-none">the ecosystem</div>
    </div>
    <div class="w-20 flex items-center justify-center" style="background: #5277C3;"><simple-icons-nixos class="text-4xl text-white" /></div>
  </div>
</div>

<!--
Section divider — the ecosystem tour. Full-bleed art, slim flat overlay flush to the free top-right sky.
-->

---
layout: center
---

<div class="absolute inset-0 flex flex-col" style="background: #EDF2FA;">
  <div class="flex h-10 gap-2 m-2">
    <div class="flex-none flex items-center justify-center gap-2 px-4 text-white" style="background: #5277C3;"><Ico name="books" class="text-sm" /><span class="font-mono text-xs tracking-widest">nixpkgs</span></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="house" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="terminal" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="pen-nib" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="magnifying-glass" class="text-sm" /></div>
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
      <div class="text-xl leading-relaxed" style="color: #0D1B2E;">100k+ packages <b>+</b> every NixOS module — one repo.</div>
      <div class="mt-5 space-y-2 font-mono text-sm" style="color: #27385D;">
        <div>nixos-unstable — rolling, fresh</div>
        <div>nixos-25.05 — stable, six-monthly</div>
        <div>hydra — builds · signs · fills cache.nixos.org</div>
        <div>mix freely — pin stable + unstable</div>
      </div>
    </div>
    <div class="relative h-full" style="background: #5277C3;">
      <simple-icons-nixos class="absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 text-8xl text-white" />
      <div class="absolute bottom-4 left-5 font-mono text-xs tracking-widest" style="color: #7EBAE4;">img: branches: master → nixos-unstable → nixos-25.05</div>
    </div>
  </div>
</div>

<!--
The center of gravity: largest, freshest package collection in existence, with the NixOS module system in the same tree — so a package and its service always move together.
Hydra builds every commit, signs the outputs, and only advances a branch once it's green; you substitute exact signed binaries instead of compiling.
Mixing lands live: "stable system + unstable neovim" is just a second nixpkgs input.
Everything else on this tour builds on top of this repo.
Source: github.com/NixOS/nixpkgs
-->

---
layout: center
---

<div class="absolute inset-0 flex flex-col" style="background: #EDF2FA;">
  <div class="flex h-10 gap-2 m-2">
    <div class="flex-none flex items-center justify-center gap-2 px-4 text-white" style="background: #5277C3;"><Ico name="books" class="text-sm" /><span class="font-mono text-xs tracking-widest">nixpkgs</span></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="house" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="terminal" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="pen-nib" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="magnifying-glass" class="text-sm" /></div>
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
    <div class="text-left text-xl leading-relaxed" style="color: #0D1B2E;">
      The largest <b>and</b> freshest package set anywhere — 100k+ packages, updated fast.
    </div>
    <div class="relative h-full" style="background: #5277C3;">
      <simple-icons-nixos class="absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 text-8xl text-white" />
      <div class="absolute bottom-4 left-5 font-mono text-xs tracking-widest" style="color: #7EBAE4;">img: package-count / freshness chart</div>
    </div>
  </div>
</div>

<!--
Moved from Why people love it — the size-and-freshness pitch, now the second beat of the nixpkgs stop: not just the biggest package set, also the fastest-moving one.
-->

---
layout: center
---

<div class="absolute inset-0 flex flex-col" style="background: #EDF2FA;">
  <div class="flex h-10 gap-2 m-2">
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="books" class="text-sm" /></div>
    <div class="flex-none flex items-center justify-center gap-2 px-4 text-white" style="background: #5277C3;"><Ico name="house" class="text-sm" /><span class="font-mono text-xs tracking-widest">home manager</span></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="terminal" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="pen-nib" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="magnifying-glass" class="text-sm" /></div>
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
      <div class="text-xl leading-relaxed" style="color: #0D1B2E;">Declarative <b>dotfiles &amp; user environment</b>.</div>
      <div class="mt-5 space-y-2 font-mono text-sm" style="color: #27385D;">
        <div>shell · editor · git · packages — all in .nix</div>
        <div>per-user generations &amp; rollbacks</div>
        <div>standalone, or a NixOS / nix-darwin module</div>
      </div>
    </div>
    <div class="relative h-full" style="background: #5277C3;">
      <simple-icons-nixos class="absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 text-8xl text-white" />
      <div class="absolute bottom-4 left-5 font-mono text-xs tracking-widest" style="color: #7EBAE4;">img: Home Manager — dotfiles as code</div>
    </div>
  </div>
</div>

<!--
Dotfiles as code — the layer you reach for right after NixOS itself.
Same generations and rollbacks as the system, per-user; works standalone or as a module.
Source: github.com/nix-community/home-manager
-->

---
layout: center
---

<div class="absolute inset-0 flex flex-col" style="background: #EDF2FA;">
  <div class="flex h-10 gap-2 m-2">
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="books" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="house" class="text-sm" /></div>
    <div class="flex-none flex items-center justify-center gap-2 px-4 text-white" style="background: #5277C3;"><Ico name="terminal" class="text-sm" /><span class="font-mono text-xs tracking-widest">dev envs</span></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="pen-nib" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="magnifying-glass" class="text-sm" /></div>
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
      <div class="text-xl leading-relaxed" style="color: #0D1B2E;">Per-project toolchains, friendlier than raw <span class="font-mono">nix develop</span>.</div>
      <div class="mt-5 space-y-2 font-mono text-sm" style="color: #27385D;">
        <div>devenv — languages, services, processes</div>
        <div>devbox — package-manager UX</div>
        <div>direnv + nix-direnv — auto-activates on cd</div>
      </div>
    </div>
    <div class="relative h-full" style="background: #5277C3;">
      <simple-icons-nixos class="absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 text-8xl text-white" />
      <div class="absolute bottom-4 left-5 font-mono text-xs tracking-widest" style="color: #7EBAE4;">img: cd into a repo → the right tools just appear</div>
    </div>
  </div>
</div>

<!--
Higher-level wrappers over `nix develop`: devenv adds services like Postgres/Redis, devbox hides Nix behind a package-manager UX.
direnv + nix-direnv is the magic — the shell environment appears the moment you cd into the repo.
Sources: devenv.sh · jetify.com/devbox · github.com/nix-community/nix-direnv
-->

---
layout: center
---

<div class="absolute inset-0 flex flex-col" style="background: #EDF2FA;">
  <div class="flex h-10 gap-2 m-2">
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="books" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="house" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="terminal" class="text-sm" /></div>
    <div class="flex-none flex items-center justify-center gap-2 px-4 text-white" style="background: #5277C3;"><Ico name="pen-nib" class="text-sm" /><span class="font-mono text-xs tracking-widest">editing</span></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="magnifying-glass" class="text-sm" /></div>
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
      <div class="text-xl leading-relaxed" style="color: #0D1B2E;">Nix edited like a real language.</div>
      <div class="mt-5 space-y-2 font-mono text-sm" style="color: #27385D;">
        <div>LSP — nixd / nil</div>
        <div>formatter — nixfmt (official); alejandra</div>
        <div>linters — statix + deadnix, via treefmt-nix</div>
      </div>
    </div>
    <div class="relative h-full" style="background: #5277C3;">
      <simple-icons-nixos class="absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 text-8xl text-white" />
      <div class="absolute bottom-4 left-5 font-mono text-xs tracking-widest" style="color: #7EBAE4;">img: editor with Nix LSP + format-on-save</div>
    </div>
  </div>
</div>

<!--
Nix feels like a real language with tooling: LSP (nixd or nil) for completion and goto-def, nixfmt as the official formatter, statix + deadnix for anti-patterns and dead code, usually wired together via treefmt-nix.
Sources: nixd · nil · nixfmt · statix · deadnix
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
The small tools that make daily Nix pleasant: search for any package/option, run anything without installing via comma, and nh for nicer rebuilds with diffs and smarter GC.
Sources: search.nixos.org · comma · nh
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
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="magnifying-glass" class="text-sm" /></div>
    <div class="flex-none flex items-center justify-center gap-2 px-4 text-white" style="background: #5277C3;"><Ico name="apple-logo" class="text-sm" /><span class="font-mono text-xs tracking-widest">nix-darwin</span></div>
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
      <div class="text-xl leading-relaxed" style="color: #0D1B2E;">NixOS-style <b>declarative config for macOS</b>.</div>
      <div class="mt-5 space-y-2 font-mono text-sm" style="color: #27385D;">
        <div>system settings · packages · defaults — declarative</div>
        <div>pairs with Home Manager</div>
        <div>same Nix workflow across Linux &amp; macOS</div>
      </div>
    </div>
    <div class="relative h-full" style="background: #5277C3;">
      <simple-icons-nixos class="absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 text-8xl text-white" />
      <div class="absolute bottom-4 left-5 font-mono text-xs tracking-widest" style="color: #7EBAE4;">img: nix-darwin — declarative macOS config</div>
    </div>
  </div>
</div>

<!--
Your Mac described in one repo, the same way as NixOS — settings, packages, `defaults`.
Pair with Home Manager for the user environment; one workflow across both OSes.
Source: github.com/nix-darwin/nix-darwin
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
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="magnifying-glass" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="apple-logo" class="text-sm" /></div>
    <div class="flex-none flex items-center justify-center gap-2 px-4 text-white" style="background: #5277C3;"><Ico name="shipping-container" class="text-sm" /><span class="font-mono text-xs tracking-widest">docker</span></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="cloud-arrow-down" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="lock-key" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="hard-drives" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="fire" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="users-three" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="rocket-launch" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="share-network" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="confetti" class="text-sm" /></div>
  </div>
  <div class="flex-1 grid grid-cols-2 gap-8 items-center px-14 py-8">
    <div>
      <div class="h-10 flex items-center gap-3 px-4" style="background: #5277C3;">
        <simple-icons-nixos class="text-base text-white" />
        <span class="font-mono text-xs tracking-widest text-white">nix builds the image</span>
      </div>
      <div class="text-left">

```nix
dockerTools.buildLayeredImage {
  name = "my-app";
  contents = [ pkgs.my-app ];
  config.Cmd = [ "/bin/my-app" ];
}
```

</div>
      <div class="h-9 flex items-center px-4 font-mono text-xs tracking-widest" style="background: #e2e8f0; color: #475569;">your exact closure as reproducible layers</div>
    </div>
    <div>
      <div class="h-10 flex items-center gap-3 px-4" style="background: #27385D;">
        <Ico name="logos:docker-icon" class="text-base" />
        <span class="font-mono text-xs tracking-widest text-white">nix inside the image</span>
      </div>
      <div class="text-left">

```jsonc
// .devcontainer/devcontainer.json
"features": {
  "ghcr.io/devcontainers/features/nix:1": {
    "packages": "nodejs_24,git"
  }
}
```

</div>
      <div class="h-9 flex items-center px-4 font-mono text-xs tracking-widest" style="background: #e2e8f0; color: #475569;">drop Nix into any image — no NixOS required</div>
    </div>
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
Not either/or — the store travels both directions.
Left: Nix builds a tiny OCI image from your exact closure, no Dockerfile, no base distro.
Right: the devcontainer feature drops Nix into any image for reproducible tooling in Docker, Codespaces, CI.
Once you're building artifacts, you want to share them — next: caching.
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
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="magnifying-glass" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="apple-logo" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="shipping-container" class="text-sm" /></div>
    <div class="flex-none flex items-center justify-center gap-2 px-4 text-white" style="background: #5277C3;"><Ico name="cloud-arrow-down" class="text-sm" /><span class="font-mono text-xs tracking-widest">cachix</span></div>
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
      <div class="text-xl leading-relaxed" style="color: #0D1B2E;">Hosted <b>binary cache</b> — build once, pull everywhere.</div>
      <div class="mt-5 space-y-2 font-mono text-sm" style="color: #27385D;">
        <div>push artifacts once; laptops, CI &amp; teammates pull them</div>
        <div>slow first builds → fast cache hits</div>
      </div>
    </div>
    <div class="relative h-full" style="background: #5277C3;">
      <simple-icons-nixos class="absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 text-8xl text-white" />
      <div class="absolute bottom-4 left-5 font-mono text-xs tracking-widest" style="color: #7EBAE4;">img: cachix push/pull — build once, share everywhere</div>
    </div>
  </div>
</div>

<!--
Never compile the same thing twice — push build artifacts once, everyone pulls them.
The standard answer to "why is it building from source?"
Source: cachix.org
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
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="magnifying-glass" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="apple-logo" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="shipping-container" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="cloud-arrow-down" class="text-sm" /></div>
    <div class="flex-none flex items-center justify-center gap-2 px-4 text-white" style="background: #5277C3;"><Ico name="lock-key" class="text-sm" /><span class="font-mono text-xs tracking-widest">secrets</span></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="hard-drives" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="fire" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="users-three" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="rocket-launch" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="share-network" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="confetti" class="text-sm" /></div>
  </div>
  <div class="flex-1 grid grid-cols-2 gap-10 items-center px-14 py-10">
    <div class="text-left">
      <div class="text-xl leading-relaxed" style="color: #0D1B2E;">Encrypted in git, decrypted at activation into tmpfs.</div>
      <div class="mt-5 space-y-2 font-mono text-sm" style="color: #27385D;">
        <div>agenix — age-based, one file per secret</div>
        <div>sops-nix — SOPS-based, many secrets &amp; backends</div>
        <div>never lands in the world-readable /nix/store</div>
      </div>
    </div>
    <div class="relative h-full" style="background: #5277C3;">
      <simple-icons-nixos class="absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 text-8xl text-white" />
      <div class="absolute bottom-4 left-5 font-mono text-xs tracking-widest" style="color: #7EBAE4;">img: encrypted secret → /run/secrets at activation</div>
    </div>
  </div>
</div>

<!--
Answers "where do passwords go in a config you commit to git?" — encrypted at rest, decrypted at activation into tmpfs, never in the world-readable store.
agenix is the simplest start; sops-nix scales to many secrets and backends (age, KMS, PGP).
Sources: github.com/ryantm/agenix · github.com/Mic92/sops-nix
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
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="magnifying-glass" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="apple-logo" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="shipping-container" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="cloud-arrow-down" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="lock-key" class="text-sm" /></div>
    <div class="flex-none flex items-center justify-center gap-2 px-4 text-white" style="background: #5277C3;"><Ico name="hard-drives" class="text-sm" /><span class="font-mono text-xs tracking-widest">ncps</span></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="fire" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="users-three" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="rocket-launch" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="share-network" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="confetti" class="text-sm" /></div>
  </div>
  <div class="flex-1 grid grid-cols-2 gap-10 items-center px-14 py-10">
    <div class="text-left">
      <div class="text-xl leading-relaxed" style="color: #0D1B2E;">Self-hosted <b>pull-through cache</b> in front of cache.nixos.org.</div>
      <div class="mt-5 space-y-2 font-mono text-sm" style="color: #27385D;">
        <div>fetches on demand, then caches &amp; signs for the LAN</div>
        <div>download once → every machine substitutes locally</div>
        <div>multi-upstream · S3/local · SQLite/Postgres · Prometheus</div>
      </div>
    </div>
    <div class="relative h-full" style="background: #5277C3;">
      <simple-icons-nixos class="absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 text-8xl text-white" />
      <div class="absolute bottom-4 left-5 font-mono text-xs tracking-widest" style="color: #7EBAE4;">img: ncps — LAN pull-through cache in front of cache.nixos.org</div>
    </div>
  </div>
</div>

<!--
A local mirror between your machines and cache.nixos.org — fetches store paths on demand, then caches and signs them for the whole LAN.
Download once and every laptop, server, CI box substitutes locally.
Source: github.com/kalbasit/ncps
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
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="magnifying-glass" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="apple-logo" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="shipping-container" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="cloud-arrow-down" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="lock-key" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="hard-drives" class="text-sm" /></div>
    <div class="flex-none flex items-center justify-center gap-2 px-4 text-white" style="background: #5277C3;"><Ico name="fire" class="text-sm" /><span class="font-mono text-xs tracking-widest">impermanence</span></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="users-three" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="rocket-launch" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="share-network" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="confetti" class="text-sm" /></div>
  </div>
  <div class="flex-1 grid grid-cols-2 gap-10 items-center px-14 py-10">
    <div class="text-left">
      <div class="text-xl leading-relaxed" style="color: #0D1B2E;"><b>impermanence</b> — wipe / on every boot, keep only what you <i>declared</i>.</div>
      <div class="mt-5 space-y-2 font-mono text-sm" style="color: #27385D;">
        <div>root on tmpfs / rolled-back snapshot; reboot = clean slate</div>
        <div>persist only the dirs you explicitly list</div>
        <div>undeclared hidden state can't accumulate</div>
      </div>
    </div>
    <div class="relative h-full" style="background: #5277C3;">
      <simple-icons-nixos class="absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 text-8xl text-white" />
      <div class="absolute bottom-4 left-5 font-mono text-xs tracking-widest" style="color: #7EBAE4;">img: reboot → root wiped → only declared state survives</div>
    </div>
  </div>
</div>

<!--
"Erase your darlings": root lives on tmpfs or a rolled-back snapshot, so every reboot is a clean slate — you persist only the files you explicitly list.
If it's not declared, it's gone; hidden state can never accumulate.
Segue: nearly every tool on this tour is community-maintained — so who maintains them?
Sources: github.com/nix-community/impermanence · grahamc.com — Erase your darlings
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
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="magnifying-glass" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="apple-logo" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="shipping-container" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="cloud-arrow-down" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="lock-key" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="hard-drives" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="fire" class="text-sm" /></div>
    <div class="flex-none flex items-center justify-center gap-2 px-4 text-white" style="background: #5277C3;"><Ico name="users-three" class="text-sm" /><span class="font-mono text-xs tracking-widest">nix-community</span></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="rocket-launch" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="share-network" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="confetti" class="text-sm" /></div>
  </div>
  <div class="flex-1 grid grid-cols-2 gap-10 items-center px-14 py-10">
    <div class="text-left">
      <div class="text-xl leading-relaxed" style="color: #0D1B2E;">The <b>umbrella org</b> behind half of this tour — de-facto-standard tools, maintained together.</div>
      <div class="mt-5 space-y-2 font-mono text-sm" style="color: #27385D;">
        <div>Home Manager, impermanence, comma, nh, nixvim, disko, NUR…</div>
        <div>shared CI, binary cache &amp; co-maintainers</div>
      </div>
    </div>
    <div class="relative h-full" style="background: #5277C3;">
      <simple-icons-nixos class="absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 text-8xl text-white" />
      <div class="absolute bottom-4 left-5 font-mono text-xs tracking-widest" style="color: #7EBAE4;">img: nix-community — one org, dozens of standard tools</div>
    </div>
  </div>
</div>

<!--
The reveal: almost everything from the last dozen slides lives under one GitHub org.
It adopts key projects and gives them shared infra — CI, cache, co-maintainers — so tools don't die with one person's free time.
Source: github.com/nix-community
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
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="magnifying-glass" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="apple-logo" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="shipping-container" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="cloud-arrow-down" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="lock-key" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="hard-drives" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="fire" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="users-three" class="text-sm" /></div>
    <div class="flex-none flex items-center justify-center gap-2 px-4 text-white" style="background: #5277C3;"><Ico name="rocket-launch" class="text-sm" /><span class="font-mono text-xs tracking-widest">nixos-anywhere</span></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="share-network" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="confetti" class="text-sm" /></div>
  </div>
  <div class="flex-1 grid grid-cols-2 gap-10 items-center px-14 py-10">
    <div class="text-left text-xl leading-relaxed" style="color: #0D1B2E;">
      Deploy a declarative NixOS config to <b>any</b> remote box — bare metal or a fresh cloud VM — in one command.
    </div>
    <div class="relative h-full" style="background: #5277C3;">
      <simple-icons-nixos class="absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 text-8xl text-white" />
      <div class="absolute bottom-4 left-5 font-mono text-xs tracking-widest" style="color: #7EBAE4;">img: laptop deploying a config to a remote server</div>
    </div>
  </div>
</div>

<!--
Moved from Why people love it. One command to provision any remote box — kexec in, partition, install, reboot into your config. Tooling: nix-community/nixos-anywhere, SaumonNet/proxmox-nixos.
Segue: one box in one command — now a whole fleet…
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
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="magnifying-glass" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="apple-logo" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="shipping-container" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="cloud-arrow-down" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="lock-key" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="hard-drives" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="fire" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="users-three" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="rocket-launch" class="text-sm" /></div>
    <div class="flex-none flex items-center justify-center gap-2 px-4 text-white" style="background: #5277C3;"><Ico name="share-network" class="text-sm" /><span class="font-mono text-xs tracking-widest">clan.lol</span></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="confetti" class="text-sm" /></div>
  </div>
  <div class="flex-1 grid grid-cols-2 gap-10 items-center px-14 py-10">
    <div class="text-left">
      <div class="text-xl leading-relaxed" style="color: #0D1B2E;">Declarative <b>fleet management</b> on NixOS.</div>
      <div class="mt-5 space-y-2 font-mono text-sm" style="color: #27385D;">
        <div>zero-config peer-to-peer networking</div>
        <div>built-in secrets management</div>
        <div>one command to deploy the fleet</div>
      </div>
    </div>
    <div class="relative h-full" style="background: #5277C3;">
      <simple-icons-nixos class="absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 text-8xl text-white" />
      <div class="absolute bottom-4 left-5 font-mono text-xs tracking-widest" style="color: #7EBAE4;">img: clan.lol — one repo managing many machines</div>
    </div>
  </div>
</div>

<!--
Where the ecosystem is heading: manage a whole fleet of machines from one repo — zero-config P2P mesh, built-in secrets, one command to deploy and update.
And the people building things like this all meet in one place…
Source: clan.lol
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
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="magnifying-glass" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="apple-logo" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="shipping-container" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="cloud-arrow-down" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="lock-key" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="hard-drives" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="fire" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="users-three" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="rocket-launch" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="share-network" class="text-sm" /></div>
    <div class="flex-none flex items-center justify-center gap-2 px-4 text-white" style="background: #5277C3;"><Ico name="confetti" class="text-sm" /><span class="font-mono text-xs tracking-widest">nixcon</span></div>
  </div>
  <div class="flex-1 grid grid-cols-2 gap-10 items-center px-14 py-10">
    <div class="text-left">
      <div class="text-xl leading-relaxed" style="color: #0D1B2E;">The community <b>conference</b> for Nix &amp; NixOS.</div>
      <div class="mt-5 space-y-2 font-mono text-sm" style="color: #27385D;">
        <div>talks · workshops · the people behind it all</div>
        <div>go deeper: nix.dev · Zero to Nix · nixos.org</div>
      </div>
    </div>
    <div class="relative h-full" style="background: #5277C3;">
      <simple-icons-nixos class="absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 text-8xl text-white" />
      <div class="absolute bottom-4 left-5 font-mono text-xs tracking-widest" style="color: #7EBAE4;">img: NixCon — community conference</div>
    </div>
  </div>
</div>

<!--
Talks, workshops, and the people behind everything you just saw — where the roadmap gets hashed out.
Talks are recorded online, but it's the best way to meet the community in person.
End of the tour — point at the footer links for self-study, then hand over to the fin slide.
Sources: nixcon.org · go deeper: nix.dev · zero-to-nix.com · nixos.org
-->
