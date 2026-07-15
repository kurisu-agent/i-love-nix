---
layout: center
class: text-center
---

<SectionBookend image="/alice-rabbit-hole.png" title="Down the rabbit hole" subtitle="how I fell in" position="top-right" />

---
layout: center
class: text-center
---

# Prelude

<div class="flex items-center justify-center gap-6 pt-12">
  <div class="flex flex-col items-center gap-2 w-24">
    <logos-microsoft-windows-icon class="text-6xl" />
    <div class="text-sm opacity-70">Windows</div>
    <div class="text-xs opacity-40">age 8</div>
  </div>
  <div class="text-2xl opacity-30">→</div>
  <div class="flex flex-col items-center gap-2 w-24">
    <logos-apple class="text-6xl dark:invert" />
    <div class="text-sm opacity-70">macOS</div>
    <div class="text-xs opacity-40">~2010</div>
  </div>
  <div class="text-2xl opacity-30">→</div>
  <div class="flex flex-col items-center gap-2 w-24">
    <logos-ubuntu class="text-6xl" />
    <div class="text-sm opacity-70">Ubuntu</div>
    <div class="text-xs opacity-40">2019</div>
  </div>
  <div class="text-2xl opacity-30">→</div>
  <div class="flex flex-col items-center gap-2 w-24">
    <simple-icons-popos class="text-6xl" style="color: #48B9C7" />
    <div class="text-sm opacity-70">Pop!_OS</div>
    <div class="text-xs opacity-40">2020</div>
  </div>
  <div class="text-2xl opacity-30">→</div>
  <div class="flex flex-col items-center gap-2 w-24">
    <simple-icons-nixos class="text-6xl" style="color: #5277C3" />
    <div class="text-sm opacity-70">NixOS</div>
    <div class="text-xs opacity-40">2026 <Ico name="heart" /></div>
  </div>
</div>

---

# First steps

The thing that first made me _want_ Nix — a tiny, stupid annoyance:

- **Pop!\_OS COSMIC** has no way to turn off desktop animations — [`cosmic-comp` #376](https://github.com/pop-os/cosmic-comp/issues/376) is still an open request. The durations are **baked into the compositor source**.
- **My world:** patch the source, rebuild `cosmic-comp`… then do it **again after every update**. Forever.
- **A friend on NixOS:** a ~10-line **overlay** carrying the same patch — declared once, re-applied automatically on every rebuild. It just _stays_ fixed.

<div class="opacity-60 text-sm pt-4">Same patch. One of us re-did it weekly; the other wrote it down once. → the <b>Overlays vs patches</b> story, later.</div>

---

# …so you write it down once

```nix
# configuration.nix — an overlay that re-patches cosmic-comp on every build
nixpkgs.overlays = [
  (final: prev: {
    cosmic-comp = prev.cosmic-comp.overrideAttrs (old: {
      postPatch = ''
        ${old.postPatch or ""}

        # set every animation duration to 1ms
        find src/shell -type f -name "*.rs" -exec sed -i \
          's/Duration::from_millis([0-9]\+)/Duration::from_millis(1)/g' {} \;
      '';
    });
  })
];
```

<div class="opacity-60 text-sm pt-2">Declared once · re-applied on every rebuild &amp; update · <a href="https://github.com/pop-os/cosmic-comp/issues/376#issuecomment-3851990669">cosmic-comp #376</a></div>
