---
layout: center
class: text-center
---

<SectionBookend image="/alice-meet-nix.png" title="Meet Nix" subtitle="history and theory — what it is and where it came from" />

---
layout: center
class: text-center
---

<div class="flex flex-col items-center">
  <div class="w-72 h-72 rounded-full" style="background: url(/eelco-dolstra.jpg) center / cover no-repeat; box-shadow: 0 12px 40px rgba(0,0,0,0.35);"></div>
  <div class="text-3xl font-bold pt-6">Eelco Dolstra</div>
  <div class="text-lg opacity-70 pt-1">the man who nixed it all</div>
</div>

<!--
Put a face to the name right away: Eelco Dolstra — created Nix as his PhD research in 2003, and today co-founder of Determinate Systems. Everything in this section flows from his thesis.
-->

---
layout: center
class: text-center
---

<div class="flex flex-col items-center">
  <div class="h-[400px] aspect-[100/141] bg-white" style="background: url(/thesis-title-page.png) center / contain no-repeat; box-shadow: 0 12px 40px rgba(0,0,0,0.35);"></div>
  <div class="text-lg opacity-70 pt-5">Utrecht, 2006 — the PhD thesis it all falls out of</div>
</div>

<!--
The actual title page: "The Purely Functional Software Deployment Model", defended January 18, 2006 at Utrecht University. Everything in this deck — the store, derivations, closures, NixOS itself — is this one idea worked out: treat software deployment as a purely functional computation.
-->

---
layout: center
class: text-center
---

<div class="flex flex-col items-center">
  <div class="h-[400px] w-[440px]" style="background: url(/functional-mapping.svg) center / contain no-repeat;"></div>
  <div class="text-lg opacity-70 pt-4">the whole thesis in one picture — a build is a <b>pure function</b></div>
</div>

<!--
The thesis, as a diagram (from Tweag's Nix blog): a build is a mathematical mapping — inputs in, store path out, nothing else touched. Same inputs, same arrow, same output — forever. Hold onto this picture: the store, caching, rollbacks, and everything in "Under the hood" are just this arrow, applied everywhere.

Credit: tweag.io — the functional-mapping figure from their Nix series.
-->

---
layout: center
---

<Timeline :items="[
  { year: '2003', label: 'PhD research begins', muted: true, dashedAfter: true },
  { year: '2006', label: `Eelco Dolstra's 🇳🇱 PhD thesis`, icon: 'graduation-cap' },
  { year: '2007', label: `<b>NixOS</b> is born, from Armijn Hemel's 🇳🇱 master's thesis` },
  { year: '2013', label: 'first stable release — NixOS <b>13.10</b>' },
  { year: '2020–21', label: '<b>flakes</b> arrive (experimental)' },
  { year: '2026', label: `nixpkgs crosses <a href='https://github.com/NixOS/nixpkgs'><b>1,000,000</b> commits</a>`, icon: 'confetti' },
]" />

<!--
Walk the pins left to right. The dotted stretch is the research years: Eelco starts Nix as PhD work in 2003; the first solid pin is the thesis itself — "The Purely Functional Software Deployment Model", 2006 — which you just saw. 2007: NixOS emerges from Armijn Hemel's master's thesis — a whole distro driven by Nix. After continued development, NixOS issued its first stable release, 13.10, in 2013. Through the 2010s nixpkgs grows into one of the largest package collections in existence. 2020–21: flakes land (still experimental) — pinned inputs + lockfiles for the whole ecosystem. May 2026: nixpkgs crosses 1,000,000 commits.

The millionth commit was a humble version bump (`serpl: 0.3.4 → 0.3.5`, May 13 2026) — just like the 999,999 before it. That's the point: relentless, boring freshness.

Honest fine print: a few *mirrors* on GitHub are bigger — Chromium (~1.78M), Linux (~1.46M), Gentoo (~1.07M) — but their development happens elsewhere. Among repos whose actual development lives on GitHub, nixpkgs is №1 by commits and Homebrew/homebrew-core is №2 at ~836k (counts as of July 2026, via the GitHub API).

Today: stewarded by the NixOS Foundation and companies like Determinate Systems — co-founded by Eelco himself; among the largest *and* freshest repos anywhere.
-->

---
layout: center
class: text-center
---

<Wilhelmus />

<div class="relative grid grid-cols-3 gap-4 w-[880px]">
  <div v-click class="h-56 rounded-xl shadow-2xl" style="background: url(/dutch-windmills.jpg) center / cover no-repeat;"></div>
  <div v-click class="h-56 rounded-xl shadow-2xl" style="background: url(/dutch-tulips.jpg) center / cover no-repeat;"></div>
  <div v-click class="h-56 rounded-xl shadow-2xl" style="background: url(/dutch-clogs.jpg) center / cover no-repeat;"></div>
  <div v-click class="h-56 rounded-xl shadow-2xl" style="background: url(/dutch-gouda.jpg) center / cover no-repeat;"></div>
  <div v-click class="h-56 rounded-xl shadow-2xl" style="background: url(/dutch-beurs.jpg) center / cover no-repeat;"></div>
  <div v-click class="h-56 rounded-xl shadow-2xl backdrop-blur-sm" style="background: rgba(255,255,255,0.85) url(/nix-logo.png) center / 60% no-repeat;"></div>
</div>

<!--
Gag slide: het Wilhelmus swells over a glorious waving flag — say nothing, let the room work it out. Click the Dutch icons in one by one: windmills, tulips, clogs, gouda, the world's first stock market (that's Emanuel de Witte's painting of the Amsterdam exchange courtyard in full swing, 1653 — the exchange itself dates to 1602)… and the Netherlands' latest gift to civilization, reproducible builds. The music stops itself on slide change.

The whole origin story is Dutch: Eelco Dolstra's PhD at Utrecht, Armijn Hemel's master's thesis (NixOS) at the same university, even the name — "niks" is Dutch for "nothing". Bonus beat: they invented the stock market AND tulips — together, the first market bubble (tulip mania, 1637).

Photos: Wikimedia Commons (Kinderdijk windmills; Bollenstreek tulip fields; Drenthe clog museum; Gouda cheese market; De Witte's "Courtyard of the Beurs", 1653). Audio: US Navy Band instrumental of "Het Wilhelmus", public domain, via Wikimedia Commons.
-->

---

# Wait — what does "nix" even mean? <Ico name="snowflake" class="text-2xl" />

<div class="grid grid-cols-3 gap-8 pt-6">
<div>

### <Ico name="snowflake" /> Latin — _nix_
**snow.** `nix, nivis` — hence the **snowflake** logo. And like a snowflake, no two builds are alike: each one is named by its unique **content hash**.

</div>
<div>

### <Ico name="prohibit" /> Dutch — _niks_
**nothing.** Every build starts from _nothing_ — an empty clean room. If you didn't declare it, it isn't there.

</div>
<div>

### <Ico name="scissors" /> English — _to nix_
**cancel · veto · kill.** As in: _nix_ dependency hell, _nix_ "works on my machine."

</div>
</div>

<div class="opacity-60 text-sm pt-8">One little word, three promises — and all three turn out to be true.</div>

---

# …and "Nix" means four things at once <Ico name="cards" class="text-2xl" />

<div class="grid grid-cols-4 gap-6 pt-6">
<div>

### <Ico name="translate" /> the language
A lazy, purely-functional DSL. You **write** Nix to describe what you want built.

</div>
<div>

### <Ico name="package" /> the package manager
The tool that **evaluates** that language, builds derivations, and owns the `/nix/store`. Runs on any Linux, macOS, WSL.

</div>
<div>

### <Ico name="folders" /> nixpkgs
The **package collection** — 100k+ recipes written in the language, built by the tool. The world's largest.

</div>
<div>

### <Ico name="laptop" /> the OS — NixOS
A whole **Linux distro** where the language configures the _entire_ system, not just packages.

</div>
</div>

<div class="opacity-60 text-sm pt-8">Same three letters, four layers — language → package manager → nixpkgs → OS. We'll take them in that order.</div>

---

# Functional 101 — everything is an expression

Nix is a **purely functional** language — a program isn't a list of instructions, it's one expression that **evaluates to a value**:

<div class="grid grid-cols-2 gap-10 pt-4">
<div>

### <Ico name="simple-icons:python" /> statements — _run for effect_

```python
if prod:
    port = 443
else:
    port = 8080
```

</div>
<div>

### <Ico name="snowflake" /> expressions — _evaluate to a value_

```nix
port = if prod then 443 else 8080;
```

</div>
</div>

<div class="pt-8 text-center text-lg">no <code>return</code> · no <code>else</code>-less <code>if</code> · the whole file is <strong>one expression</strong> — so anything nests anywhere</div>

<div class="opacity-60 text-sm pt-6 text-center">Nix is a <strong>functional language</strong> — this comes with the territory (Haskell, OCaml, Elixir…). Nix's twist: the value describes a <em>build</em>.</div>

<!--
The contrast is with *statements*. In Python or Bash, a program is a list of instructions run top-to-bottom for their effects; a statement *does* something but *is* nothing — you can't ask "what's the value of this `if` block?". Nix has no statements: every construct — including the whole file — evaluates to a value.

`if` works like a ternary (`x ? a : b`), not a branch of instructions — which is why Nix's `if` *requires* an `else`: an expression must always have a value.

Back-reference the previous slide: the file was ONE expression whose value is the attrset at the bottom. `let … in` isn't "declare variables, then run code" — it's an expression whose value is its body, with some names bound. Functions have no `return`: the body is a single expression, and its value IS the return value.

Payoff: since everything is a value, anything nests anywhere — an `if` inside a list, a `let` inside an attribute. Good analogies: JSON with variables and functions, or a spreadsheet — every cell is a formula that computes a value; nothing is a command that runs.

The simple frame: Nix is a **functional language**, and expressions-instead-of-statements comes with that territory — Haskell, OCaml, Elixir, Scala, the Lisps all work this way. (Precision, if asked: the two aren't synonyms — Rust is expression-oriented without being a functional language, `let x = if cond { 1 } else { 2 };`.) If you know any of those languages, you already have the intuition. What *is* rare is Nix's combination: pure AND lazy (only Haskell really shares that) — and the value you're computing describes a build.
-->
---

# No side effects — what that buys you <Ico name="sparkle" class="text-2xl" />

An expression can't mutate anything: its value depends on its inputs **alone**. Everything else falls out of that:

- **Deterministic** — an expression is a pure function: same inputs → **same output, every time**; nothing ambient can sneak in and change the answer
- **Reproducible by construction** — deterministic + pinned inputs = the same result on your laptop, in CI, next year
- **Cache everything, trust everything** — no hidden state can invalidate a result, so binary caches come for free
- **Lazy without fear** — nothing runs "for effect", so evaluating a 100k-package set computes only what you ask for
- **Parallel by default** — independent builds can't interfere, so the dependency graph builds concurrently
- **Compose, don't script** — every piece is **hermetic**, so pieces nest and mash together **infinitely**: drop a module into any config and it just works — it _can't_ reach outside itself and break something else

<div class="opacity-60 text-sm pt-4">Nix's domain-specific twist: the value you're computing is a <b>build recipe</b> (a derivation) — so all of this applies to your whole system.</div>

<!--
Terminology worth pinning down here, because a comparison table later leans on it: **deterministic** is the property of the function (same inputs, same output — nothing else has a say), **reproducible** is what you get when you combine that with pinned inputs (anyone, anywhere, any year can re-run it). Terraform is declarative but *not* deterministic — `apply` consults live cloud state; Nix is both.

Dwell on **compose** — it's the one that changes how you work day to day, and it's hard to appreciate until you've felt it.

In imperative config-land, combining two setups means interleaving their side effects: run this script before that one, hope they don't both write to the same file, debug the ordering when they do. Composition is *glue* — and glue scales badly.

In Nix, a module is just a **value** — a function from inputs to config. It can't write files, set env vars, or mutate the machine while evaluating. That hermeticity is exactly what makes "just drop it in" safe: the *only* way a module affects the world is through the value it returns, and values merge, nest, and override cleanly.

So you can nest infinitely, in ways that sound reckless anywhere else: embed someone's entire desktop config as one attribute of yours; pull three flakes' modules into one machine; override a single leaf deep inside someone else's stack without forking it. It's LEGO, not glue — bricks compose because the studs are the only interface.

This is also why the whole ecosystem is shaped like "modules you drop in" — Home Manager, nix-darwin, clan.lol all rely on it. Foreshadow: the "It all composes 🧩" slide later picks this thread back up.
-->


---

# Procedural vs declarative

Two ways to get a machine into a state — describe the **steps**, or describe the **result**:

<div class="grid grid-cols-2 gap-10 pt-4">
<div>

### <Ico name="wrench" /> procedural — _say how_

```bash
sudo apt install nginx
sudo vim /etc/nginx/nginx.conf
sudo systemctl enable --now nginx
# …and again, by hand, on the next box
```

</div>
<div>

### <Ico name="snowflake" /> declarative — _say what_

```nix
services.nginx = {
  enable = true;
  virtualHosts."example.com".root = "/var/www";
};
```

</div>
</div>

<div class="pt-8 text-center text-lg">steps depend on <strong>where you start</strong> · a declared result is derived fresh <strong>from zero</strong>, every time</div>

<div class="opacity-60 text-sm pt-6 text-center">The functional language is what makes this <strong>enforceable</strong>: a config can't <em>do</em> anything — it can only <em>describe</em>.</div>

<!--
Imperative systems are defined by their **history**: the current state is the sum of every command anyone ever ran, in order, including the ones nobody remembers. Reproducing the machine means replaying an unknown script. Config management tools (Ansible et al.) automate the steps, but the steps still mutate whatever state they land on.

Declarative flips it: the file states the **end state**, and the tool derives whatever steps are needed — from any starting point, including a blank disk. Idempotent by construction; drift has nowhere to live because nothing is defined *relative to now*.

Tie back to the previous slide: expressions-not-statements is the same idea one level down. And forward: "no side effects" is why Nix's declarative promise actually holds — the config *can't* sneak in an imperative step.
-->

---
layout: center
class: text-center
---

# The boundaries dissolve <Ico name="circle-dashed" class="text-3xl" />

<div class="pt-3 text-xl"><Ico name="package" /> an app &nbsp;·&nbsp; <Ico name="gear" /> a config &nbsp;·&nbsp; <Ico name="puzzle-piece" /> a module &nbsp;·&nbsp; <Ico name="rocket" /> a deployment &nbsp;·&nbsp; <Ico name="laptop" /> an OS</div>

<div class="text-left text-sm max-w-3xl mx-auto pt-4">

```nix
{
  packages.myapp = rustPlatform.buildRustPackage { src = ./.; };  # 📦 an app
  nixosConfigurations.server = nixosSystem {                      # 💻 an OS
    modules = [
      { services.myapp = { enable = true; port = 8080; }; }       # ⚙️ a config
      { programs.mosh.enable = true;                              # 🧩 a module…
        nixpkgs.overlays = [(final: prev: {
          mosh = prev.mosh.overrideAttrs {                        # …carrying a patched build
            patches = [ ./fix-mosh-colors.patch ];
          };
        })];
      }
      { networking.hostName = "wonderland";                       # 🚀 a deployment —
        imports = [ ./hardware.nix ]; }                           #    this exact machine
    ];
  };
}
```

</div>

<div class="opacity-70 pt-3">A system is a big package · a package is a tiny system.</div>

<div class="opacity-60 text-sm pt-2">These <b>17 lines</b>, checked into GitHub, are a harvest: this exact machine, rebuildable by anyone, forever →</div>

<!--
Close by counting: seventeen lines. Push them to GitHub and the machine stops being a machine — it's a *fact* now: anyone, on any hardware, this year or in ten, can check out that commit and get this exact server back, patched mosh and all. That's the extropy harvest the next slide names — the segue is literally the arrow on screen.

One of the big philosophical payoffs. Everywhere else these are *different kinds of thing* with different tools: an app (apt/brew), a config file (/etc), a module (Ansible role), a deployment (Terraform/Helm), an OS (the distro's business). In Nix they're all the same primitive — an expression that evaluates to a derivation in one graph — so the categories stop being categories.

Walk the example inside-out: a custom Rust project built as a package; a config line that flips it on as a service; a module that enables mosh — and *inside* it, an overlay carrying a source patch onto mosh's build; and at the bottom, the deployment: a hostname plus `hardware.nix` pins this value to one *physical machine* — disks, kernel modules, the actual box. Five "different kinds of thing", one nested value — no impedance mismatch at any seam.

(And getting it onto that box is one command — `nixos-rebuild switch --target-host` or nixos-anywhere — worth saying aloud.)

Concrete consequences: a whole NixOS system can be a flake *input* to something else; a dev shell and an OS are built by the same command family; `nixos-rebuild` and `nix build` differ only in what the derivation *describes*.

There's no boundary where "config" ends and "software" begins — it's values all the way down. And that sets up the next slide: if everything is one kind of thing, everything can be *captured* the same way.
-->

---
layout: center
class: text-center
---

# Extropy Harvesting <Ico name="plant" class="text-3xl" />

<div class="opacity-80 text-xl pt-2">every system slides toward chaos — Nix lets you <em>capture</em> the order instead of losing it</div>

<div class="grid grid-cols-2 gap-10 text-left max-w-3xl mx-auto pt-10">
<div>

### <Ico name="spiral" /> Entropy — the default
Systems drift. Packages rot, config diverges, "works on my machine." Every manual fix leaks back into disorder.

</div>
<div>

### <Ico name="plant" /> Extropy — what you harvest
Each fix you _declare_ becomes permanent structure. Order accumulates in `.nix` instead of evaporating.

</div>
</div>

<div class="pt-10 text-lg">a commit hash + some Nix = a working system, <b>crystallized</b> — permanently, anywhere</div>

<div class="opacity-60 text-sm pt-3">This is the superpower everything you just saw adds up to. Hold onto it for the rest of the talk.</div>

<!--
Land the section on the payoff of all the philosophy: pure functions, declared inputs, hashed outputs — individually they sound academic, but together they mean that once a fix exists as Nix code in a commit, it is *permanently* captured. Check out that rev in five years, on a different machine, and the same system comes back. Effort stops evaporating; order compounds.

That's the frame for everything that follows — every tool and trick in the rest of the deck is a way of harvesting more order into the crystal.
-->

---

# Everyone fights the same entropy

> _"…but it works on my machine"_ — each tool attacks one face of it

| | <Ico name="logos:npm-icon" /> npm | <Ico name="logos:ansible" /> Ansible | <Ico name="logos:docker-icon" /> Docker | <Ico name="logos:terraform-icon" /> Terraform | <Ico name="simple-icons:nixos" /> NixOS |
| --- | :---: | :---: | :---: | :---: | :---: |
| <Ico name="play-circle" /> **Services** | <Ico name="check-fat" class="text-green-500" /> |  | <Ico name="check-fat" class="text-green-500" /> | <Ico name="check-fat" class="text-green-500" /> | <Ico name="check-fat" class="text-green-500" /> |
| <Ico name="desktop-tower" /> **Machines** |  | <Ico name="check-fat" class="text-green-500" /> |  | <Ico name="check-fat" class="text-green-500" /> | <Ico name="check-fat" class="text-green-500" /> |
| <Ico name="lock-key" /> **Lockfile** | <Ico name="check-fat" class="text-green-500" /> |  |  | <Ico name="check-fat" class="text-green-500" /> | <Ico name="check-fat" class="text-green-500" /> |
| <Ico name="scroll" /> **Declarative** |  |  |  | <Ico name="check-fat" class="text-green-500" /> | <Ico name="check-fat" class="text-green-500" /> |
| <Ico name="package" /> **Hermetic** |  |  | <Ico name="check-fat" class="text-green-500" /> |  | <Ico name="check-fat" class="text-green-500" /> |
| <Ico name="equals" /> **Deterministic** |  |  |  |  | <Ico name="check-fat" class="text-green-500" /> |

<div class="opacity-60 text-sm pt-3">Every tool holds a piece — Nix holds them all, and <b>reproducible</b> falls out.</div>

<!--
The villain first: "works on my machine" is **entropy** — unrecorded change piling up until nobody can explain the box. Its four faces: one global mutable pile (`/usr/lib` as a shared variable every install mutates), zombie machines (the system is the sum of every command ever run on it), build-system roulette (your gcc 13 vs CI's gcc 12), and setup by folklore (a README replayed by hand, drifting every time). Every tool in this table is an attempt to fix a slice of that; Nix goes after the root cause — implicit, mutable, global state.

Walk it row by row:

**Services** — the thing you actually run: npm's `scripts` start your app, Docker runs it as a container (compose wires up several), and Terraform providers configure managed services — databases, DNS, queues — through resource modules much like Nix modules. On NixOS a service is a module option — `services.nginx.enable = true` gives you a supervised systemd unit, config file and user included, in the same graph as everything else.

**Machines** — Ansible configures everything inside the box: packages, services, users, files. Terraform gets the check from the other side: it creates and shapes the machine itself — size, disks, network, DNS. Neither covers both ends; Nix is one graph from bootloader to dotfiles. (Terraform isn't a rival anyway — pair them: it provisions the box, `nixos-anywhere` defines what runs inside.)

**Lockfile** — npm's `package-lock.json` pins exact versions + integrity hashes (the flake ≈ package.json analogy lands in Under the hood); Terraform's `.terraform.lock.hcl` pins providers by hash too. But npm only covers the JS layer (a native addon still needs system libs and a compiler, and phantom deps + `postinstall` leak through), and Terraform pins the *tooling*, not what lands in the box — the AMI is an opaque blob. Nix locks the whole closure down to glibc.

**Declarative** — HCL states a goal and the tool derives the steps; Terraform's `plan` even diffs it first. npm doesn't earn it: `package.json` lists deps, but what you actually get is whatever `node_modules` mutated into — ranges resolve differently over time, hoisting reshuffles the tree, `postinstall` runs arbitrary code. Ansible stays unchecked too: playbooks are ordered tasks — "configured" is whatever the tasks *did*, not a value you can inspect or diff. In Nix the system **is a value** — evaluated, not executed; modules merge & override.

**Hermetic** — a Docker image bundles a full userland, so the app never borrows from whatever the host has installed. Nix gets the same property via the closure: self-contained down to glibc, RPATHs straight into `/nix/store`. Don't oversell either side: Docker also *contains* at runtime (namespaces, cgroups) which Nix doesn't do, and a `FROM ubuntu + apt install` build is anything but hermetic — Docker pins the **outcome**, Nix pins the **process that produces it**.

**Deterministic** — the row that keeps Terraform honest, since it collects Services, Machines, Lockfile *and* Declarative. Same input, same output — no tool but Nix has it: `terraform apply` consults live cloud state and provider APIs, so the same HCL does different things depending on what reality looks like today; npm resolves ranges at install time; a Docker build runs whatever commands the network serves it. Nix evaluation is a pure function — no network, no ambient state — so the same `flake.lock` yields the same system, this year or next. This is the "no side effects" idea from a few slides back, cashed out as a column.

**The footer is the punchline** — reproducible is what falls out of holding every row at once: pinned inputs + declared value + whole-machine scope + hermetic closure = the same config rebuilds the same system, this year or next, with atomic switch and rollback for free. That's the root fixed, not a symptom patched — and it's exactly the extropy you just saw crystallized.
-->

---

# Where people point it <Ico name="target" class="text-2xl" />

A NixOS system is **exactly what you declared — and nothing more**. No preinstalled fluff, just your closure:

<div class="grid grid-cols-3 gap-x-8 gap-y-6 pt-4">
<div>

### <Ico name="laptop" /> your own desktop
NixOS (or a Mac via nix-darwin) — the whole machine in one repo, rebuilt at will

</div>
<div>

### <Ico name="desktop" /> servers — beefy or tiny
declarative fleets with atomic rollbacks — and a minimal closure fits high-performance and low-resource boxes alike

</div>
<div>

### <Ico name="robot" /> embedded & robotics
cross-compiled ARM images, atomic A/B updates for devices you can't drive to

</div>
<div>

### <Ico name="code" /> dev environments
per-repo toolchains that match CI exactly — onboarding is `cd` + `direnv allow`

</div>
<div>

### <Ico name="package" /> container images
`dockerTools` builds OCI images from the exact closure — no `Dockerfile`, tiny layers

</div>
<div>

### <Ico name="microscope" /> reproducible research
pin the entire stack in a lockfile; rerun the experiment bit-for-bit, years later

</div>
</div>

<div class="opacity-60 text-sm pt-8">One language, one store — the same tool scales from a robot's flash image to the laptop in front of you.</div>

<!--
Lead with the minimality point: a conventional distro image ships hundreds of packages someone else chose — a NixOS system is *derived from your declaration*, so it contains the closure of what you asked for and literally nothing else. Less disk, less RAM, less attack surface, nothing to uninstall. That's why the same OS is at home on a high-performance server, a 512 MB VPS, and an embedded board.

The spread is the point: this isn't a dev-shell tool OR a distro OR a deploy tool — the same primitive (a hashed, declarative build) serves every layer.

Real-world anchors if asked: robotics/defense companies ship NixOS on devices (Anduril is the famous example), scientific teams use it for paper-reproducibility, and plenty of companies use only the dev-shell layer (devenv/devbox) without ever touching NixOS.

Segue: there's one more use case that deserves its own slide — the minimality you just saw is actually a *security* property.
-->

---

# …and one more: hardened deployments <Ico name="lock" class="text-2xl" />

The same properties that make builds **reproducible** make systems **defensible**:

- <Ico name="target" /> **Small attack surface** — nothing preinstalled means nothing forgotten
- <Ico name="cube" /> **Immutable store** — read-only binaries, re-verifiable against their hash
- <Ico name="scroll" /> **Auditable as code** — every change is a diff; drift isn't detected, it's _impossible_
- <Ico name="link" /> **Supply-chain provenance** — content-pinned sources, signature-checked caches
- <Ico name="arrow-counter-clockwise" /> **Fast recovery** — a compromised deploy is one rollback from known-good
- <Ico name="fire" /> **Erase your darlings** — wipe root on every boot; only _declared_ state survives

<div class="opacity-60 text-sm pt-6">sounds theoretical? the next slide is receipts <Ico name="arrow-right" /></div>

<!--
This is the use case that surprises people — Nix reads as a developer convenience until you notice every property doubles as a security control:

- **Small attack surface** — no stray daemon listening, no distro-chosen package quietly waiting for a CVE you didn't know you shipped.
- **Immutable store** — `/nix/store` is mounted read-only; binaries can't be tampered with in place, and any path can be re-verified against its hash with `nix store verify`. Malware that wants to quietly patch a binary has nowhere to hide.
- **Auditable as code** — the whole machine is a reviewable repo + lockfile: every change is a diff, every deploy a hash. A machine either matches its declaration or it isn't that generation.
- **Supply-chain provenance** — every source pinned by content hash, every cache artifact signature-checked, and reproducible builds let independent builders *verify* binaries instead of trusting them.
- **Fast incident recovery** — bad or compromised deploy → one rollback (or reboot) to a known-good generation.
- **Erase your darlings** — the impermanence pattern (grahamc's famous post): root lives on tmpfs or gets ZFS-rolled-back on every boot, so the machine restarts as *exactly* its declaration plus explicitly persisted paths. Any persistence an attacker planted — or any hand-hack you forgot — evaporates at reboot. Full slide on this later in the ecosystem section.

Segue into the next slide: this is exactly why the serious, paranoid deployments — France's ANSSI-guided government workstations, DoD-STIG'd defense hardware — keep landing on NixOS. Receipts incoming.
-->

---

# Social proof <Ico name="chats" class="text-2xl" />

Don't just take my word for it:

<div class="grid grid-cols-2 gap-x-10 gap-y-6 pt-4">
<div>

### <Ico name="circle-flags:fr" /> France
DINUM is moving government workstations off Windows onto **Sécurix** — a hardened NixOS — [github.com/cloud-gouv/securix](https://github.com/cloud-gouv/securix)

</div>
<div>

### <Ico name="x:anduril" /> Anduril
ships NixOS on defense hardware — there's an official **DoD STIG** for ["Anduril NixOS"](https://www.stigviewer.com/stigs/anduril_nixos)

</div>
<div>

### <Ico name="logos:replit-icon" /> Replit
went ["from 50 languages to all of them"](https://blog.replit.com/nix) by rebuilding repls on Nix — then [bet $25k on it](https://blog.replit.com/betting-on-nix)

</div>
<div>

### <Ico name="logos:shopify" /> Shopify
rebuilt its dev tooling on Nix — and published the [*Nixology*](https://shopify.engineering/shipit-presents-how-shopify-uses-nix) screencasts

</div>
</div>

<div class="opacity-60 text-sm pt-6">governments · defense · dev platforms · retail — same language, same store, same hashes</div>

<!--
**France** (announced April 2026, via [The Stack](https://www.thestack.technology/frances-shift-from-us-technology-starts-with-250-dinum-machines-and-nixos/) — the r/NixOS thread that made the rounds: [reddit](https://old.reddit.com/r/NixOS/comments/1sifbju/france_plans_to_replace_windows_with_a_hardened/)): DINUM, the interministerial digital directorate, picked NixOS *specifically for reproducibility* — every workstation is declarative config in a repo. Two building blocks: **Sécurix** (hardened, ANSSI-guided, FIDO2 hardware-key login, for sysadmins) and **Bureautix** (KDE Plasma + LibreOffice/OnlyOffice for office work). Honest scale: ~250 DINUM machines by end of 2026 after a ~40-sysadmin pilot — a phased start to a cross-government rollout, not 2.5M desktops overnight. Both repos are public on GitHub under cloud-gouv.

**Anduril**: NixOS on embedded defense systems at fleet scale — the existence of an official DoD Security Technical Implementation Guide for "Anduril NixOS" (also NIST NCP checklist #1260) is bureaucratic proof it ships. Public artifacts: jetpack-nixos (NVIDIA Jetson support), robotnix. Graham Christensen's observation: Nix spread through government spaces largely via ex-Anduril engineers carrying it with them.

**Replit**: Nix let every repl choose from the whole nixpkgs set instead of one giant Docker image — that's how "50 languages" became "all of them". They later donated $25k to the NixOS Foundation, calling Nix the future of software distribution.

**Shopify**: dev environments via `dev up` pin an exact nixpkgs revision per repo; they also published the "Nixology" screencast series teaching Nix to their engineers (public on YouTube).
-->
