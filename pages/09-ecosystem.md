---
layout: center
class: text-center
---

<SectionBookend image="/alice-ecosystem.png" title="The ecosystem" subtitle="the tools & community around Nix" />

---

# nixpkgs — the mothership <Ico name="folders" class="text-2xl" />

<div class="grid grid-cols-2 gap-10 items-center mt-2">
<div>

**The** package collection — 100k+ packages *and* every NixOS module, one giant repo everything else builds on.

- <Ico name="rocket" /> **`nixos-unstable`** — rolling &amp; fresh; the default for desktops and flakes
- <Ico name="shield-check" /> **`nixos-25.05`** — stable release every six months (May &amp; November); only fixes get backported
- <Ico name="lightning" /> **Hydra** — the build farm: builds every package, **signs** it, fills `cache.nixos.org` — a branch only advances when it's green
- <Ico name="git-branch" /> **mix freely** — pin both, run a stable system with a handful of unstable packages

</div>
<div>
<Placeholder label="branches: master → nixos-unstable → nixos-25.05" />
</div>
</div>

<div class="opacity-60 text-sm pt-4"><a href="https://github.com/NixOS/nixpkgs">github.com/NixOS/nixpkgs</a> — the repo those 1,000,000 commits live in</div>

<!--
Start the ecosystem tour at the center of gravity: nixpkgs isn't "a repo of build scripts", it's the largest and freshest package collection in existence — and the NixOS module system lives in the same tree, which is why a package and the service that runs it always move together.

The tracks, in plain terms: everything merges into `master`; once it builds and passes tests, Hydra advances `nixos-unstable` — a rolling release in practice, and fresher than the AUR while being CI-tested. Twice a year (May and November) a release branch is cut — `nixos-25.05`, `nixos-25.11`, named YY.MM — which then only receives bug and security backports: that's what you put on servers. Channels vs flake inputs are just two ways of pointing at these same branches.

Hydra is the machinery behind all of it: the project's own open-source CI/build farm (hydra.nixos.org). Every commit's packages get built for each platform, the outputs are cryptographically signed and pushed to cache.nixos.org, and a channel/branch only advances past a commit once its build jobs are green. Two payoffs to say out loud: you almost never compile anything (your machine substitutes the exact signed binaries Hydra already built — same inputs, same hash, so the cache hit is *provably* the thing you asked for), and signature checking means a poisoned mirror can't hand you a tampered binary. It's the security model from the "hardened deployments" slide, running at ecosystem scale.

The mixing point lands well live: because packages are just values, "stable system + unstable neovim" is three lines — add a second nixpkgs input and pick packages from either. No PPA juggling, no partial-upgrade roulette.
-->

---

# nix-community <Ico name="users-three" class="text-2xl" />

<div class="grid grid-cols-2 gap-10 items-center mt-2">
<div>

The **community umbrella org** — where the ecosystem's de-facto-standard tools live and get maintained together.

- Home Manager, impermanence, comma, nh, nixvim, disko, NUR…
- Shared CI, binary cache &amp; co-maintainers for adopted projects
- The first place to look when nixpkgs alone isn't enough

</div>
<div>
<Placeholder label="nix-community — one org, dozens of standard tools" />
</div>
</div>

<div class="opacity-60 text-sm pt-4"><a href="https://github.com/nix-community">github.com/nix-community</a></div>

<!--
The second pillar: an umbrella GitHub org that adopts important community projects and gives them shared infrastructure — CI, a Cachix cache, and co-maintainers — so key tools don't live or die with one person's free time. Almost everything in the rest of this section lives here. Segue: starting with the one you'll reach for first — Home Manager.
-->

---

# Home Manager

<div class="grid grid-cols-2 gap-10 items-center mt-2">
<div>

Declarative **dotfiles &amp; user environment** — the layer you reach for right after NixOS itself.

- Your shell, editor, git config, packages — all in `.nix`
- Per-user **generations &amp; rollbacks**, just like the system
- Works standalone, or as a NixOS / nix-darwin module

</div>
<div>
<Placeholder label="Home Manager — dotfiles as code" />
</div>
</div>

<div class="opacity-60 text-sm pt-4"><a href="https://github.com/nix-community/home-manager">github.com/nix-community/home-manager</a></div>

---

# nix-darwin

<div class="grid grid-cols-2 gap-10 items-center mt-2">
<div>

NixOS-style **declarative config for macOS** — your Mac described in one repo, the same way.

- Manage system settings, packages, and `defaults` declaratively
- Pairs with **Home Manager** for your user environment
- Same Nix workflow across Linux and macOS

</div>
<div>
<Placeholder label="nix-darwin — declarative macOS config" />
</div>
</div>

<div class="opacity-60 text-sm pt-4"><a href="https://github.com/nix-darwin/nix-darwin">github.com/nix-darwin/nix-darwin</a></div>

---

# Dev environments

<div class="grid grid-cols-2 gap-10 items-center mt-2">
<div>

Per-project toolchains, friendlier than raw `nix develop`:

- **devenv** — languages, services (Postgres, Redis…), processes & scripts
- **devbox** — package-manager UX; you barely touch Nix
- **direnv + nix-direnv** — the shell **auto-activates** the moment you `cd` in

</div>
<div>
<Placeholder label="cd into a repo → the right tools just appear" />
</div>
</div>

<div class="opacity-60 text-sm pt-4"><a href="https://devenv.sh">devenv.sh</a> · <a href="https://www.jetify.com/devbox/">devbox</a> · <a href="https://github.com/nix-community/nix-direnv">nix-direnv</a></div>

---

# Docker <Ico name="plus" /> Nix — better together

> Not either/or — the store travels **both** directions

<div class="grid grid-cols-2 gap-8 mt-2">
<div>

### <Ico name="simple-icons:nixos" /> → <Ico name="logos:docker-icon" /> Nix builds the image
`dockerTools.buildLayeredImage` — an OCI image straight from Nix. No `Dockerfile`, just your **exact closure** (a few MB, no base distro) as reproducible layers.

```nix
dockerTools.buildLayeredImage {
  name = "my-app";
  contents = [ pkgs.my-app ];
  config.Cmd = [ "/bin/my-app" ];
}
```

</div>
<div>

### <Ico name="logos:docker-icon" /> → <Ico name="simple-icons:nixos" /> Nix inside the container
The **devcontainer feature** drops Nix into any image — reproducible tooling in Docker, Codespaces & CI, no NixOS required.

```jsonc
// .devcontainer/devcontainer.json
"features": {
  "ghcr.io/devcontainers/features/nix:1": {
    "packages": "nodejs_24,git"
  }
}
```

</div>
</div>

<div class="opacity-60 text-sm pt-2">Nix as the <b>builder</b> <Ico name="wrench" /> or Nix as the <b>guest</b> <Ico name="house" /> — hermetic builds, universal runtime.</div>

---

# clan.lol

<div class="grid grid-cols-2 gap-10 items-center mt-2">
<div>

Declarative **fleet management** built on NixOS — manage a whole network of machines from one repo.

- Zero-config peer-to-peer networking between machines
- Built-in **secrets** management
- One command to deploy and update the fleet

</div>
<div>
<Placeholder label="clan.lol — one repo managing many machines" />
</div>
</div>

<div class="opacity-60 text-sm pt-4"><a href="https://clan.lol">clan.lol</a></div>

---

# Cachix

<div class="grid grid-cols-2 gap-10 items-center mt-2">
<div>

Hosted **binary cache** for Nix — never compile the same thing twice.

- Push build artifacts once, pull them everywhere (laptops, CI, teammates)
- Turns slow first builds into fast cache hits
- The standard answer to "why is it building from source?"

</div>
<div>
<Placeholder label="cachix push/pull — build once, share everywhere" />
</div>
</div>

<div class="opacity-60 text-sm pt-4"><a href="https://cachix.org">cachix.org</a></div>

---

# ncps

<div class="grid grid-cols-2 gap-10 items-center mt-2">
<div>

Self-hosted **pull-through binary cache** — a local mirror sitting between your machines and `cache.nixos.org`.

- Fetches store paths on demand, then caches &amp; **signs** them for the whole LAN
- Download once → every laptop, server &amp; CI box substitutes locally
- Multi-upstream failover · S3 or local storage · SQLite/Postgres · Prometheus

</div>
<div>
<Placeholder label="ncps — LAN pull-through cache in front of cache.nixos.org" />
</div>
</div>

<div class="opacity-60 text-sm pt-4"><a href="https://github.com/kalbasit/ncps">github.com/kalbasit/ncps</a> — accelerate Nix retrieval across your local network</div>

---

# Secrets

<div class="grid grid-cols-2 gap-10 items-center mt-2">
<div>

"Where do passwords go in a config you commit to git?" — encrypted, decrypted at activation into tmpfs.

- **agenix** — age-based, one file per secret; simplest to start
- **sops-nix** — SOPS-based, scales to many secrets &amp; backends (age, KMS, PGP)
- Secrets never land in the world-readable `/nix/store`

</div>
<div>
<Placeholder label="encrypted secret → /run/secrets at activation" />
</div>
</div>

<div class="opacity-60 text-sm pt-4"><a href="https://github.com/ryantm/agenix">agenix</a> · <a href="https://github.com/Mic92/sops-nix">sops-nix</a></div>

---

# Discovery &amp; ergonomics

<div class="grid grid-cols-2 gap-10 items-center mt-2">
<div>

The tools that make daily Nix pleasant:

- **search.nixos.org** — find any package or NixOS option
- **comma (`,`)** — run any program without installing it: `, cowsay hi`
- **nh** — nicer `rebuild` / `switch` with pretty diffs &amp; smarter GC

</div>
<div>
<Placeholder label="search.nixos.org + , + nh" />
</div>
</div>

<div class="opacity-60 text-sm pt-4"><a href="https://search.nixos.org">search.nixos.org</a> · <a href="https://github.com/nix-community/comma">comma</a> · <a href="https://github.com/nix-community/nh">nh</a></div>

---

# Editing Nix

<div class="grid grid-cols-2 gap-10 items-center mt-2">
<div>

Make Nix feel like a real language in your editor:

- **LSP** — `nixd` or `nil` for completion, goto-def, option hints
- **Formatter** — `nixfmt` (the official standard); `alejandra` a popular alternative
- **Linters** — `statix` (anti-patterns) + `deadnix` (dead code), usually wired via `treefmt-nix`

</div>
<div>
<Placeholder label="editor with Nix LSP + format-on-save" />
</div>
</div>

<div class="opacity-60 text-sm pt-4"><a href="https://github.com/nix-community/nixd">nixd</a> · <a href="https://github.com/oxalica/nil">nil</a> · <a href="https://github.com/NixOS/nixfmt">nixfmt</a> · <a href="https://github.com/oppiliappan/statix">statix</a> · <a href="https://github.com/astro/deadnix">deadnix</a></div>

---

# Erase your darlings <Ico name="fire" class="text-2xl" />

<div class="grid grid-cols-2 gap-10 items-center mt-2">
<div>

**impermanence** — wipe `/` on every boot, keep only what you _declared_.

- Root lives on tmpfs (or a rolled-back snapshot); reboot = clean slate
- Persist only the dirs/files you explicitly list
- Hidden state can't accumulate — if it's not declared, it's gone

</div>
<div>
<Placeholder label="reboot → root wiped → only declared state survives" />
</div>
</div>

<div class="opacity-60 text-sm pt-4"><a href="https://github.com/nix-community/impermanence">github.com/nix-community/impermanence</a> · <a href="https://grahamc.com/blog/erase-your-darlings/">grahamc.com — Erase your darlings</a></div>

---

# NixCon

<div class="grid grid-cols-2 gap-10 items-center mt-2">
<div>

The community **conference** for Nix &amp; NixOS — talks, workshops, and the people behind the project.

- Where the roadmap and big ideas get hashed out
- Talks recorded and posted online if you can't attend
- The best way to meet the community in person

</div>
<div>
<Placeholder label="NixCon — community conference" />
</div>
</div>

<div class="opacity-60 text-sm pt-4"><a href="https://nixcon.org">nixcon.org</a></div>

---
layout: center
class: text-center
---

# Where to go next

[nix.dev](https://nix.dev) · [Zero to Nix](https://zero-to-nix.com) · [nixos.org](https://nixos.org)

Thanks!
