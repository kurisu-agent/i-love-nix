---
layout: center
class: text-center
---

<SectionBookend image="/alice-meet-nix.png" title="Meet Nix" subtitle="what it is, where it came from, how to start" />

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

# …and "Nix" means three things at once <span class="text-2xl">🃏</span>

<div class="grid grid-cols-3 gap-8 pt-6">
<div>

### 🗣️ the language
A lazy, purely-functional DSL. You **write** Nix to describe what you want built.

</div>
<div>

### 📦 the package manager
The tool that **evaluates** that language, builds derivations, and owns the `/nix/store`. Runs on any Linux, macOS, WSL.

</div>
<div>

### 💻 the OS — NixOS
A whole **Linux distro** where the language configures the _entire_ system, not just packages.

</div>
</div>

<div class="opacity-60 text-sm pt-8">Same three letters, three layers — language → package manager → OS. We'll take them in that order.</div>

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
Put a face to the name before the timeline: Eelco Dolstra — created Nix as his PhD research in 2003, and today co-founder of Determinate Systems. Everything on the next slide flows from his thesis.
-->

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

# The Nix language in 30 seconds

```nix
let
  pkgs = import <nixpkgs> {};
  greeting = name: "Hello, ${name}!";
in
{
  message = greeting "Nix";
  tools   = [ pkgs.git pkgs.jq pkgs.ripgrep ];
}
```

- **Attribute sets** (`{ ... }`) and **lists** (`[ ... ]`) are the building blocks
- Functions are `arg: body`, applied by juxtaposition: `greeting "Nix"`
- `let … in` binds names for the expression below; `${…}` interpolates into strings

<!--
The previous two slides in real syntax: the whole file is ONE expression whose value is the attrset at the bottom.
-->

---

# Getting Nix <span class="text-2xl">⬇️</span>

Two ways in — same language, same store, same commands:

<div class="grid grid-cols-2 gap-8 pt-6">
<div>

### 🐧 standalone
On **any Linux**, macOS, or WSL — one installer, no reboot:

```bash
curl -fsSL https://install.determinate.systems/nix \
  | sh -s -- install
```

</div>
<div>

### 💻 NixOS
The **whole OS** is Nix — config to bootloader. More on that in a moment.

</div>
</div>

<div class="opacity-60 text-sm pt-8">Try it on the machine you already have — going full NixOS is the deep end, not the entry fee.</div>

<!--
The installer is Determinate Systems' — the de-facto standard now: creates the /nix APFS volume on macOS, survives OS upgrades, has a real uninstaller, flakes on by default.

On macOS there's also **nix-darwin** worth mentioning aloud: the NixOS module system ported to the Mac — packages, launchd services, `defaults`-style settings, all declarative with generations and `darwin-rebuild switch`. It layers *on top of* this standalone install (the installer answers "how do I get Nix", nix-darwin answers "how do I make my Mac declarative"). It gets its own slide in the ecosystem section.
-->

---

# The everyday toolbox <span class="text-2xl">🧰</span>

> A handful of verbs cover most of daily Nix

<div class="grid grid-cols-2 gap-10 mt-2">
<div>

### 🏃 Ephemeral — try it, then it's gone

```bash
nix run   nixpkgs#hello      # run once, no install
nix shell nixpkgs#cowsay     # tools on PATH (subshell)
nix develop                  # enter a flake's devShell
nix search nixpkgs ripgrep   # find in 100k+ packages
```

</div>
<div>

### 📌 Persistent — sticks around

```bash
nix profile install nixpkgs#ripgrep
nix profile list | remove | rollback
nix build nixpkgs#hello      # → ./result symlink
nix flake init | update      # scaffold | bump lock
```

</div>
</div>

<div class="opacity-60 text-sm pt-4"><code>run</code>/<code>shell</code>/<code>develop</code> vanish when you exit · <code>profile</code> persists — with generations &amp; rollbacks, just like the system. Sweep up with <code>nix-collect-garbage -d</code>.</div>

---

# `nix profile` — installs that roll back too <span class="text-2xl">📌</span>

> Unlike `run` / `shell` / `develop`, this one **sticks around** — but it's still just symlinks &amp; generations

```bash
nix profile install nixpkgs#ripgrep   # add to your user profile
nix profile list                      # what's installed
nix profile rollback                  # undo the last change
```

<div class="grid grid-cols-2 gap-10 items-center mt-2">
<div>

- Your profile is a **generation-backed symlink tree** — `~/.nix-profile → /nix/store/…-profile`
- Every `install` / `remove` / `upgrade` mints a **new generation**; the old one stays for `rollback`
- Same model as `nixos-rebuild` — atomic &amp; reversible — but scoped to **one user**, no root needed
- Content-addressed underneath → two tools wanting different `glibc`s coexist happily

</div>
<div>
<Placeholder label="~/.nix-profile → one generation per change" />
</div>
</div>

<div class="opacity-60 text-sm pt-4">Ephemeral: <code>run</code> · <code>shell</code> · <code>develop</code> — vs — persistent &amp; rollback-able: <code>profile</code>.</div>

---

# …and NixOS takes it all the way <span class="text-2xl">💻</span>

<div class="grid grid-cols-2 gap-10 mt-2">
<div>

### ❄️ Nix
- The **language** + **package manager**
- Runs on any Linux, macOS, even WSL
- Dev shells, reproducible builds, the `/nix/store`
- **nixpkgs** = the package collection it draws from

</div>
<div>

### 💻 NixOS
- A full **Linux distribution** built on Nix
- The **whole system** is one declarative config
- Generations, rollbacks, services — all from `.nix` files
- Needs Nix; the reverse isn't true

</div>
</div>

<div class="opacity-60 text-sm pt-4">Nix is the engine 🔧 · NixOS is the car built around it 🚗 — but how does it compare to the tools you already use?</div>
