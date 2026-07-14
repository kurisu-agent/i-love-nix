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

# Wait — what does "nix" even mean? <span class="text-2xl">❄️</span>

<div class="grid grid-cols-3 gap-8 pt-6">
<div>

### ❄️ Latin — _nix_
**snow.** `nix, nivis` — hence the **snowflake** logo. And like a snowflake, no two builds are alike: each one is named by its unique **content hash**.

</div>
<div>

### 🚫 Dutch/German — _niks_
**nothing.** Every build starts from _nothing_ — an empty clean room. If you didn't declare it, it isn't there.

</div>
<div>

### ✂️ English — _to nix_
**cancel · veto · kill.** As in: _nix_ dependency hell, _nix_ "works on my machine."

</div>
</div>

<div class="opacity-60 text-sm pt-8">One little word, three promises — and all three turn out to be true.</div>

---

# …and "Nix" means four things at once <span class="text-2xl">🃏</span>

<div class="grid grid-cols-4 gap-6 pt-6">
<div>

### 🗣️ the language
A lazy, purely-functional DSL. You **write** Nix to describe what you want built.

</div>
<div>

### 📦 the package manager
The tool that **evaluates** that language, builds derivations, and owns the `/nix/store`. Runs on any Linux, macOS, WSL.

</div>
<div>

### 🗂️ nixpkgs
The **package collection** — 100k+ recipes written in the language, built by the tool. The world's largest.

</div>
<div>

### 💻 the OS — NixOS
A whole **Linux distro** where the language configures the _entire_ system, not just packages.

</div>
</div>

<div class="opacity-60 text-sm pt-8">Same three letters, four layers — language → package manager → nixpkgs → OS. We'll take them in that order.</div>

---

# A brief history <span class="text-2xl">📜</span>

- **2003** — Eelco Dolstra starts Nix as PhD research → thesis _"The Purely Functional Software Deployment Model"_ (2006)
- **2007** — **NixOS** is born: a whole Linux distro driven by Nix, out of Armijn Hemel's master's thesis
- **2010s** — **nixpkgs** grows into one of the largest package collections in existence
- **2020–21** — **flakes** arrive (experimental): pinned inputs + lockfiles for the whole ecosystem
- **May 2026** — [**nixpkgs** crosses **1,000,000 commits**](https://github.com/NixOS/nixpkgs) 🎉 — more than any other repo _developed on_ GitHub; №2 [Homebrew](https://github.com/Homebrew/homebrew-core) trails at ~840k
- **today** — stewarded by the NixOS Foundation & companies like [Determinate Systems](https://determinate.systems/) — co-founded by Eelco himself; among the largest _and_ freshest repos anywhere

<!--
The millionth commit was a humble version bump (`serpl: 0.3.4 → 0.3.5`, May 13 2026) — just like the 999,999 before it. That's the point: relentless, boring freshness.

Honest fine print: a few *mirrors* on GitHub are bigger — Chromium (~1.78M), Linux (~1.46M), Gentoo (~1.07M) — but their development happens elsewhere. Among repos whose actual development lives on GitHub, nixpkgs is №1 by commits and Homebrew/homebrew-core is №2 at ~836k (counts as of July 2026, via the GitHub API).
-->

---

# Functional 101 — everything is an expression

Nix is a **purely functional** language — a program isn't a list of instructions, it's one expression that **evaluates to a value**:

<div class="grid grid-cols-2 gap-10 pt-4">
<div>

### 🐍 statements — _run for effect_

```python
if prod:
    port = 443
else:
    port = 8080
```

</div>
<div>

### ❄️ expressions — _evaluate to a value_

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

# Procedural vs declarative

Two ways to get a machine into a state — describe the **steps**, or describe the **result**:

<div class="grid grid-cols-2 gap-10 pt-4">
<div>

### 🔧 procedural — _say how_

```bash
sudo apt install nginx
sudo vim /etc/nginx/nginx.conf
sudo systemctl enable --now nginx
# …and again, by hand, on the next box
```

</div>
<div>

### ❄️ declarative — _say what_

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

# No side effects — what that buys you <span class="text-2xl">✨</span>

An expression can't mutate anything: its value depends on its inputs **alone**. Everything else falls out of that:

- **Reproducible by construction** — same inputs → same output: on your laptop, in CI, next year
- **Cache everything, trust everything** — no hidden state can invalidate a result, so binary caches come for free
- **Lazy without fear** — nothing runs "for effect", so evaluating a 100k-package set computes only what you ask for
- **Parallel by default** — independent builds can't interfere, so the dependency graph builds concurrently
- **Compose, don't script** — every piece is **hermetic**, so pieces nest and mash together **infinitely**: drop a module into any config and it just works — it _can't_ reach outside itself and break something else

<div class="opacity-60 text-sm pt-4">Nix's domain-specific twist: the value you're computing is a <b>build recipe</b> (a derivation) — so all of this applies to your whole system.</div>

<!--
Dwell on **compose** — it's the one that changes how you work day to day, and it's hard to appreciate until you've felt it.

In imperative config-land, combining two setups means interleaving their side effects: run this script before that one, hope they don't both write to the same file, debug the ordering when they do. Composition is *glue* — and glue scales badly.

In Nix, a module is just a **value** — a function from inputs to config. It can't write files, set env vars, or mutate the machine while evaluating. That hermeticity is exactly what makes "just drop it in" safe: the *only* way a module affects the world is through the value it returns, and values merge, nest, and override cleanly.

So you can nest infinitely, in ways that sound reckless anywhere else: embed someone's entire desktop config as one attribute of yours; pull three flakes' modules into one machine; override a single leaf deep inside someone else's stack without forking it. It's LEGO, not glue — bricks compose because the studs are the only interface.

This is also why the whole ecosystem is shaped like "modules you drop in" — Home Manager, nix-darwin, clan.lol all rely on it. Foreshadow: the "It all composes 🧩" slide later picks this thread back up.
-->


---
layout: center
class: text-center
---

# The boundaries dissolve <span class="text-3xl">🫥</span>

<div class="pt-3 text-xl">📦 an app &nbsp;·&nbsp; ⚙️ a config &nbsp;·&nbsp; 🧩 a module &nbsp;·&nbsp; 🚀 a deployment &nbsp;·&nbsp; 💻 an OS</div>

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

# Extropy Harvesting <span class="text-3xl">🌱</span>

<div class="opacity-80 text-xl pt-2">every system slides toward chaos — Nix lets you <em>capture</em> the order instead of losing it</div>

<div class="grid grid-cols-2 gap-10 text-left max-w-3xl mx-auto pt-10">
<div>

### 🕳️ Entropy — the default
Systems drift. Packages rot, config diverges, "works on my machine." Every manual fix leaks back into disorder.

</div>
<div>

### 🌱 Extropy — what you harvest
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

# Where people point it <span class="text-2xl">🎯</span>

A NixOS system is **exactly what you declared — and nothing more**. No preinstalled fluff, just your closure — which is also a **security win** 🔒:

<div class="grid grid-cols-3 gap-x-8 gap-y-6 pt-4">
<div>

### 💻 your own desktop
NixOS (or a Mac via nix-darwin) — the whole machine in one repo, rebuilt at will

</div>
<div>

### 🖥️ servers — beefy or tiny
declarative fleets with atomic rollbacks — and a minimal closure fits high-performance and low-resource boxes alike

</div>
<div>

### 🤖 embedded & robotics
cross-compiled ARM images, atomic A/B updates for devices you can't drive to

</div>
<div>

### 🧑‍💻 dev environments
per-repo toolchains that match CI exactly — onboarding is `cd` + `direnv allow`

</div>
<div>

### 📦 container images
`dockerTools` builds OCI images from the exact closure — no `Dockerfile`, tiny layers

</div>
<div>

### 🔬 reproducible research
pin the entire stack in a lockfile; rerun the experiment bit-for-bit, years later

</div>
</div>

<div class="opacity-60 text-sm pt-8">One language, one store — the same tool scales from a robot's flash image to the laptop in front of you.</div>

<!--
Lead with the minimality point: a conventional distro image ships hundreds of packages someone else chose — a NixOS system is *derived from your declaration*, so it contains the closure of what you asked for and literally nothing else. Less disk, less RAM, less attack surface, nothing to uninstall. That's why the same OS is at home on a high-performance server, a 512 MB VPS, and an embedded board.

Unpack the security win — it's more than just "fewer packages":

- **Smaller attack surface** — nothing preinstalled means nothing forgotten: no stray daemon listening, no distro-chosen package waiting for a CVE you didn't know you shipped.
- **Immutable store** — `/nix/store` is mounted read-only; binaries can't be tampered with in place, and any path can be re-verified against its hash (`nix store verify`). Malware that wants to quietly patch a binary has nowhere to hide.
- **Auditable as code** — the whole machine is a reviewable repo + lockfile: every change is a diff, every deploy a hash. Config drift isn't "detected", it's *impossible* — a machine either matches its declaration or it isn't that generation.
- **Supply-chain provenance** — every source is pinned by content hash, every cache artifact is signature-checked, and reproducible builds let independent builders *verify* binaries instead of trusting them.
- **Fast incident recovery** — a bad or compromised deploy is one rollback (or reboot) away from a known-good generation.

The spread is the point: this isn't a dev-shell tool OR a distro OR a deploy tool — the same primitive (a hashed, declarative build) serves every layer.

Real-world anchors if asked: robotics/defense companies ship NixOS on devices (Anduril is the famous example), scientific teams use it for paper-reproducibility, and plenty of companies use only the dev-shell layer (devenv/devbox) without ever touching NixOS.
-->

