---
layout: center
class: text-center
---

<SectionBookend image="/alice-tea-party.png" title="Why people love it" subtitle="rollbacks, reproducibility — and it all composes" />

---

# Why people love it <span class="text-2xl">❤️</span>

Eight reasons — we'll take them one at a time.

<Stepper :current="0" />

---

# Instant rollbacks

<Stepper :current="1" />

<div class="grid grid-cols-2 gap-10 items-center mt-2">
<div>

Every rebuild is a new **generation**. Booted something broken? Pick the previous one from the boot menu — nothing was mutated in place.

</div>
<div>
<Placeholder label="boot menu listing NixOS generations" />
</div>
</div>

---

# Reproducibility

<Stepper :current="2" />

<div class="grid grid-cols-2 gap-10 items-center mt-2">
<div>

Same inputs → the same output, **bit for bit**. Your laptop, a CI runner, a teammate's machine — identical results.

</div>
<div>
<Placeholder label="identical build artifacts on different machines" />
</div>
</div>

---

# Build caching

<Stepper :current="3" />

<div class="grid grid-cols-2 gap-10 items-center mt-2">
<div>

Reproducible outputs are **shareable**. If someone already built this exact derivation, fetch the prebuilt binary from a cache (`cache.nixos.org`, or your own) instead of compiling it.

</div>
<div>
<Placeholder label="binary cache hit vs local build" />
</div>
</div>

---

# Declarative systems

<Stepper :current="4" />

<div class="grid grid-cols-2 gap-10 items-center mt-2">
<div>

Your whole machine in one config. No snowflake servers, no config drift — the system **is** the code.

</div>
<div>
<Placeholder label="configuration.nix → the whole desktop" />
</div>
</div>

---

# nixpkgs

<Stepper :current="5" />

<div class="grid grid-cols-2 gap-10 items-center mt-2">
<div>

The largest **and** freshest package set anywhere — 100k+ packages, updated fast.

</div>
<div>
<Placeholder label="package-count / freshness chart" />
</div>
</div>

---

# No dependency hell

<Stepper :current="6" />

<div class="grid grid-cols-2 gap-10 items-center mt-2">
<div>

Every version coexists, isolated by **content hash**. Two apps needing two different `glibc`s? Both happy.

</div>
<div>
<Placeholder label="two apps, two isolated dependency trees" />
</div>
</div>

---

# nixos-anywhere

<Stepper :current="7" />

<div class="grid grid-cols-2 gap-10 items-center mt-2">
<div>

Deploy a declarative NixOS config to **any** remote box — bare metal or a fresh cloud VM — in one command.

</div>
<div>
<Placeholder label="laptop deploying a config to a remote server" />
</div>
</div>

<div class="opacity-60 text-sm pt-4"><a href="https://github.com/nix-community/nixos-anywhere">github.com/nix-community/nixos-anywhere</a> · <a href="https://github.com/SaumonNet/proxmox-nixos">SaumonNet/proxmox-nixos</a></div>

---

# It all composes <span class="text-2xl">🧩</span>

> Pieces you stack, merge &amp; override without forking

<div class="grid grid-cols-2 gap-10 items-center mt-2">
<div>

- **Modules merge** — a hundred `.nix` files fold into one system; options combine, there's no single "main"
- **Overlays &amp; `overrideAttrs`** — bend any package deep in the tree without forking it
- **Flake inputs** — pull in someone's whole system as a dependency; `follows` dedupes the shared bits
- One value model everywhere → a dev shell, a package, and a whole OS all compose the **same way**

<div class="opacity-70 text-sm pt-2">Imperative tools stack <em>steps</em>; Nix composes <em>values</em> — the piece you didn't write still merges cleanly.</div>

</div>
<div>
<Placeholder label="many small .nix modules → merge into one system" />
</div>
</div>

---

# Sharing <span class="text-2xl">🎁</span>

<Stepper :current="8" />

> Because it all composes, a config isn't a snowflake — it's a **dependency you can import**

<div class="grid grid-cols-2 gap-10 items-center mt-2">
<div>

- Your whole machine is **one repo** — push it, and someone else can `nix build` it verbatim
- Publish reusable **modules** as flake outputs; others `import` them like a library
- The `flake.lock` travels too → they get **byte-identical** inputs, never "works on my machine"

<div class="opacity-70 text-sm pt-2">👀 In fact — <b>someone in this very room</b> already ships one…</div>

</div>
<div>
<Placeholder label="git push → someone else builds your exact machine" />
</div>
</div>

<!-- TODO: REMOVE before publishing — do not dox on the public deck -->
<div class="opacity-60 text-sm pt-4">🔗 <b>[TODO — remove before publish]</b> <a href="https://github.com/austinried/nix-common">github.com/austinried/nix-common</a> — flake-parts module library · dual stable/unstable channels · Home-Manager modules · even a custom Dart <code>dconf-mirror</code> tool</div>

---

# `austinried/nix-common` insights <span class="text-xs font-bold px-2 py-1 rounded bg-amber-400 text-black align-middle">🚧 TODO</span>

<div class="text-sm opacity-50 pb-2">speaker-note scratchpad — <b>remove / rework before publish, don't dox live</b> (Nix 86% / Dart 13% · created Nov 2024 · last push Jun 2026 · personal, 0★)</div>

- **It's a _library_, not one machine** — **flake-parts** (hercules-ci), publishing reusable `nixosModules.default`, `homeModules.default` &amp; `flakeModules` (incl. an `nixd` LSP module) for others to import → a living composability example
- **Dual-channel** — tracks `nixos-26.05` _and_ `nixos-unstable` side-by-side (matching Home-Manager via `follows`) → cherry-pick unstable pkgs onto a stable base
- **Home-Manager modules** — developer tooling, dotfiles via **yadm**, terminal, **VSCodium**, shell, and a **Japanese input** module (ibus + mozc, Ctrl+Space kana toggle, GNOME)
- **Custom Dart packages** — `dconf-mirror` (Dart CLI, `args` pkg — snapshots/mirrors GNOME `dconf` settings) &amp; `run-nixos-vm` (boots a NixOS VM) → unusual, standout touch
- **direnv** (`.envrc`) wires the dev shell · `x86_64-linux` only

---

# Why people reach for it

- **Reproducibility** — a build that works today works the same on another machine, next year
- **No "works on my machine"** — dependencies are pinned by content hash, not by whatever `apt` happened to install
- **Atomic upgrades & rollbacks** — switch generations forward or back instantly; nothing is mutated in place
- **Per-project dev shells** — drop into an environment with exactly the tools a repo needs, and nothing leaks out

---

# …and why people hate it <span class="text-2xl">💢</span>

> Fair is fair — the honeymoon comes with a hangover

<div class="grid grid-cols-2 gap-10 items-center mt-2">
<div>

- **№1, by a mile: the language is esoteric** — purely functional, lazy, untyped; it reads like nothing else you daily-drive
- **Cryptic errors** — `infinite recursion encountered`, five layers deep in a module you didn't write
- **The learning curve is a cliff** — and the docs assume you already fell off it

</div>
<div>
<Placeholder label="the infamous Nix learning-curve cliff" />
</div>
</div>

<!--
Don't undersell this: the esoteric language is THE adoption blocker, and it's been the top complaint in every community survey since forever. Acknowledge it honestly — the audience will trust the pitch more.
-->

---

# …but the answer already arrived <span class="text-2xl">🤖</span>

> An esoteric language is exactly the kind of problem LLMs erase

<div class="grid grid-cols-2 gap-10 items-center mt-2">
<div>

- LLMs are **fluent in Nix** — a million nixpkgs commits and every option doc are in the training set
- You'll see it in the demo in a moment: **describe the machine**, let the model write the `.nix`
- Declarative + atomic = **the safest playground for AI** — one file to review, `nixos-rebuild test` to try it, a generation to roll back if it lied

<div class="pt-4 text-lg"><b>LLMs ❤️ Nix</b> — they go together like…</div>

</div>
<div>
<Placeholder label="LLM writes the config · Nix verifies it" />
</div>
</div>

<!--
The pincer: Nix gives LLMs what they need (one declarative file as full context, a hash-verified build as ground truth), and LLMs give Nix what it needs (a fluent translator from intent to esoteric syntax). Neither works this well with anything else — mutable systems give agents no safety net, and Nix without AI gatekeeps behind the language.

Land the sentence, pause on "like…", then advance. 🥜🍇
-->

---

<PbjTime />

---
layout: center
class: text-center
---

<div class="text-7xl pb-2">🎬</div>

# Demo time

<div class="text-xl opacity-80 pt-2">Claude Code vibe-codes a NixOS config — live, against a fresh VM</div>

<div class="inline-block mt-8 text-sm font-bold px-3 py-1 rounded-full bg-red-500 text-white animate-pulse">● LIVE — switch to the VM</div>
