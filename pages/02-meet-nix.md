---
layout: center
class: text-center
---

<div class="absolute inset-0 grid grid-cols-10">
  <div class="col-span-5 relative" style="background: #5277C3;">
    <div class="absolute top-12 left-12"><simple-icons-nixos class="text-5xl text-white" /></div>
    <div class="absolute bottom-12 left-12 text-left">
      <div class="text-7xl font-black text-white leading-none">meet nix</div>
    </div>
  </div>
  <div class="col-span-5" style="background: url(/alice-meet-nix.png) right center / cover no-repeat;"></div>
</div>

<!--
Section divider — half-and-half style (as the theme's own section-00 divider): solid nix-blue block with the snowflake + section microlabel + title on the left, full-bleed image on the right, hard split.
-->

---
layout: center
---

<div class="absolute inset-0 grid grid-cols-2">
  <div style="background: url(/eelco-dolstra.jpg) center / cover no-repeat;"></div>
  <div class="relative" style="background: #5277C3;">
    <div class="absolute top-12 right-12"><simple-icons-nixos class="text-5xl text-white" /></div>
    <div class="absolute bottom-12 left-12 text-left">
      <div class="text-6xl font-black text-white leading-none">Eelco<br />Dolstra</div>
      <div class="font-mono text-xs tracking-[0.3em] pt-5" style="color: #7EBAE4;">UTRECHT UNIVERSITY</div>
    </div>
  </div>
</div>

<!--
Put a face to the name: created Nix as PhD research in 2003, today co-founder of Determinate Systems. Everything here flows from his thesis.
Square-cropped full-bleed photo, hard-split against a flat nix block. Name + one mono microlabel, nothing else.
-->

---
layout: center
---

<div class="absolute inset-0 grid grid-cols-2" style="background: #EDF2FA;">
  <div class="m-10" style="background: url(/thesis-title-page.png) center / contain no-repeat;"></div>
  <div class="m-10" style="background: url(/functional-mapping.svg) center / contain no-repeat;"></div>
</div>

<!--
"The Purely Functional Software Deployment Model", Utrecht, defended Jan 2006. The whole deck — store, derivations, closures, NixOS — is this one idea: treat deployment as a purely functional computation.
A build is a mathematical mapping: inputs in, store path out, nothing else touched — same inputs, same output, forever. The store, caching, rollbacks are all just this arrow applied everywhere.
Diagram credit: tweag.io, from their Nix series.
-->

---
layout: center
---

<div class="absolute inset-0 px-12" style="background: #EDF2FA;">
  <div class="relative h-full">
    <div class="absolute top-1/2 -mt-px border-t-2 border-dashed" style="left: 8.333%; width: 16.667%; border-color: #27385D;"></div>
    <div class="absolute top-1/2 -mt-px h-0.5" style="left: 25%; right: 0; background: #27385D;"></div>
    <div class="absolute top-1/2 right-0 -translate-y-1/2 translate-x-2 w-0 h-0" style="border-top: 6px solid transparent; border-bottom: 6px solid transparent; border-left: 10px solid #27385D;"></div>
    <div class="relative h-full grid grid-cols-6">
      <div class="relative opacity-60">
        <div class="absolute left-1/2 top-1/2 -translate-x-1/2 -translate-y-1/2 w-3 h-3" style="background: #27385D;"></div>
        <div class="absolute left-1/2 -translate-x-1/2 bottom-1/2 mb-6 w-44">
          <div class="h-9 flex items-center justify-center font-mono text-xs tracking-widest bg-white" style="color: #27385D;">2003</div>
          <div class="flex items-center justify-center bg-white p-3" style="color: #0D1B2E;"><div class="text-center text-xs leading-snug">PhD research begins</div></div>
        </div>
      </div>
      <div class="relative">
        <div class="absolute left-1/2 top-1/2 -translate-x-1/2 -translate-y-1/2 w-3 h-3" style="background: #27385D;"></div>
        <div class="absolute left-1/2 -translate-x-1/2 top-1/2 mt-6 w-44">
          <div class="h-9 flex items-center justify-center font-mono text-xs tracking-widest text-white" style="background: #27385D;">2006</div>
          <div class="flex items-center justify-center bg-white p-3" style="color: #0D1B2E;"><div class="text-center text-xs leading-snug">Eelco Dolstra's PhD <b>thesis</b></div></div>
        </div>
      </div>
      <div class="relative">
        <div class="absolute left-1/2 top-1/2 -translate-x-1/2 -translate-y-1/2 w-3 h-3" style="background: #27385D;"></div>
        <div class="absolute left-1/2 -translate-x-1/2 bottom-1/2 mb-6 w-44">
          <div class="h-9 flex items-center justify-center font-mono text-xs tracking-widest text-white" style="background: #27385D;">2007</div>
          <div class="flex items-center justify-center bg-white p-3" style="color: #0D1B2E;"><div class="text-center text-xs leading-snug"><b>NixOS</b> is born, from Armijn Hemel's master's thesis</div></div>
        </div>
      </div>
      <div class="relative">
        <div class="absolute left-1/2 top-1/2 -translate-x-1/2 -translate-y-1/2 w-3 h-3" style="background: #27385D;"></div>
        <div class="absolute left-1/2 -translate-x-1/2 top-1/2 mt-6 w-44">
          <div class="h-9 flex items-center justify-center font-mono text-xs tracking-widest text-white" style="background: #27385D;">2013</div>
          <div class="flex items-center justify-center bg-white p-3" style="color: #0D1B2E;"><div class="text-center text-xs leading-snug">first stable release — NixOS <b>13.10</b></div></div>
        </div>
      </div>
      <div class="relative">
        <div class="absolute left-1/2 top-1/2 -translate-x-1/2 -translate-y-1/2 w-3 h-3" style="background: #27385D;"></div>
        <div class="absolute left-1/2 -translate-x-1/2 bottom-1/2 mb-6 w-44">
          <div class="h-9 flex items-center justify-center font-mono text-xs tracking-widest text-white" style="background: #27385D;">2020–21</div>
          <div class="flex items-center justify-center bg-white p-3" style="color: #0D1B2E;"><div class="text-center text-xs leading-snug"><b>flakes</b> arrive (experimental)</div></div>
        </div>
      </div>
      <div class="relative">
        <div class="absolute left-1/2 top-1/2 -translate-x-1/2 -translate-y-1/2 w-3 h-3" style="background: #5277C3;"></div>
        <div class="absolute left-1/2 -translate-x-1/2 top-1/2 mt-6 w-44">
          <div class="h-9 flex items-center justify-center gap-2 font-mono text-xs tracking-widest text-white" style="background: #5277C3;"><simple-icons-nixos class="text-sm" />2026</div>
          <div class="flex items-center justify-center bg-white p-3" style="color: #0D1B2E;"><div class="text-center text-xs leading-snug">nixpkgs crosses <b>1,000,000</b> commits <Ico name="confetti" style="color: #5277C3;" /></div></div>
        </div>
      </div>
    </div>
  </div>
</div>

<!--
Walk the tiles left to right: muted white 2003 tile + dashed connector = research years; 2006 thesis; 2007 NixOS from Armijn Hemel's master's; 2013 first stable (13.10); 2020–21 flakes; May 2026 nixpkgs hits 1M commits (a humble `serpl` version bump — the point is relentless, boring freshness). Link: github.com/NixOS/nixpkgs.
Fine print if pressed: a few GitHub *mirrors* are bigger (Chromium, Linux, Gentoo), but among repos actually developed on GitHub nixpkgs is №1 by commits. Stewarded by the NixOS Foundation and Determinate Systems.
-->

---
layout: center
---


<div class="absolute inset-0 grid grid-cols-3 bg-white">
  <div class="flex flex-col items-center justify-center gap-4 bg-white">
    <Ico name="circle-dashed" class="text-6xl" style="color: #5277C3;" />
    <div class="font-mono text-xs tracking-widest" style="color: #27385D;">dutch</div>
    <div class="text-3xl font-black" style="color: #0D1B2E;">nothing</div>
  </div>
  <div class="flex flex-col items-center justify-center gap-4" style="background: #EDF2FA;">
    <Ico name="scissors" class="text-6xl" style="color: #5277C3;" />
    <div class="font-mono text-xs tracking-widest" style="color: #27385D;">english</div>
    <div class="text-3xl font-black" style="color: #0D1B2E;">cancel</div>
  </div>
  <div class="flex flex-col items-center justify-center gap-4 bg-white">
    <Ico name="snowflake" class="text-6xl" style="color: #5277C3;" />
    <div class="font-mono text-xs tracking-widest" style="color: #27385D;">latin</div>
    <div class="text-3xl font-black" style="color: #0D1B2E;">snow</div>
  </div>
</div>

<!--
Three meanings, all true. Dutch *niks* (nothing) → every build starts from an empty clean room. English *to nix* → nix dependency hell, nix "works on my machine". Latin *nix* (snow) → the snowflake logo, and like a snowflake no two builds are alike (each named by content hash).
-->

---
layout: center
---


<div class="absolute inset-0 grid grid-cols-2 grid-rows-2 bg-white">
  <div class="flex flex-col items-center justify-center gap-3 px-6 text-center bg-white">
    <Ico name="brackets-curly" class="text-6xl" style="color: #5277C3;" />
    <div class="font-mono text-xs tracking-widest" style="color: #27385D;">the language</div>
    <div class="text-sm" style="color: #0D1B2E;">a lazy, purely-functional DSL</div>
  </div>
  <div class="flex flex-col items-center justify-center gap-3 px-6 text-center" style="background: #EDF2FA;">
    <Ico name="package" class="text-6xl" style="color: #5277C3;" />
    <div class="font-mono text-xs tracking-widest" style="color: #27385D;">the package manager</div>
    <div class="text-sm" style="color: #0D1B2E;">evaluates it · owns /nix/store</div>
  </div>
  <div class="flex flex-col items-center justify-center gap-3 px-6 text-center" style="background: #EDF2FA;">
    <Ico name="folders" class="text-6xl" style="color: #5277C3;" />
    <div class="font-mono text-xs tracking-widest" style="color: #27385D;">nixpkgs</div>
    <div class="text-sm" style="color: #0D1B2E;">100k+ recipes — the world's largest</div>
  </div>
  <div class="flex flex-col items-center justify-center gap-3 px-6 text-center bg-white">
    <simple-icons-nixos class="text-6xl" style="color: #5277C3;" />
    <div class="font-mono text-xs tracking-widest" style="color: #27385D;">the OS — NixOS</div>
    <div class="text-sm" style="color: #0D1B2E;">a whole Linux distro, configured</div>
  </div>
</div>

<!--
Same three letters, four layers — language (you write it) → package manager (evaluates it, runs on any Linux/macOS/WSL) → nixpkgs (built by the tool) → NixOS (configures the entire system, not just packages). We take them in that order.
-->

---
layout: center
---


<div class="absolute inset-0 grid grid-cols-2" style="background: #EDF2FA;">
  <div class="flex flex-col justify-center p-14">
    <div class="h-10 flex items-center gap-3 px-4" style="background: #27385D;">
      <Ico name="simple-icons:python" class="text-base text-white" />
      <span class="font-mono text-xs tracking-widest text-white">python</span>
    </div>
    <div class="text-left">

```python
if prod:
    port = 443
else:
    port = 8080
```

</div>
<div class="h-9 flex items-center px-4 font-mono text-xs tracking-widest" style="background: #e2e8f0; color: #475569;">imperative · run for effect</div>
  </div>
  <div class="flex flex-col justify-center p-14">
    <div class="h-10 flex items-center gap-3 px-4" style="background: #5277C3;">
      <simple-icons-nixos class="text-base text-white" />
      <span class="font-mono text-xs tracking-widest text-white">nix</span>
    </div>
    <div class="text-left">

```nix
port = if prod then 443 else 8080;
```

</div>
<div class="h-9 flex items-center px-4 font-mono text-xs tracking-widest" style="background: #e2e8f0; color: #475569;">functional · evaluate to a value</div>
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
Nix is a purely functional language — a program isn't a list of instructions, it's one expression that evaluates to a value. The contrast is statements: Python/Bash run instructions for effect, so you can't ask "what's the value of this `if`?". Nix has none — every construct evaluates to a value, so `if` needs an `else` and anything nests anywhere (an `if` inside a list, a `let` inside an attr). No `return`, no `else`-less `if` — the whole file is one expression, so anything nests anywhere. Think JSON with functions, or a spreadsheet. Nix's twist is pure AND lazy, and the value describes a build.
-->

---
layout: center
---

<div class="absolute inset-0 flex flex-col" style="background: #EDF2FA;">
  <div class="flex-1 grid grid-cols-3 grid-rows-2 bg-white">
  <div class="flex flex-col items-center justify-center gap-3 px-8 text-center bg-white">
    <Ico name="target" class="text-5xl" style="color: #5277C3;" />
    <div class="font-mono text-xs tracking-widest" style="color: #27385D;">deterministic</div>
    <div class="text-sm" style="color: #0D1B2E;">same inputs → same output, every time</div>
  </div>
  <div class="flex flex-col items-center justify-center gap-3 px-8 text-center" style="background: #EDF2FA;">
    <Ico name="cube" class="text-5xl" style="color: #5277C3;" />
    <div class="font-mono text-xs tracking-widest" style="color: #27385D;">hermetic</div>
    <div class="text-sm" style="color: #0D1B2E;">no undeclared dependencies — the sandbox seals ambient state out</div>
  </div>
  <div class="flex flex-col items-center justify-center gap-3 px-8 text-center bg-white">
    <Ico name="download-simple" class="text-5xl" style="color: #5277C3;" />
    <div class="font-mono text-xs tracking-widest" style="color: #27385D;">cacheable</div>
    <div class="text-sm" style="color: #0D1B2E;">binary caches come for free</div>
  </div>
  <div class="flex flex-col items-center justify-center gap-3 px-8 text-center" style="background: #EDF2FA;">
    <Ico name="tree-structure" class="text-5xl" style="color: #5277C3;" />
    <div class="font-mono text-xs tracking-widest" style="color: #27385D;">lazy</div>
    <div class="text-sm" style="color: #0D1B2E;">a 100k-package set computes only what you ask for</div>
  </div>
  <div class="flex flex-col items-center justify-center gap-3 px-8 text-center bg-white">
    <Ico name="columns" class="text-5xl" style="color: #5277C3;" />
    <div class="font-mono text-xs tracking-widest" style="color: #27385D;">parallel</div>
    <div class="text-sm" style="color: #0D1B2E;">independent builds can't interfere</div>
  </div>
  <div class="flex flex-col items-center justify-center gap-3 px-8 text-center" style="background: #EDF2FA;">
    <Ico name="puzzle-piece" class="text-5xl" style="color: #5277C3;" />
    <div class="font-mono text-xs tracking-widest" style="color: #27385D;">composable</div>
    <div class="text-sm" style="color: #0D1B2E;">self-contained pieces nest infinitely</div>
  </div>
  </div>
</div>

<!--
An expression can't mutate anything: its value depends on its inputs alone. The footer is the thesis in one line — "The Purely Functional Software Deployment Model" (Dolstra 2006): a component is uniquely defined by its declared build inputs, and the payoff is "strong guarantees about components, such as non-interference".
Pin the terminology (the entropy matrix later leans on it): deterministic = the function's property (same in, same out); hermetic = nothing undeclared can even be *seen*, so dependency information is complete. Hold all six at once and **reproducibility** falls out — the same result on any machine, this year or next. Terraform is declarative but not deterministic — `apply` reads live cloud state; Nix is both.
Dwell on compose: a module is a value that can't touch the machine while evaluating, so "just drop it in" is safe — embed a whole desktop config, override one leaf deep in someone's stack, no forking. LEGO, not glue. And the domain twist: the value you compute is a build recipe, so all of this applies to your whole system.
-->

---
layout: center
---


<div class="absolute inset-0 grid grid-cols-2 gap-0 items-stretch" style="background: #EDF2FA;">
  <div class="flex flex-col justify-center p-14">
    <div class="h-10 flex items-center gap-3 px-4" style="background: #27385D;">
      <Ico name="list-numbers" class="text-base text-white" />
      <span class="font-mono text-xs tracking-widest text-white">procedural</span>
    </div>
    <div class="text-left">

```bash
sudo apt install nginx
sudo vim /etc/nginx/nginx.conf
sudo systemctl enable --now nginx
# …and again, by hand, on the next box
```

</div>
<div class="h-9 flex items-center px-4 font-mono text-xs tracking-widest" style="background: #e2e8f0; color: #475569;">say how</div>
  </div>
  <div class="flex flex-col justify-center p-14">
    <div class="h-10 flex items-center gap-3 px-4" style="background: #5277C3;">
      <simple-icons-nixos class="text-base text-white" />
      <span class="font-mono text-xs tracking-widest text-white">declarative</span>
    </div>
    <div class="text-left">

```nix
services.nginx = {
  enable = true;
  virtualHosts."example.com".root = "/var/www";
};
```

</div>
<div class="h-9 flex items-center px-4 font-mono text-xs tracking-widest" style="background: #e2e8f0; color: #475569;">say what</div>
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
Two ways to get a machine into a state — describe the steps, or describe the result. Procedural systems are defined by their history — the sum of every command ever run, including the forgotten ones; reproducing means replaying an unknown script. Declarative flips it: the file states the end state, the tool derives the steps from any starting point (even blank disk), so drift has nowhere to live. Steps depend on where you start; a declared result is derived fresh from zero, every time. The functional language makes it enforceable — a config can't *do* anything, only *describe*.
-->

---
layout: center
---

<div class="absolute inset-0 flex items-center justify-center" style="background: #EDF2FA;">
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
An app, a config, a module, a deployment, an OS. Everywhere else these are different kinds of thing with different tools (apt, /etc, Ansible, Terraform, the distro). In Nix they're one primitive — an expression evaluating to a derivation in one graph — so the categories stop being categories. Walk the example inside-out: Rust app → service config → a module enabling mosh with an overlay patching its build → a deployment pinned to one physical box via `hardware.nix`. Seventeen lines on GitHub = this exact machine, rebuildable by anyone forever — the extropy harvest the next slide names.
-->

---
layout: center
title: Extropy Harvesting
---


<div class="absolute inset-0 flex flex-col" style="background: #EDF2FA;">
  <div class="h-11 flex items-center justify-between px-14 text-white" style="background: #27385D;"><span class="font-bold tracking-wide">Extropy Harvesting</span><span class="font-mono text-xs tracking-widest">a working system, crystallized</span></div>
  <div class="flex-1 grid grid-cols-2">
    <div class="flex flex-col text-left">
      <div class="px-14 h-32 flex items-center gap-5">
        <Ico name="spiral" class="text-5xl shrink-0" style="color: #5277C3;" />
        <div>
          <div class="font-mono text-xs tracking-widest" style="color: #5277C3;">entropy</div>
          <div class="text-base font-bold pt-1 leading-snug" style="color: #0D1B2E;">systems drift. packages rot, config diverges, "works on my machine."</div>
        </div>
      </div>
      <div class="flex-1" style="background: url('/entropy-water.png') center/cover;"></div>
    </div>
    <div class="flex flex-col text-left">
      <div class="px-14 h-32 flex items-center gap-5">
        <simple-icons-nixos class="text-5xl shrink-0" style="color: #5277C3;" />
        <div>
          <div class="font-mono text-xs tracking-widest" style="color: #5277C3;">extropy</div>
          <div class="text-base font-bold pt-1 leading-snug" style="color: #0D1B2E;">each fix you <i>declare</i> crystallizes into permanent, accumulating structure.</div>
        </div>
      </div>
      <div class="flex-1" style="background: url('/extropy-crystal.png') center/cover;"></div>
    </div>
  </div>
</div>

<!--
The payoff of all the philosophy: once a fix exists as Nix in a commit it's permanently captured — check out that rev in five years, on another machine, and the same system comes back. Order compounds instead of evaporating. This is the frame for the rest of the deck: every tool ahead harvests more order into the crystal.
-->

---
layout: center
---

<div class="absolute inset-0 flex items-center px-10" style="background: #EDF2FA;">
  <div class="w-full grid grid-cols-[160px_repeat(5,1fr)] gap-2">
    <div></div>
    <div class="flex flex-col items-center justify-center gap-1 pb-1"><Ico name="logos:npm-icon" class="text-3xl" /><span class="font-mono text-xs tracking-widest" style="color: #27385D;">npm</span></div>
    <div class="flex flex-col items-center justify-center gap-1 pb-1"><Ico name="logos:ansible" class="text-3xl" /><span class="font-mono text-xs tracking-widest" style="color: #27385D;">ansible</span></div>
    <div class="flex flex-col items-center justify-center gap-1 pb-1"><Ico name="logos:docker-icon" class="text-3xl" /><span class="font-mono text-xs tracking-widest" style="color: #27385D;">docker</span></div>
    <div class="flex flex-col items-center justify-center gap-1 pb-1"><Ico name="logos:terraform-icon" class="text-3xl" /><span class="font-mono text-xs tracking-widest" style="color: #27385D;">terraform</span></div>
    <div class="flex flex-col items-center justify-center gap-1 pb-1"><simple-icons-nixos class="text-3xl" style="color: #5277C3;" /><span class="font-mono text-xs tracking-widest" style="color: #5277C3;">nixos</span></div>
    <div class="h-11 flex items-center justify-end pr-4 font-mono text-xs tracking-widest" style="color: #27385D;">services</div>
    <div class="flex items-center justify-center" style="background: #5277C3;"><Ico name="check-bold" class="text-xl text-white" /></div>
    <div class="bg-white"></div>
    <div class="flex items-center justify-center" style="background: #5277C3;"><Ico name="check-bold" class="text-xl text-white" /></div>
    <div class="flex items-center justify-center" style="background: #5277C3;"><Ico name="check-bold" class="text-xl text-white" /></div>
    <div class="flex items-center justify-center" style="background: #5277C3;"><Ico name="check-bold" class="text-xl text-white" /></div>
    <div class="h-11 flex items-center justify-end pr-4 font-mono text-xs tracking-widest" style="color: #27385D;">machines</div>
    <div class="bg-white"></div>
    <div class="flex items-center justify-center" style="background: #5277C3;"><Ico name="check-bold" class="text-xl text-white" /></div>
    <div class="bg-white"></div>
    <div class="flex items-center justify-center" style="background: #5277C3;"><Ico name="check-bold" class="text-xl text-white" /></div>
    <div class="flex items-center justify-center" style="background: #5277C3;"><Ico name="check-bold" class="text-xl text-white" /></div>
    <div class="h-11 flex items-center justify-end pr-4 font-mono text-xs tracking-widest" style="color: #27385D;">lockfile</div>
    <div class="flex items-center justify-center" style="background: #5277C3;"><Ico name="check-bold" class="text-xl text-white" /></div>
    <div class="bg-white"></div>
    <div class="bg-white"></div>
    <div class="flex items-center justify-center" style="background: #5277C3;"><Ico name="check-bold" class="text-xl text-white" /></div>
    <div class="flex items-center justify-center" style="background: #5277C3;"><Ico name="check-bold" class="text-xl text-white" /></div>
    <div class="h-11 flex items-center justify-end pr-4 font-mono text-xs tracking-widest" style="color: #27385D;">declarative</div>
    <div class="bg-white"></div>
    <div class="bg-white"></div>
    <div class="bg-white"></div>
    <div class="flex items-center justify-center" style="background: #5277C3;"><Ico name="check-bold" class="text-xl text-white" /></div>
    <div class="flex items-center justify-center" style="background: #5277C3;"><Ico name="check-bold" class="text-xl text-white" /></div>
    <div class="h-11 flex items-center justify-end pr-4 font-mono text-xs tracking-widest" style="color: #27385D;">hermetic</div>
    <div class="bg-white"></div>
    <div class="bg-white"></div>
    <div class="flex items-center justify-center" style="background: #5277C3;"><Ico name="check-bold" class="text-xl text-white" /></div>
    <div class="bg-white"></div>
    <div class="flex items-center justify-center" style="background: #5277C3;"><Ico name="check-bold" class="text-xl text-white" /></div>
    <div class="h-11 flex items-center justify-end pr-4 font-mono text-xs tracking-widest" style="color: #27385D;">deterministic</div>
    <div class="bg-white"></div>
    <div class="bg-white"></div>
    <div class="bg-white"></div>
    <div class="bg-white"></div>
    <div class="flex items-center justify-center" style="background: #5277C3;"><Ico name="check-bold" class="text-xl text-white" /></div>
  </div>
</div>

<!--
"Works on my machine" is entropy — unrecorded change until nobody can explain the box. Every tool fixes one slice; Nix goes after the root, implicit mutable global state. Row by row: Services (npm scripts, Docker containers, Terraform providers, NixOS systemd modules); Machines (Ansible inside the box, Terraform the box itself, Nix both); Lockfile (npm/Terraform pin one layer, Nix the whole closure to glibc); Declarative (HCL yes, npm/Ansible no — Nix *is* a value); Hermetic (Docker bundles userland, Nix's closure does it down to glibc); Deterministic (only Nix — no live state, no network at eval).
Punchline: reproducible falls out of holding every row at once — the extropy, crystallized. Green checkmarks become the brand mark itself — a white snowflake-style check on a nix-blue cell.
-->

---
layout: center
---


<div class="absolute inset-0 grid grid-cols-3 grid-rows-2 bg-white">
  <div class="flex flex-col items-center justify-center gap-3 px-8 text-center bg-white">
    <Ico name="laptop" class="text-5xl" style="color: #5277C3;" />
    <div class="font-mono text-xs tracking-widest" style="color: #27385D;">your own desktop</div>
    <div class="text-sm" style="color: #0D1B2E;">NixOS or a Mac (nix-darwin) — the machine in one repo</div>
  </div>
  <div class="flex flex-col items-center justify-center gap-3 px-8 text-center" style="background: #EDF2FA;">
    <Ico name="desktop" class="text-5xl" style="color: #5277C3;" />
    <div class="font-mono text-xs tracking-widest" style="color: #27385D;">servers — beefy or tiny</div>
    <div class="text-sm" style="color: #0D1B2E;">declarative fleets with atomic rollbacks</div>
  </div>
  <div class="flex flex-col items-center justify-center gap-3 px-8 text-center bg-white">
    <Ico name="robot" class="text-5xl" style="color: #5277C3;" />
    <div class="font-mono text-xs tracking-widest" style="color: #27385D;">embedded & robotics</div>
    <div class="text-sm" style="color: #0D1B2E;">lightweight cross-compiled ARM images, atomic A/B updates</div>
  </div>
  <div class="flex flex-col items-center justify-center gap-3 px-8 text-center" style="background: #EDF2FA;">
    <Ico name="code" class="text-5xl" style="color: #5277C3;" />
    <div class="font-mono text-xs tracking-widest" style="color: #27385D;">dev environments</div>
    <div class="text-sm" style="color: #0D1B2E;">per-repo toolchains that match CI exactly</div>
  </div>
  <div class="flex flex-col items-center justify-center gap-3 px-8 text-center bg-white">
    <Ico name="package" class="text-5xl" style="color: #5277C3;" />
    <div class="font-mono text-xs tracking-widest" style="color: #27385D;">container images</div>
    <div class="text-sm" style="color: #0D1B2E;"><code>dockerTools</code> builds OCI — no <code>Dockerfile</code></div>
  </div>
  <div class="flex flex-col items-center justify-center gap-3 px-8 text-center" style="background: #EDF2FA;">
    <Ico name="microscope" class="text-5xl" style="color: #5277C3;" />
    <div class="font-mono text-xs tracking-widest" style="color: #27385D;">reproducible research</div>
    <div class="text-sm" style="color: #0D1B2E;">rerun the experiment bit-for-bit, years later</div>
  </div>
</div>

<!--
A NixOS system is derived from your declaration — the closure of what you asked for and nothing else, so the same OS fits a beefy server, a 512 MB VPS, and an embedded board. One primitive (a hashed declarative build) serves every layer. Anchors if asked: Anduril ships it on devices, scientific teams use it for paper reproducibility, many shops use only the dev-shell layer. Segue: that minimality is also a *security* property.
-->

---
layout: center
---

<div class="absolute inset-0 grid grid-cols-3 grid-rows-2 bg-white">
  <div class="flex flex-col items-center justify-center gap-3 px-8 text-center bg-white">
    <Ico name="shield-check" class="text-5xl" style="color: #5277C3;" />
    <div class="font-mono text-xs tracking-widest" style="color: #27385D;">small attack surface</div>
    <div class="text-sm" style="color: #0D1B2E;">nothing preinstalled, nothing forgotten</div>
  </div>
  <div class="flex flex-col items-center justify-center gap-3 px-8 text-center" style="background: #EDF2FA;">
    <Ico name="lock" class="text-5xl" style="color: #5277C3;" />
    <div class="font-mono text-xs tracking-widest" style="color: #27385D;">immutable store</div>
    <div class="text-sm" style="color: #0D1B2E;">read-only binaries, re-verifiable against their hash</div>
  </div>
  <div class="flex flex-col items-center justify-center gap-3 px-8 text-center bg-white">
    <Ico name="git-diff" class="text-5xl" style="color: #5277C3;" />
    <div class="font-mono text-xs tracking-widest" style="color: #27385D;">auditable as code</div>
    <div class="text-sm" style="color: #0D1B2E;">every change is a diff; drift is impossible</div>
  </div>
  <div class="flex flex-col items-center justify-center gap-3 px-8 text-center" style="background: #EDF2FA;">
    <Ico name="seal-check" class="text-5xl" style="color: #5277C3;" />
    <div class="font-mono text-xs tracking-widest" style="color: #27385D;">supply-chain provenance</div>
    <div class="text-sm" style="color: #0D1B2E;">content-pinned sources, signature-checked caches</div>
  </div>
  <div class="flex flex-col items-center justify-center gap-3 px-8 text-center bg-white">
    <Ico name="rewind" class="text-5xl" style="color: #5277C3;" />
    <div class="font-mono text-xs tracking-widest" style="color: #27385D;">fast recovery</div>
    <div class="text-sm" style="color: #0D1B2E;">one rollback from known-good</div>
  </div>
  <div class="flex flex-col items-center justify-center gap-3 px-8 text-center" style="background: #EDF2FA;">
    <Ico name="fire" class="text-5xl" style="color: #5277C3;" />
    <div class="font-mono text-xs tracking-widest" style="color: #27385D;">erase your darlings</div>
    <div class="text-sm" style="color: #0D1B2E;">wipe root on every boot; only declared state survives</div>
  </div>
</div>

<!--
The use case that surprises people: every reproducibility property doubles as a security control. Store is read-only and hash-verifiable (`nix store verify`), so tampering has nowhere to hide; the machine either matches its declaration or isn't that generation; reproducible builds let you *verify* binaries not trust them. "Erase your darlings" (grahamc's impermanence post) rolls root back every boot, so any attacker persistence evaporates — full slide later. Segue: this is why ANSSI workstations and DoD-STIG'd hardware land on NixOS. Receipts next.
-->

---
layout: center
---

<div class="absolute inset-0 grid grid-cols-2 grid-rows-2 bg-white">
  <div class="flex flex-col items-center justify-center gap-3 bg-white">
    <Ico name="circle-flags:fr" class="text-6xl" />
    <div class="font-mono text-xs tracking-widest" style="color: #27385D;">sécurix</div>
    <div class="text-sm" style="color: #0D1B2E;">French government migrates from Windows to NixOS</div>
  </div>
  <div class="flex flex-col items-center justify-center gap-3" style="background: #EDF2FA;">
    <Ico name="x:anduril" class="text-6xl" style="color: #0D1B2E;" />
    <div class="font-mono text-xs tracking-widest" style="color: #27385D;">anduril</div>
    <div class="text-sm" style="color: #0D1B2E;">military-grade DoD hardware deployments</div>
  </div>
  <div class="flex flex-col items-center justify-center gap-3" style="background: #EDF2FA;">
    <Ico name="logos:replit-icon" class="text-6xl" />
    <div class="font-mono text-xs tracking-widest" style="color: #27385D;">replit</div>
    <div class="text-sm" style="color: #0D1B2E;">"from 50 languages to all of them"</div>
  </div>
  <div class="flex flex-col items-center justify-center gap-3 bg-white">
    <Ico name="logos:shopify" class="text-6xl" />
    <div class="font-mono text-xs tracking-widest" style="color: #27385D;">shopify</div>
    <div class="text-sm" style="color: #0D1B2E;">dev tooling rebuilt on Nix</div>
  </div>
</div>

<!--
France: DINUM picked NixOS for reproducibility — Sécurix (hardened, ANSSI-guided, FIDO2) for sysadmins, Bureautix for office; ~250 machines by end 2026, a phased cross-gov start, not 2.5M overnight — github.com/cloud-gouv/securix. Anduril: NixOS on defense hardware at fleet scale — the DoD STIG is bureaucratic proof it ships; Nix spread through gov via ex-Anduril engineers. Replit: whole nixpkgs per repl → "50 languages to all of them", then donated $25k (blog.replit.com/nix, /betting-on-nix). Shopify: `dev up` pins nixpkgs per repo, published the Nixology screencasts.
-->
