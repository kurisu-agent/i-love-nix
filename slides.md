---
theme: default
title: An Introduction to Nix
info: A short intro to the Nix package manager and language.
class: text-center
transition: slide-left
mdc: true
lineNumbers: true
---

# An Introduction to Nix

Reproducible builds, declarative environments, and a purely functional package manager

<div class="pt-12 opacity-70 text-sm">
  Press <kbd>space</kbd> to advance
</div>

---

# What is Nix?

Nix is three things wearing the same name:

- **A package manager** — installs packages into isolated, hash-addressed paths under `/nix/store`
- **A language** — a small, lazy, purely functional language for describing builds
- **An OS** — NixOS, a Linux distribution configured entirely from Nix expressions

The core idea: **builds are pure functions of their inputs**. Same inputs in, same output out — bit for bit.

---

# Why people reach for it

- **Reproducibility** — a build that works today works the same on another machine, next year
- **No "works on my machine"** — dependencies are pinned by content hash, not by whatever `apt` happened to install
- **Atomic upgrades & rollbacks** — switch generations forward or back instantly; nothing is mutated in place
- **Per-project dev shells** — drop into an environment with exactly the tools a repo needs, and nothing leaks out

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

- Everything is an **expression** — there are no statements
- **Attribute sets** (`{ ... }`) and **lists** (`[ ... ]`) are the building blocks
- Functions are `arg: body`, applied by juxtaposition: `greeting "Nix"`
- Evaluation is **lazy** — nothing computes until something needs it

---

# A reproducible dev shell

Drop a `flake.nix` in a repo and `nix develop` gives everyone the same toolchain:

```nix
{
  description = "dev shell";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }:
    let pkgs = import nixpkgs { system = "x86_64-linux"; };
    in {
      devShells.x86_64-linux.default = pkgs.mkShell {
        packages = [ pkgs.nodejs_24 pkgs.git ];
      };
    };
}
```

`nix develop` → you're in a shell with Node 24 and Git, pinned by the flake lock.

---

layout: center
class: text-center
---

# Where to go next

[nix.dev](https://nix.dev) · [Zero to Nix](https://zero-to-nix.com) · [nixos.org](https://nixos.org)

Thanks!
