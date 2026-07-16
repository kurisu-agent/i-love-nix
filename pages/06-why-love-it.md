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
class: text-center
---

<div class="absolute inset-0 flex flex-col items-center justify-center gap-8" style="background: #EDF2FA;">
  <div class="w-[900px] h-[340px]" style="background: url(/nixos-org-pitch.png) center / contain no-repeat;"></div>
  <div class="font-mono text-xs tracking-widest" style="color: #27385D;">nixos.org — above the fold</div>
</div>

<!--
The official pitch, verbatim. The next eight steps just unpack these words — plus the ones the homepage undersells: composability, sharing, substitution.
Source: nixos.org, above the fold.
-->

---
layout: center
---

<div class="absolute inset-0 flex flex-col" style="background: #EDF2FA;">
  <div class="flex h-12 gap-2 m-2">
    <div class="flex-none flex items-center justify-center gap-2 px-8 text-white" style="background: #5277C3;">
      <Ico name="note-pencil" class="text-sm" />
      <span class="font-mono text-xs tracking-widest">declarative</span>
    </div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="target" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="puzzle-piece" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="gift" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="plug" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="download-simple" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="graph" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="rewind" class="text-sm" /></div>
  </div>
  <div class="flex-1 grid grid-cols-2 gap-10 items-center px-14 py-10">
    <div class="text-left text-xl leading-relaxed" style="color: #0D1B2E;">
      Your whole machine in one config. No snowflake servers, no config drift — the system <b>is</b> the code.
    </div>
    <div class="relative h-full" style="background: #5277C3;">
      <simple-icons-nixos class="absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 text-8xl text-white" />
      <div class="absolute bottom-4 left-5 font-mono text-xs tracking-widest" style="color: #7EBAE4;">img: configuration.nix → the whole desktop</div>
    </div>
  </div>
</div>

---
layout: center
---

<div class="absolute inset-0 flex flex-col" style="background: #EDF2FA;">
  <div class="flex h-12 gap-2 m-2">
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="note-pencil" class="text-sm" /></div>
    <div class="flex-none flex items-center justify-center gap-2 px-8 text-white" style="background: #5277C3;">
      <Ico name="target" class="text-sm" />
      <span class="font-mono text-xs tracking-widest">deterministic</span>
    </div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="puzzle-piece" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="gift" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="plug" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="download-simple" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="graph" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="rewind" class="text-sm" /></div>
  </div>
  <div class="flex-1 grid grid-cols-2 gap-10 items-center px-14 py-10">
    <div class="text-left text-xl leading-relaxed" style="color: #0D1B2E;">
      Same inputs → the same output, <b>bit for bit</b>. Your laptop, a CI runner, a teammate's machine — identical results.
    </div>
    <div class="relative h-full" style="background: #5277C3;">
      <simple-icons-nixos class="absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 text-8xl text-white" />
      <div class="absolute bottom-4 left-5 font-mono text-xs tracking-widest" style="color: #7EBAE4;">img: identical build artifacts on different machines</div>
    </div>
  </div>
</div>

---
layout: center
---

<div class="absolute inset-0 flex flex-col" style="background: #EDF2FA;">
  <div class="flex h-12 gap-2 m-2">
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="note-pencil" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="target" class="text-sm" /></div>
    <div class="flex-none flex items-center justify-center gap-2 px-8 text-white" style="background: #5277C3;">
      <Ico name="puzzle-piece" class="text-sm" />
      <span class="font-mono text-xs tracking-widest">composable</span>
    </div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="gift" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="plug" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="download-simple" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="graph" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="rewind" class="text-sm" /></div>
  </div>
  <div class="flex-1 grid grid-cols-2 gap-10 items-center px-14 py-10">
    <div class="text-left text-lg leading-relaxed" style="color: #0D1B2E;">

- **Modules merge** — a hundred `.nix` files fold into one system
- **Overlays &amp; `overrideAttrs`** — bend any package without forking
- **Flake inputs** — pull in someone's whole system as a dependency
- **The boundaries dissolve** — app, module, deployment, OS all compose the same way

</div>
    <div class="relative h-full" style="background: #5277C3;">
      <simple-icons-nixos class="absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 text-8xl text-white" />
      <div class="absolute bottom-4 left-5 font-mono text-xs tracking-widest" style="color: #7EBAE4;">img: many small .nix modules → merge into one system</div>
    </div>
  </div>
</div>

<!--
Callback to "boundaries dissolve" from Meet Nix, now concrete. Imperative tools stack steps; Nix composes values — the piece you didn't write still merges cleanly.
-->

---
layout: center
---

<div class="absolute inset-0 flex flex-col" style="background: #EDF2FA;">
  <div class="flex h-12 gap-2 m-2">
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="note-pencil" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="target" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="puzzle-piece" class="text-sm" /></div>
    <div class="flex-none flex items-center justify-center gap-2 px-8 text-white" style="background: #5277C3;">
      <Ico name="gift" class="text-sm" />
      <span class="font-mono text-xs tracking-widest">shareable</span>
    </div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="plug" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="download-simple" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="graph" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="rewind" class="text-sm" /></div>
  </div>
  <div class="flex-1 grid grid-cols-2 gap-10 items-center px-14 py-10">
    <div class="text-left text-lg leading-relaxed" style="color: #0D1B2E;">

- Your whole machine is **one repo** — push it, someone else can `nix build` it verbatim
- Publish reusable **modules** as flake outputs; others `import` them like a library
- The `flake.lock` travels too → **byte-identical** inputs, never "works on my machine"

</div>
    <div class="relative h-full" style="background: #5277C3;">
      <simple-icons-nixos class="absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 text-8xl text-white" />
      <div class="absolute bottom-4 left-5 font-mono text-xs tracking-widest" style="color: #7EBAE4;">img: git push → someone else builds your exact machine</div>
    </div>
  </div>
</div>

<!--
A config isn't a snowflake — it's a dependency you can import. Tease it: someone in this very room already ships one.
-->

---
layout: center
---

<div class="absolute inset-0 flex flex-col" style="background: #EDF2FA;">
  <div class="flex h-12 gap-2 m-2">
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="note-pencil" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="target" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="puzzle-piece" class="text-sm" /></div>
    <div class="flex-none flex items-center justify-center gap-2 px-8 text-white" style="background: #5277C3;">
      <Ico name="gift" class="text-sm" />
      <span class="font-mono text-xs tracking-widest">shareable</span>
    </div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="plug" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="download-simple" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="graph" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="rewind" class="text-sm" /></div>
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
A real flake-parts module library from this room. The line to land: you wouldn't share your config like this on any other system — nobody publishes their apt history as a library. One line (`common.japanese.enable`) flips on a whole input method: ibus + mozc, GNOME dconf sources, hiragana default, Ctrl+Space toggle.
-->

---
layout: center
---

<div class="absolute inset-0 flex flex-col" style="background: #EDF2FA;">
  <div class="flex h-12 gap-2 m-2">
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="note-pencil" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="target" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="puzzle-piece" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="gift" class="text-sm" /></div>
    <div class="flex-none flex items-center justify-center gap-2 px-8 text-white" style="background: #5277C3;">
      <Ico name="plug" class="text-sm" />
      <span class="font-mono text-xs tracking-widest">interfaces</span>
    </div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="download-simple" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="graph" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="rewind" class="text-sm" /></div>
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
One line on the outside, all the plumbing on the inside. Interface (typed options) left, implementation right — change `port` once and the vhost and firewall rule re-derive together, they can't drift. Same mechanism nixpkgs itself uses; options are indexed on search.nixos.org.
-->

---
layout: center
---

<div class="absolute inset-0 flex flex-col" style="background: #EDF2FA;">
  <div class="flex h-12 gap-2 m-2">
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="note-pencil" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="target" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="puzzle-piece" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="gift" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="plug" class="text-sm" /></div>
    <div class="flex-none flex items-center justify-center gap-2 px-8 text-white" style="background: #5277C3;">
      <Ico name="download-simple" class="text-sm" />
      <span class="font-mono text-xs tracking-widest">substitution</span>
    </div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="graph" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="rewind" class="text-sm" /></div>
  </div>
  <div class="flex-1 grid grid-cols-2 gap-8 items-center px-14 py-8">
    <div class="text-left text-base leading-relaxed" style="color: #0D1B2E;">

- Already built somewhere? **Download, don't compile** — `cache.nixos.org` or a LAN cache (**harmonia**)
- **Remote builders**: evaluation stays local, heavy lifting goes to the beefy box
- **Architecture-aware** — each derivation routes to a machine that can build its `system`
- A Pi, a phone, a 2012 laptop → full system builds in **minutes**

</div>
    <div>
      <div class="h-10 flex items-center gap-3 px-4" style="background: #5277C3;">
        <simple-icons-nixos class="text-base text-white" />
        <span class="font-mono text-xs tracking-widest text-white">distributed builds</span>
      </div>
      <div class="text-left">

```nix
# desktop.nix — serve your store to the LAN
services.harmonia.enable = true;
boot.binfmt.emulatedSystems = [ "aarch64-linux" ];

# pi.nix / old-laptop.nix — outsource the work
nix.distributedBuilds = true;
nix.buildMachines = [{
  hostName = "ssh://desktop";
  systems  = [ "x86_64-linux" "aarch64-linux" ];
  maxJobs  = 8;
}];
nix.settings.substituters = [ "http://desktop:5000" ];
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
Reproducible outputs are shareable: if any machine already built a store path, substitute it instead of compiling. Harmonia serves your LAN; remote builders let a weak device only evaluate and ship the build to the desktop. Live example if asked: `nixos-rebuild switch --target-host pi --build-host desktop`.
-->

---
layout: center
---

<div class="absolute inset-0 flex flex-col" style="background: #EDF2FA;">
  <div class="flex h-12 gap-2 m-2">
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="note-pencil" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="target" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="puzzle-piece" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="gift" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="plug" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="download-simple" class="text-sm" /></div>
    <div class="flex-none flex items-center justify-center gap-2 px-8 text-white" style="background: #5277C3;">
      <Ico name="graph" class="text-sm" />
      <span class="font-mono text-xs tracking-widest">dependencies</span>
    </div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="rewind" class="text-sm" /></div>
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
Every version coexists, isolated by content hash — two apps wanting two different OpenSSLs? Both happy: mongodb on 1.1 (the sky-blue second version), nginx/curl on 3.0. No dependency hell.
The store is a **DAG**: each path records the store paths it references, arrows mean "is an input to." Zones (build tools / libraries / apps) are just reading aids — the store is flat.
Directed + acyclic → a valid build order always exists, independent branches build in parallel; shared nodes (openssl-3.0.13, glibc — nix-blue) built/stored/cached **once** — installing curl beside nginx only builds the delta (nghttp2); unreferenced paths are GC-able; follow arrows for exact closures. Change one input → new hash → everything downstream rebuilds.
-->

---
layout: center
---

<div class="absolute inset-0 flex flex-col" style="background: #EDF2FA;">
  <div class="flex h-12 gap-2 m-2">
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="note-pencil" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="target" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="puzzle-piece" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="gift" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="plug" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="download-simple" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs" style="color: #27385D;"><Ico name="graph" class="text-sm" /></div>
    <div class="flex-none flex items-center justify-center gap-2 px-8 text-white" style="background: #5277C3;">
      <Ico name="rewind" class="text-sm" />
      <span class="font-mono text-xs tracking-widest">rollbacks</span>
    </div>
  </div>
  <div class="flex-1 grid grid-cols-2 gap-10 items-center px-14 py-10">
    <div class="text-left text-xl leading-relaxed" style="color: #0D1B2E;">
      Every rebuild is a new <b>generation</b>. Booted something broken? Pick the previous one from the boot menu — nothing was mutated in place.
    </div>
    <div class="relative h-full" style="background: #5277C3;">
      <simple-icons-nixos class="absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 text-8xl text-white" />
      <div class="absolute bottom-4 left-5 font-mono text-xs tracking-widest" style="color: #7EBAE4;">img: boot menu → generations</div>
    </div>
  </div>
</div>

---
layout: center
---

<div class="absolute inset-0 flex items-center justify-center" style="background: #EDF2FA;">
  <div class="w-[680px]">
    <div class="h-10 flex items-center gap-3 px-4" style="background: #27385D;">
      <Ico name="smiley-angry" class="text-base text-white" />
      <span class="font-mono text-xs tracking-widest text-white">why people hate it</span>
    </div>
    <div class="text-left">

```nix
rec {
  "keys can have spaces" = true;
  six = 6/3;                # a *path*, not 2
  two = 6 / 3;              # spaces make it math
  cfg = { a = 1; } // { a = 2; };  # merge, not ÷
  s = ''
    in these strings, ''${x} is escaped
  '';
  f = { who ? "you", ... } @ all: "hi ${who}";
  callMe = { __functor = self: x: x; };
}
```

</div>
<div class="h-9 flex items-center px-4 font-mono text-xs tracking-widest" style="background: #e2e8f0; color: #475569;">every line is real</div>
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
Fair is fair — the esoteric language is THE adoption blocker, top complaint in every survey; acknowledge it honestly and the pitch earns trust. The gripes (spoken, not shown): №1 by a mile, the language is esoteric — purely functional, lazy, untyped, reads like nothing you daily-drive; cryptic errors — `infinite recursion encountered`, five layers deep in a module you didn't write; and the learning curve is a cliff, with docs that assume you already fell off it. Walk a couple footguns: `6/3` is a path literal, `//` is attrset merge, `__functor` makes an attrset callable. Punchline: none of it is a syntax error — and it's exactly the arcana LLMs are great at.
-->

---
layout: center
---

<div class="absolute inset-0 grid grid-cols-2 gap-0 items-stretch" style="background: #EDF2FA;">
  <div class="flex flex-col justify-center p-14">
    <div class="h-10 flex items-center gap-3 px-4" style="background: #5277C3;">
      <Ico name="robot" class="text-base text-white" />
      <span class="font-mono text-xs tracking-widest text-white">…but the answer already arrived</span>
    </div>
    <div class="text-left text-sm leading-relaxed pt-6" style="color: #0D1B2E;">

- LLMs are **fluent in Nix** — a million nixpkgs commits and every option doc are in the training set
- You'll see it in the demo in a moment: **describe the machine**, let the model write the `.nix`
- Declarative + atomic = **the safest playground for AI** — one file to review, `nixos-rebuild test` to try it, a generation to roll back if it lied
- Give an agent `nix run nixpkgs#anything` and it has **every tool on demand** — zero context wasted on "first, install the dependencies…"

</div>
    <div class="text-left text-lg pt-6" style="color: #0D1B2E;"><b>LLMs <Ico name="heart" /> Nix</b></div>
  </div>
  <div class="relative" style="background: #5277C3;">
    <simple-icons-nixos class="absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 text-8xl text-white" />
    <div class="absolute bottom-4 left-5 font-mono text-xs tracking-widest" style="color: #7EBAE4;">img: LLM writes the config · Nix verifies it</div>
  </div>
</div>

<!--
The pincer: Nix gives LLMs one declarative file as context and a hash-verified build as ground truth; LLMs translate intent into the esoteric syntax. And `nix run nixpkgs#anything` means an agent burns zero context on setup — every tool on demand, ephemeral. Land the sentence, then advance into the demo section.
-->
