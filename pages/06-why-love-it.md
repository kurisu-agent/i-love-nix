---
layout: center
class: text-center
---

<div class="absolute inset-0" style="background: url(/alice-tea-party.png) center / cover no-repeat;">
  <div class="absolute top-0 left-0 flex items-stretch">
    <div class="w-20 flex items-center justify-center" style="background: #5277C3;"><simple-icons-nixos class="text-4xl text-white" /></div>
    <div class="px-10 py-6 text-left" style="background: #0D1B2E;">
      <div class="text-5xl font-black text-white leading-none">why people love it</div>
    </div>
  </div>
</div>

---
layout: center
---

<NixosPillar step="reproducible" />

<!--
- Section = nixos.org's own three words, in order
- Step one: reproducible — read the bold clause aloud
- Next slide is the analogy, then the demo
-->

---
layout: center
---

<div class="absolute inset-0 grid grid-cols-2">
  <div style="background: url(/build-carpenter.png) center / cover no-repeat;"></div>
  <div style="background: url(/build-flatpack.png) center / cover no-repeat;"></div>
</div>

<!--
- Carpenter: beautiful chair, but only from this workshop, these hands — undeclared deps
- Flat-pack: complete parts list ships in the box, assembles identically anywhere
- Declaring every dep = "works on one machine" becomes "works on every machine"
-->

---
layout: center
---

<div class="absolute inset-0 flex flex-col" style="background: #EDF2FA;">
  <div class="flex h-12 gap-2 m-2">
    <div class="flex-1 flex items-center justify-center gap-2 text-white" style="background: #5277C3;">
      <Ico name="target" class="text-sm" />
      <span class="font-mono text-xs tracking-widest">reproducible</span>
    </div>
    <div class="flex-1 flex items-center justify-center gap-2 bg-white" style="color: #27385D;">
      <Ico name="note-pencil" class="text-sm" />
      <span class="font-mono text-xs tracking-widest">declarative</span>
    </div>
    <div class="flex-1 flex items-center justify-center gap-2 bg-white" style="color: #27385D;">
      <Ico name="shield-check" class="text-sm" />
      <span class="font-mono text-xs tracking-widest">reliable</span>
    </div>
  </div>
  <div class="flex-1 flex items-center justify-center">
    <div class="relative w-[880px] h-[430px]">
      <svg class="absolute inset-0 w-full h-full" viewBox="0 0 880 430" fill="none">
        <defs>
          <marker id="merkle-arrow" viewBox="0 0 10 10" refX="9" refY="5" markerWidth="7" markerHeight="9" markerUnits="userSpaceOnUse" orient="auto">
            <path d="M 0 0 L 10 5 L 0 10 z" fill="#27385D" />
          </marker>
        </defs>
        <path d="M 440 84 V 130 H 320 V 176" stroke="#27385D" stroke-width="2" fill="none" marker-end="url(#merkle-arrow)" />
        <path d="M 440 84 V 130 H 560 V 176" stroke="#27385D" stroke-width="2" fill="none" marker-end="url(#merkle-arrow)" />
        <path d="M 200 84 V 300 H 380 V 338" stroke="#27385D" stroke-width="2" fill="none" marker-end="url(#merkle-arrow)" />
        <path d="M 710 84 V 300 H 500 V 338" stroke="#27385D" stroke-width="2" fill="none" marker-end="url(#merkle-arrow)" />
        <path d="M 320 246 V 338" stroke="#27385D" stroke-width="2" marker-end="url(#merkle-arrow)" />
        <path d="M 560 246 V 338" stroke="#27385D" stroke-width="2" marker-end="url(#merkle-arrow)" />
      </svg>
      <div class="absolute font-mono text-[10px] tracking-widest leading-relaxed" style="left: 8px; top: 30px; color: #27385D;">sources ·<br />build tools</div>
      <div class="absolute font-mono text-[10px] tracking-widest" style="left: 8px; top: 206px; color: #27385D;">libraries</div>
      <div class="absolute font-mono text-[10px] tracking-widest" style="left: 8px; top: 370px; color: #27385D;">the package</div>
      <div class="absolute flex flex-col items-center justify-center gap-1 bg-white py-2" style="left: 110px; top: 20px; width: 180px; height: 64px;">
        <div class="font-mono text-xs" style="color: #0D1B2E;">htop-3.3.0.tar.xz</div>
        <div class="font-mono text-[11px] px-2 py-0.5 text-white" style="background: #27385D;">sha256 f9s3lq</div>
      </div>
      <div class="absolute flex flex-col items-center justify-center gap-1 bg-white py-2" style="left: 350px; top: 20px; width: 180px; height: 64px;">
        <div class="font-mono text-xs" style="color: #0D1B2E;">gcc-13.3</div>
        <div class="font-mono text-[11px] px-2 py-0.5 text-white" style="background: #27385D;">p7q9f2</div>
      </div>
      <div class="absolute flex flex-col items-center justify-center gap-1 bg-white py-2" style="left: 620px; top: 20px; width: 180px; height: 64px;">
        <div class="font-mono text-xs" style="color: #0D1B2E;">bash-5.2</div>
        <div class="font-mono text-[11px] px-2 py-0.5 text-white" style="background: #27385D;">mzl8r4</div>
      </div>
      <div class="absolute flex flex-col items-center justify-center gap-1 bg-white py-2" style="left: 210px; top: 182px; width: 220px; height: 64px;">
        <div class="font-mono text-xs" style="color: #0D1B2E;">ncurses-6.4</div>
        <div class="font-mono text-[11px] px-2 py-0.5 text-white" style="background: #27385D;">b2f74c = h( p7q9f2 · … )</div>
      </div>
      <div class="absolute flex flex-col items-center justify-center gap-1 bg-white py-2" style="left: 450px; top: 182px; width: 220px; height: 64px;">
        <div class="font-mono text-xs" style="color: #0D1B2E;">glibc-2.39</div>
        <div class="font-mono text-[11px] px-2 py-0.5 text-white" style="background: #27385D;">8xk3vq = h( p7q9f2 · … )</div>
      </div>
      <div class="absolute flex flex-col items-center justify-center gap-1.5" style="left: 260px; top: 344px; width: 360px; height: 72px; background: #5277C3;">
        <div class="font-mono text-xs text-white">htop-3.3.0</div>
        <div class="font-mono text-[11px] px-2 py-0.5 text-white" style="background: #0D1B2E;">x1q7pd = h( f9s3lq · mzl8r4 · b2f74c · 8xk3vq )</div>
      </div>
    </div>
  </div>
</div>

<!--
- No headline needed — it's a Merkle tree: every node's hash is computed from its inputs' hashes
- Subtle but key (flag it, explain in Under the Hood): every node is a *recipe*, not a binary — the whole tree is computed at evaluation time, before anything is built. The store path is a name derived from the recipe; realisation later builds (or downloads) bytes to live at that name. Only the source leaf hashes actual content — that's what anchors the tree to reality. "Build tools" / "libraries" are reading aids; to the hash, every node is uniformly an input recipe
- Two hash kinds: the source is a **fixed-output derivation** — you declare the sha256 of the tarball's *content*, Nix downloads it and refuses to build if the bytes don't match. Every other node's hash is the hash of its *recipe* (inputs + build script)
- Read bottom-up: htop's store path = hash of (source, shell, ncurses, glibc); the libs' hashes already contain the compiler's, and so on down to bootstrap
- Installing a package locks in its **entire build tree**, not just the output — change anything anywhere and every hash above it changes: a different package, coexisting
- Same trick as git commits — hashes of hashes; the store-path name certifies the whole tree, which is why a cached binary can be trusted (next slide)
- Likely Q: "why hash the build tools if the source is pinned?" — because the package is the *binary*, not the source: same tarball through a different gcc/glibc is a different program. The toolchain is exactly where "works on my machine" lives, and substitution is only sound because the hash names the complete recipe. One-liner: the tarball tells you what to build; the tree tells you what you'll actually get
-->

---
layout: center
---

<div class="absolute inset-0 flex flex-col" style="background: #EDF2FA;">
  <div class="flex h-12 gap-2 m-2">
    <div class="flex-1 flex items-center justify-center gap-2 text-white" style="background: #5277C3;">
      <Ico name="target" class="text-sm" />
      <span class="font-mono text-xs tracking-widest">reproducible</span>
    </div>
    <div class="flex-1 flex items-center justify-center gap-2 bg-white" style="color: #27385D;">
      <Ico name="note-pencil" class="text-sm" />
      <span class="font-mono text-xs tracking-widest">declarative</span>
    </div>
    <div class="flex-1 flex items-center justify-center gap-2 bg-white" style="color: #27385D;">
      <Ico name="shield-check" class="text-sm" />
      <span class="font-mono text-xs tracking-widest">reliable</span>
    </div>
  </div>
  <div class="flex-1 flex items-center justify-center">
    <div class="relative w-[880px] h-[400px]">
      <svg class="absolute inset-0 w-full h-full" viewBox="0 0 880 400" fill="none">
        <defs>
          <marker id="subst-arrow" viewBox="0 0 10 10" refX="9" refY="5" markerWidth="7" markerHeight="9" markerUnits="userSpaceOnUse" orient="auto">
            <path d="M 0 0 L 10 5 L 0 10 z" fill="#27385D" />
          </marker>
        </defs>
        <path d="M 302 150 H 572" stroke="#27385D" stroke-width="2" marker-end="url(#subst-arrow)" />
        <path d="M 578 250 H 308" stroke="#27385D" stroke-width="2" marker-end="url(#subst-arrow)" />
      </svg>
      <div class="absolute flex flex-col items-center justify-center gap-3 bg-white" style="left: 60px; top: 90px; width: 240px; height: 220px;">
        <div class="flex items-center gap-3">
          <Ico name="device-mobile" class="text-7xl" style="color: #5277C3;" />
          <div class="relative w-12 h-12 rounded-xl flex items-center justify-center" style="background: #5277C3;">
            <Ico name="simple-icons:android" class="text-2xl text-white" />
            <simple-icons-nixos class="absolute -bottom-1 -right-1 text-base" style="color: #7EBAE4;" />
          </div>
        </div>
        <div class="font-mono text-xs tracking-widest" style="color: #27385D;">your phone</div>
      </div>
      <div class="absolute flex flex-col items-center justify-center gap-3 bg-white" style="left: 580px; top: 90px; width: 240px; height: 220px;">
        <Ico name="desktop-tower" class="text-7xl" style="color: #5277C3;" />
        <div class="font-mono text-xs tracking-widest" style="color: #27385D;">the desktop</div>
        <div class="flex items-center gap-2 font-mono text-[11px]" style="color: #27385D;">builds <span class="px-1.5 py-0.5 text-white" style="background: #0D1B2E;">x1q7pd</span></div>
      </div>
      <div class="absolute -translate-x-1/2 flex items-center gap-2 font-mono text-[11px] whitespace-nowrap" style="left: 440px; top: 120px; color: #27385D;"><span class="px-1.5 py-0.5 text-white" style="background: #0D1B2E;">x1q7pd</span> ?</div>
      <div class="absolute -translate-x-1/2 font-mono text-[11px] px-1.5 py-0.5 text-white whitespace-nowrap" style="left: 440px; top: 262px; background: #0D1B2E;">x1q7pd</div>
    </div>
  </div>
</div>

<!--
- Substitution is reproducibility's payoff: the hash from the last slide names the complete recipe, so anything that already built x1q7pd is provably interchangeable — the phone downloads instead of compiling
- The desktop serves its store to the LAN (harmonia — a private cache.nixos.org); remote builders cover the "else build" arm: evaluation stays on the phone, compilation ships to the beefy box, routed by architecture
- Yes, really a phone: nix-on-droid runs Nix + Home Manager on Android, no root — github.com/nix-community/nix-on-droid-app
- The actual config is ~10 lines (harmonia.enable, buildMachines, substituters) — kept on the cutting floor if anyone asks; NixOS boxes: `nixos-rebuild switch --target-host X --build-host desktop`
-->

---
layout: center
---

<NixosPillar step="declarative" />

<!--
- Step two: declarative, verbatim from the homepage
- Their pitch is really about sharing
- Builds to: typed interfaces → someone runs your machine → boundaries dissolve
-->

---
layout: center
---

<div class="absolute inset-0 flex flex-col" style="background: #EDF2FA;">
  <div class="flex h-12 gap-2 m-2">
    <div class="flex-1 flex items-center justify-center gap-2 bg-white" style="color: #27385D;">
      <Ico name="target" class="text-sm" />
      <span class="font-mono text-xs tracking-widest">reproducible</span>
    </div>
    <div class="flex-1 flex items-center justify-center gap-2 text-white" style="background: #5277C3;">
      <Ico name="note-pencil" class="text-sm" />
      <span class="font-mono text-xs tracking-widest">declarative</span>
    </div>
    <div class="flex-1 flex items-center justify-center gap-2 bg-white" style="color: #27385D;">
      <Ico name="shield-check" class="text-sm" />
      <span class="font-mono text-xs tracking-widest">reliable</span>
    </div>
  </div>
  <div class="flex-1 grid grid-cols-2 gap-8 items-center px-14 py-8">
    <div>
      <div class="h-10 flex items-center gap-3 px-4" style="background: #5277C3;">
        <simple-icons-nixos class="text-base text-white" />
        <span class="font-mono text-xs tracking-widest text-white">what you write</span>
      </div>
      <div class="text-left">

```nix
services.hello = {
  enable   = true;
  port     = 8080;
  greeting = "Hello, wonderland!";
};
```

</div>
      <div class="text-left text-sm leading-relaxed pt-4" style="color: #0D1B2E;">

- **Options are the API**, the module is the implementation — typed, documented, discoverable
- Change `port` once → the nginx vhost **and** the firewall rule re-derive together

</div>
    </div>
    <div>
      <div class="h-10 flex items-center gap-3 px-4" style="background: #27385D;">
        <Ico name="plug" class="text-base text-white" />
        <span class="font-mono text-xs tracking-widest text-white">the module</span>
      </div>
      <div class="text-left">

```nix
options.services.hello = {
  enable   = lib.mkEnableOption "hello page";
  port     = lib.mkOption { type = types.port; };
  greeting = lib.mkOption { default = "hi"; };
};

config = lib.mkIf cfg.enable {
  services.nginx = {
    enable = true;
    defaultHTTPListenPort = cfg.port;
    virtualHosts."hello" = {
      locations."/".return = ''200 "${cfg.greeting}"'';
    };
  };
  networking.firewall.allowedTCPPorts = [ cfg.port ];
};
```

</div>
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
- One line outside (typed options), all the plumbing inside (the module)
- Change `port` once → vhost and firewall rule re-derive together, can't drift
- Same mechanism nixpkgs uses; options indexed on search.nixos.org
-->

---
layout: center
---

<div class="absolute inset-0 flex flex-col" style="background: #EDF2FA;">
  <div class="flex h-12 gap-2 m-2">
    <div class="flex-1 flex items-center justify-center gap-2 bg-white" style="color: #27385D;">
      <Ico name="target" class="text-sm" />
      <span class="font-mono text-xs tracking-widest">reproducible</span>
    </div>
    <div class="flex-1 flex items-center justify-center gap-2 text-white" style="background: #5277C3;">
      <Ico name="note-pencil" class="text-sm" />
      <span class="font-mono text-xs tracking-widest">declarative</span>
    </div>
    <div class="flex-1 flex items-center justify-center gap-2 bg-white" style="color: #27385D;">
      <Ico name="shield-check" class="text-sm" />
      <span class="font-mono text-xs tracking-widest">reliable</span>
    </div>
  </div>
  <div class="flex-1 grid grid-cols-2 gap-8 items-center px-14 py-8">
    <div>
      <div class="h-10 flex items-center gap-3 px-4" style="background: #5277C3;">
        <simple-icons-nixos class="text-base text-white" />
        <span class="font-mono text-xs tracking-widest text-white">flake.nix — if I wanted to use it</span>
      </div>
      <div class="text-left">

```nix
inputs.common.url = "github:austinried/nix-common";

# home.nix
imports = [ inputs.common.homeModules.default ];

common.japanese.enable = true;
# → ibus + mozc — hiragana あ on Ctrl+Space
```

</div>
      <div class="h-9 flex items-center px-4 font-mono text-xs tracking-widest" style="background: #e2e8f0; color: #475569;">github.com/austinried/nix-common</div>
    </div>
    <div>
      <div class="h-10 flex items-center gap-3 px-4" style="background: #27385D;">
        <Ico name="scroll" class="text-base text-white" />
        <span class="font-mono text-xs tracking-widest text-white">japanese.nix</span>
      </div>
      <div class="text-left">

```nix
config = lib.mkIf cfg.enable {
  dconf.settings = {
    "org/gnome/desktop/input-sources".sources = [
      (mkTuple [ "ibus" "mozc-jp" ])
    ];
  };

  xdg.configFile."mozc/ibus_config.textproto".text = ''
      engines {
        name             : "mozc-jp"
        longname         : "Mozc"
        symbol           : "あ"
        composition_mode : HIRAGANA
      }
    '';
};
```

</div>
<div class="h-9 flex items-center px-4 font-mono text-xs tracking-widest" style="background: #e2e8f0; color: #475569;">the module</div>
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
- A real shared module library; flake.lock travels too, so inputs are byte-identical
- One line (`common.japanese.enable`) flips on ibus + mozc, dconf, hiragana default
- Land it: nobody publishes their apt history as a library
-->

---
layout: center
---

<div class="absolute inset-0 flex flex-col" style="background: #EDF2FA;">
  <div class="flex h-12 gap-2 m-2">
    <div class="flex-1 flex items-center justify-center gap-2 bg-white" style="color: #27385D;">
      <Ico name="target" class="text-sm" />
      <span class="font-mono text-xs tracking-widest">reproducible</span>
    </div>
    <div class="flex-1 flex items-center justify-center gap-2 text-white" style="background: #5277C3;">
      <Ico name="note-pencil" class="text-sm" />
      <span class="font-mono text-xs tracking-widest">declarative</span>
    </div>
    <div class="flex-1 flex items-center justify-center gap-2 bg-white" style="color: #27385D;">
      <Ico name="shield-check" class="text-sm" />
      <span class="font-mono text-xs tracking-widest">reliable</span>
    </div>
  </div>
  <div class="flex-1 flex items-center justify-center">
  <div class="w-[820px]">
    <div class="h-10 flex items-center gap-3 px-4" style="background: #5277C3;">
      <simple-icons-nixos class="text-base text-white" />
      <span class="font-mono text-xs tracking-widest text-white">boundaries dissolve</span>
    </div>
    <div class="text-left">

```nix
{
  packages.myapp = rustPlatform.buildRustPackage { src = ./.; };  # 📦 an app
  nixosConfigurations.server = nixosSystem {                      # 💻 an OS
    modules = [
      { services.myapp = { enable = true; port = 8080; }; }       # ⚙️ a config
      { programs.mosh.enable = true;                               # 🧩 a module…
        nixpkgs.overlays = [ (final: prev: {
          mosh = prev.mosh.overrideAttrs {                         # …carrying a patched build
            patches = [ ./fix-mosh-colors.patch ];
          };
        }) ];
      }
      { networking.hostName = "wonderland";                        # 🚀 a deployment —
        imports = [ ./hardware.nix ];                              #    this exact machine
      }
    ];
  };
}
```

</div>
<div class="h-9 flex items-center px-4 font-mono text-xs tracking-widest" style="background: #e2e8f0; color: #475569;">a system is a big package · a package is a tiny system</div>
  </div>
  </div>
</div>

<style>
.slidev-code {
  border-radius: 0 !important;
  margin: 0 !important;
  background: white !important;
  padding: 1rem 1.25rem !important;
  font-size: 0.72rem !important;
}
.slidev-code .line::before {
  color: #cbd5e1 !important;
}
</style>

<!--
- Everything is a declared value at typed options, so everything composes
- App, config, module, deployment, OS — elsewhere different tools; in Nix one primitive
- Imperative tools stack steps; Nix composes values — the piece you didn't write still merges
-->

---
layout: center
---

<NixosPillar step="reliable" />

<!--
- Step three: reliable, verbatim — three claims
- Can't break other packages (the DAG, next slide)
- Roll back; never inconsistent mid-upgrade (boot menu after)
-->

---
layout: center
---

<div class="absolute inset-0 flex flex-col" style="background: #EDF2FA;">
  <div class="flex h-12 gap-2 m-2">
    <div class="flex-1 flex items-center justify-center gap-2 bg-white" style="color: #27385D;">
      <Ico name="target" class="text-sm" />
      <span class="font-mono text-xs tracking-widest">reproducible</span>
    </div>
    <div class="flex-1 flex items-center justify-center gap-2 bg-white" style="color: #27385D;">
      <Ico name="note-pencil" class="text-sm" />
      <span class="font-mono text-xs tracking-widest">declarative</span>
    </div>
    <div class="flex-1 flex items-center justify-center gap-2 text-white" style="background: #5277C3;">
      <Ico name="shield-check" class="text-sm" />
      <span class="font-mono text-xs tracking-widest">reliable</span>
    </div>
  </div>
  <div class="flex-1 flex items-center justify-center">
    <div class="relative w-[880px] h-[420px]">
      <svg class="absolute inset-0 w-full h-full" viewBox="0 0 880 420" fill="none">
        <defs>
          <marker id="dag-arrow" viewBox="0 0 10 10" refX="9" refY="5" markerWidth="7" markerHeight="9" markerUnits="userSpaceOnUse" orient="auto">
            <path d="M 0 0 L 10 5 L 0 10 z" fill="#27385D" />
          </marker>
        </defs>
        <path d="M 470 70 V 130" stroke="#27385D" stroke-width="2" />
        <path d="M 180 130 H 830" stroke="#27385D" stroke-width="2" />
        <path d="M 180 130 V 184" stroke="#27385D" stroke-width="2" marker-end="url(#dag-arrow)" />
        <path d="M 380 130 V 184" stroke="#27385D" stroke-width="2" marker-end="url(#dag-arrow)" />
        <path d="M 600 130 V 184" stroke="#27385D" stroke-width="2" marker-end="url(#dag-arrow)" />
        <path d="M 830 130 V 184" stroke="#27385D" stroke-width="2" marker-end="url(#dag-arrow)" />
        <path d="M 180 240 V 300 H 265 V 354" stroke="#27385D" stroke-width="2" fill="none" stroke-linejoin="miter" marker-end="url(#dag-arrow)" />
        <path d="M 560 240 V 330 H 315 V 354" stroke="#27385D" stroke-width="2" fill="none" stroke-linejoin="miter" marker-end="url(#dag-arrow)" />
        <path d="M 380 240 V 300 H 530 V 354" stroke="#27385D" stroke-width="2" fill="none" stroke-linejoin="miter" marker-end="url(#dag-arrow)" />
        <path d="M 610 240 V 354" stroke="#27385D" stroke-width="2" marker-end="url(#dag-arrow)" />
        <path d="M 790 240 V 354" stroke="#27385D" stroke-width="2" marker-end="url(#dag-arrow)" />
      </svg>
      <div class="absolute" style="left: 505px; top: 176px; width: 370px; height: 78px; border: 1px solid #27385D;"></div>
      <div class="absolute -translate-x-1/2 -translate-y-1/2 font-mono text-[10px] tracking-widest px-2 py-1 text-white whitespace-nowrap" style="left: 712px; top: 176px; background: #27385D;">one lib · two versions</div>
      <div class="absolute font-mono text-[10px] tracking-widest" style="left: 8px; top: 40px; color: #27385D;">build tools</div>
      <div class="absolute font-mono text-[10px] tracking-widest" style="left: 8px; top: 210px; color: #27385D;">libraries</div>
      <div class="absolute font-mono text-[10px] tracking-widest" style="left: 8px; top: 380px; color: #27385D;">applications</div>
      <div class="absolute flex items-center justify-center font-mono text-xs text-white" style="left: 395px; top: 20px; width: 150px; height: 50px; background: #5277C3;">glibc-2.39</div>
      <div class="absolute flex items-center justify-center font-mono text-xs" style="left: 105px; top: 190px; width: 150px; height: 50px; background: white; color: #0D1B2E;">pcre2-10.44</div>
      <div class="absolute flex items-center justify-center font-mono text-xs" style="left: 305px; top: 190px; width: 150px; height: 50px; background: white; color: #0D1B2E;">nghttp2-1.62</div>
      <div class="absolute flex items-center justify-center font-mono text-xs text-white" style="left: 525px; top: 190px; width: 150px; height: 50px; background: #5277C3;">openssl-3.0.13</div>
      <div class="absolute flex items-center justify-center font-mono text-xs" style="left: 715px; top: 190px; width: 150px; height: 50px; background: #7EBAE4; color: #0D1B2E;">openssl-1.1.1w</div>
      <div class="absolute flex items-center justify-center font-mono text-xs" style="left: 215px; top: 360px; width: 150px; height: 50px; background: white; color: #0D1B2E;">nginx-1.27</div>
      <div class="absolute flex items-center justify-center font-mono text-xs" style="left: 485px; top: 360px; width: 150px; height: 50px; background: white; color: #0D1B2E;">curl-8.9</div>
      <div class="absolute flex items-center justify-center font-mono text-xs" style="left: 715px; top: 360px; width: 150px; height: 50px; background: white; color: #0D1B2E;">mongodb-4.4</div>
    </div>
  </div>
</div>

<!--
- One package can't break others: every version coexists by content hash — no dependency hell
- The store is a DAG; arrows mean "is an input to," shared nodes built and cached once
- Change one input → new hash → everything downstream rebuilds
-->

---
layout: center
clicks: 1
---

<div class="absolute inset-0 grub-zoom" :class="$clicks >= 1 ? 'grub-zoomed' : ''"></div>

<style>
.grub-zoom {
  background-color: #000;
  background-image: url(/nixos-boot-menu.png);
  background-repeat: no-repeat;
  background-position: center;
  background-size: 100%;
  transition: background-size 0.8s ease, background-position 0.8s ease;
}
.grub-zoomed {
  background-position: top left;
  background-size: 200%;
}
@media (prefers-reduced-motion: reduce) {
  .grub-zoom {
    transition: none;
  }
}
</style>

<!--
- Every rebuild is a new generation, built beside the old, then one atomic symlink flip
- Nothing mutated in place, so every past generation stays a boot-menu entry
- Rollback isn't configured — it's just how booting works
- [click] zoom in: every entry is a date + a nixpkgs rev — a complete bootable system state
-->

---
layout: center
---

<div class="absolute inset-0 grid grid-cols-[0.85fr_1.15fr] gap-0 items-stretch bg-white">
  <div style="background: url(/alice-angry-caterpillar.png) center / cover no-repeat;"></div>
  <div class="flex flex-col justify-center px-10" style="background: #F8D8D4;">
    <div class="text-left">

```nix
# recursive set — keys can reference each other
rec {
  # any string is a valid key
  "keys can have spaces" = true;
  # no spaces? that's a *path*, not 2
  six = 6/3;
  # spaces make it math
  two = 6 / 3;
  # // merges attrsets — not division
  cfg = { a = 1; } // { a = 2; };
  # '' strings: ''${x} escapes interpolation
  s = ''
    in these strings, ''${x} is escaped
  '';
  # default args, variadic ..., @ binds it all
  f = { who ? "you", ... } @ all: "hi ${who}";
  # __functor makes an attrset callable
  callMe = { __functor = self: x: x; };
}
```

</div>
  </div>
</div>

<style>
.slidev-code {
  border-radius: 0 !important;
  margin: 0 !important;
  background: transparent !important;
  padding: 1rem 1.25rem !important;
  font-size: 0.95rem !important;
  filter: hue-rotate(135deg) saturate(1.1);
}
/* darken comments (theme color #94b0d0); value is pre-hue-rotate */
.slidev-code span[style*="94b0d0" i] {
  color: #5878a8 !important;
}
.slidev-code .line::before {
  color: #E8A9A2 !important;
}
</style>

<!--
- Own it: the language is THE adoption blocker, top survey complaint — honesty earns trust
- Gripes: esoteric language, cryptic errors, a learning cliff with docs that assume you're past it
- Every line is real Nix (`6/3` a path, `//` merge, `__functor`) — the arcana LLMs love
-->

---
layout: center
---

<div class="absolute inset-0 grid grid-cols-[0.85fr_1.15fr] gap-0 items-stretch" style="background: #EDF2FA;">
  <div style="background: url(/claude-caterpillar-love.png) center / cover no-repeat;"></div>
  <div class="flex flex-col justify-center p-14">
    <div class="h-10 flex items-center gap-3 px-4" style="background: #5277C3;">
      <Ico name="robot" class="text-base text-white" />
      <span class="font-mono text-xs tracking-widest text-white">LLMs &lt;3 Nix</span>
    </div>
    <div class="grid grid-cols-2 gap-2 pt-2">
      <div class="flex flex-col items-center justify-center gap-3 bg-white px-4 py-8 text-center">
        <Ico name="database" class="text-4xl" style="color: #5277C3;" />
        <div class="text-sm" style="color: #0D1B2E;">Shit loads of training data</div>
      </div>
      <div class="flex flex-col items-center justify-center gap-3 bg-white px-4 py-8 text-center">
        <Ico name="terminal" class="text-4xl" style="color: #5277C3;" />
        <div class="text-xs font-mono" style="color: #0D1B2E;">nix run nixpkgs#anypackage</div>
      </div>
      <div class="flex flex-col items-center justify-center gap-3 bg-white px-4 py-8 text-center">
        <Ico name="file-code" class="text-4xl" style="color: #5277C3;" />
        <div class="text-sm" style="color: #0D1B2E;">Infrastructure as Code</div>
      </div>
      <div class="flex flex-col items-center justify-center gap-3 bg-white px-4 py-8 text-center">
        <Ico name="arrows-clockwise" class="text-4xl" style="color: #5277C3;" />
        <div class="text-sm" style="color: #0D1B2E;">Validation loops…</div>
      </div>
    </div>
  </div>
</div>

<!--
- The answer to the language problem already arrived, and it loves the grumpy parts
- Pincer: Nix gives LLMs one file + hash-verified ground truth; LLMs write the syntax
- `nix run nixpkgs#anything` = zero setup context, every tool ephemeral — then into the demo
-->
