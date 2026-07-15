---
layout: center
class: text-center
---

<SectionBookend image="/alice-tea-party.png" title="Why people love it" subtitle="rollbacks, reproducibility — and it all composes" />

---
layout: center
class: text-center
---

# In their own words

<div class="w-[900px] h-[320px] mx-auto mt-6" style="background: url(/nixos-org-pitch.png) center / contain no-repeat;"></div>

<div class="opacity-60 text-sm pt-4"><a href="https://nixos.org">nixos.org</a>, above the fold</div>

<!--
The official pitch, verbatim from the nixos.org homepage: Reproducible, Declarative, Reliable. Nice framing device — the next ten steps are basically these three words unpacked, plus the ones the homepage undersells (composability, sharing, substitution).
-->

---

<Stepper :current="1" />

<div class="grid grid-cols-2 gap-10 items-center mt-2">
<div>

Your whole machine in one config. No snowflake servers, no config drift — the system **is** the code.

</div>
<div>
<Placeholder label="configuration.nix → the whole desktop" />
</div>
</div>

---

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

<Stepper :current="3" />

> Pieces you stack, merge &amp; override without forking

<div class="grid grid-cols-2 gap-10 items-center mt-2">
<div>

- **Modules merge** — a hundred `.nix` files fold into one system; options combine, there's no single "main"
- **Overlays &amp; `overrideAttrs`** — bend any package deep in the tree without forking it
- **Flake inputs** — pull in someone's whole system as a dependency; `follows` dedupes the shared bits
- **The boundaries dissolve** (remember?) — app, module, deployment, OS are one value model, so they all compose the **same way**

<div class="opacity-70 text-sm pt-2">Imperative tools stack <em>steps</em>; Nix composes <em>values</em> — the piece you didn't write still merges cleanly.</div>

</div>
<div>
<Placeholder label="many small .nix modules → merge into one system" />
</div>
</div>

<!--
Callback: this is the "boundaries dissolve" idea from Meet Nix, now concrete — modules, overlays, and flake inputs are the *mechanisms* that make one-value-model composition real.
-->


---

<Stepper :current="4" />

> Because it all composes, a config isn't a snowflake — it's a **dependency you can import**

<div class="grid grid-cols-2 gap-10 items-center mt-2">
<div>

- Your whole machine is **one repo** — push it, and someone else can `nix build` it verbatim
- Publish reusable **modules** as flake outputs; others `import` them like a library
- The `flake.lock` travels too → they get **byte-identical** inputs, never "works on my machine"

<div class="opacity-70 text-sm pt-2"><Ico name="eyes" /> In fact — <b>someone in this very room</b> already ships one…</div>

</div>
<div>
<Placeholder label="git push → someone else builds your exact machine" />
</div>
</div>

---

<Stepper :current="4" />

> Exhibit A — from someone in this very room

<div class="grid grid-cols-2 gap-10 items-center mt-2">
<div>

<div class="text-xl pt-2 pb-4"><Ico name="link" /> <a href="https://github.com/austinried/nix-common"><b>github.com/austinried/nix-common</b></a></div>

```nix
# flake.nix — if I wanted to use it
inputs.common.url = "github:austinried/nix-common";

# home.nix
imports = [ inputs.common.homeModules.default ];

common.japanese.enable = true;
# → ibus + mozc — hiragana あ on Ctrl+Space
```

</div>
<div>

```nix
# inside the japanese.nix module
config = lib.mkIf cfg.enable {
  dconf.settings = {
    "org/gnome/desktop/input-sources".sources =
      [ (mkTuple [ "ibus" "mozc-jp" ]) ];
  };

  xdg.configFile."mozc/ibus_config.textproto".text =
    ''
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
</div>

<!--
The concrete payoff of the previous slide, from this very room: a flake-parts module library publishing nixosModules, homeModules, and flakeModules that anyone can pin and import.

The line to land: **you wouldn't be sharing your config like this on any other system**. Nobody publishes their apt history or their hand-edited /etc as a library — there's nothing coherent to publish. Here, a personal setup is a typed, importable artifact; sharing it is as natural as pushing a package to npm.

The snippet is real: `common.japanese.enable` flips on a whole Japanese input method — ibus + mozc engine, GNOME input sources via dconf, a mozc ibus_config that defaults to hiragana, and a Ctrl+Space kana-mode toggle keymap. One line on the outside, all that plumbing on the inside — which is exactly what the next slide names: interfaces.

Other nice touches worth mentioning: dual-channel setup (stable nixos-26.05 + unstable side-by-side via `follows`), dotfiles via yadm, and custom Dart tools (`dconf-mirror`, `run-nixos-vm`) packaged right in the flake.
-->

---

<Stepper :current="5" />

> One line on the outside, all the plumbing on the inside

<div class="grid grid-cols-2 gap-10 items-center mt-2">
<div>

```nix
# what you write
services.hello = {
  enable   = true;
  port     = 8080;
  greeting = "Hello, wonderland!";
};
```

- **Options are the API**, the module is the implementation — typed, documented, discoverable
- Change `port` once → the nginx vhost **and** the firewall rule re-derive together

</div>
<div>

```nix
# the module
options.services.hello = {
  enable   = lib.mkEnableOption "hello page";
  port     = lib.mkOption { type = types.port; };
  greeting = lib.mkOption { default = "hi"; };
};

config = lib.mkIf cfg.enable {
  services.nginx = {
    enable = true;
    defaultHTTPListenPort = cfg.port;
    virtualHosts."hello".locations."/".return =
      ''200 "${cfg.greeting}"'';
  };
  networking.firewall.allowedTCPPorts =
    [ cfg.port ];
};
```

</div>
</div>

<!--
Same two-column shape as the exhibit on purpose: interface on the left, implementation on the right — but now it's ours, a toy `services.hello`.

The interface is three typed options: `enable`, `port` (`types.port` — an integer that must be a valid port; set it to "banana" or 99999 and evaluation fails with a readable error), and `greeting`, a string. The module turns them into an nginx vhost that returns the greeting, and — the part to dwell on — opens that same port in the firewall. One knob, every downstream artifact re-derived consistently: config file, unit, firewall rule can't drift apart, because they're all computed from `cfg.port`.

This is the same mechanism nixpkgs itself uses — `services.forgejo.enable = true` gives you user, database, systemd hardening, backups the exact same way. Options are indexed on search.nixos.org; your own modules are first-class citizens of the same system.
-->

---

<Stepper :current="6" />

> Reproducible outputs are **shareable** — so weak devices never have to build

<div class="grid grid-cols-2 gap-10 items-center mt-2">
<div>

- Already built somewhere? **Download, don't compile** — `cache.nixos.org`, or your own LAN cache (**harmonia**)
- **Remote builders**: evaluation stays local, the heavy lifting goes to the beefy box
- **Architecture-aware** — each derivation routes to a machine that can build its `system`; the desktop even cross-builds `aarch64` for the Pi
- A Raspberry Pi, a phone, a 2012 laptop → full system builds in **minutes**

</div>
<div>

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
nix.settings.substituters =
  [ "http://desktop:5000" ];
```

</div>
</div>

<!--
The hash-is-identity property pays off here: if any machine on earth already realised this store path, you can substitute it instead of building. cache.nixos.org does this globally; **harmonia** (nix-community) does it for your LAN — one flag and your desktop serves its /nix/store as a signed binary cache over HTTP.

Combine it with **remote builders** and the weak-device story gets absurd: the Pi or the ancient laptop only *evaluates* (cheap — it's just computing hashes), then ships every actual build to the desktop over SSH, and pulls finished paths from the desktop's harmonia cache. Second device asking for the same thing? Pure cache hit.

**Architecture-aware** is the underrated part: every derivation declares its `system`, and Nix routes it to a builder whose `systems` list matches. The Pi is aarch64 — the x86 desktop can still build for it via binfmt emulation (`boot.binfmt.emulatedSystems`), or a real aarch64 builder can join the pool. Nothing is configured per-package; the graph just routes.

Live example if asked: `nixos-rebuild switch --target-host pi --build-host desktop` — build a Pi's whole system without the Pi breaking a sweat.
-->

---

<Stepper :current="7" />

<div class="grid grid-cols-2 gap-10 items-center mt-2">
<div>

Every version coexists, isolated by **content hash**. Two apps needing two different `glibc`s? Both happy.

</div>
<div>
<Placeholder label="two apps, two isolated dependency trees" />
</div>
</div>

---

<Stepper :current="8" />

<div class="grid grid-cols-2 gap-10 items-center mt-2">
<div>

The largest **and** freshest package set anywhere — 100k+ packages, updated fast.

</div>
<div>
<Placeholder label="package-count / freshness chart" />
</div>
</div>

---

<Stepper :current="9" />

<div class="grid grid-cols-2 gap-10 items-center mt-2">
<div>

Every rebuild is a new **generation**. Booted something broken? Pick the previous one from the boot menu — nothing was mutated in place.

</div>
<div>
<Placeholder label="boot menu listing NixOS generations" />
</div>
</div>

---

<Stepper :current="10" />

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

# …and why people hate it <Ico name="smiley-angry" class="text-2xl" />

> Fair is fair — the honeymoon comes with a hangover

<div class="grid grid-cols-2 gap-10 items-center mt-2">
<div>

- **№1, by a mile: the language is esoteric** — purely functional, lazy, untyped; it reads like nothing else you daily-drive
- **Cryptic errors** — `infinite recursion encountered`, five layers deep in a module you didn't write
- **The learning curve is a cliff** — and the docs assume you already fell off it

</div>
<div>

```nix
# every line of this is real, valid Nix
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
</div>

<!--
Don't undersell this: the esoteric language is THE adoption blocker, and it's been the top complaint in every community survey since forever. Acknowledge it honestly — the audience will trust the pitch more.

The snippet is a tour of real footguns, line by line:
- Attribute names are arbitrary strings — spaces and all.
- `6/3` is a **path literal** (relative path `./6/3`); you need spaces around `/` for division. Yes, really.
- `//` is attrset merge (right side wins), nothing to do with division or comments.
- In `''…''` indented strings, `''${` *escapes* interpolation and `'''` is a literal `''` — three kinds of quote in one delimiter.
- `{ who ? "you", ... } @ all:` — a function pattern with a default, an ellipsis, and an alias binding, all before the body starts.
- `__functor` makes an attrset *callable* — `callMe 42` works. The module system uses tricks like this internally.

Punchline: none of this is a syntax error. Then flip to the next slide — this is exactly the kind of arcana LLMs are great at.
-->

---

# …but the answer already arrived <Ico name="robot" class="text-2xl" />

> An esoteric language is exactly the kind of problem LLMs erase

<div class="grid grid-cols-2 gap-10 items-center mt-2">
<div>

- LLMs are **fluent in Nix** — a million nixpkgs commits and every option doc are in the training set
- You'll see it in the demo in a moment: **describe the machine**, let the model write the `.nix`
- Declarative + atomic = **the safest playground for AI** — one file to review, `nixos-rebuild test` to try it, a generation to roll back if it lied
- Give an agent `nix run nixpkgs#anything` and it has **every tool on demand** — zero context wasted on "first, install the dependencies…"

<div class="pt-4 text-lg"><b>LLMs <Ico name="heart" /> Nix</b> — they go together like…</div>

</div>
<div>
<Placeholder label="LLM writes the config · Nix verifies it" />
</div>
</div>

<!--
The pincer: Nix gives LLMs what they need (one declarative file as full context, a hash-verified build as ground truth), and LLMs give Nix what it needs (a fluent translator from intent to esoteric syntax). Neither works this well with anything else — mutable systems give agents no safety net, and Nix without AI gatekeeps behind the language.

The `nix run` point deserves its own beat: agents burn enormous context on environment setup — apt-get incantations, version conflicts, "command not found" retry loops. With Nix, any of 100k packages is one command away, ephemeral, with no permanent mutation of the machine: `nix run nixpkgs#jq`, `nix shell nixpkgs#ffmpeg`, done. The agent spends its context on the actual task. (This very deck was built that way — the Playwright browsers for slide screenshots came from Nix.)

Land the sentence, pause on "like…", then advance. 🥜🍇
-->

---

<PbjTime />
