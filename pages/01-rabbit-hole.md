---
layout: center
class: text-center
---

<div class="absolute inset-0" style="background: url(/alice-rabbit-hole.png) center / cover no-repeat;">
  <div class="absolute top-0 right-0 flex items-stretch">
    <div class="px-10 py-6 text-left" style="background: #0D1B2E;">
      <div class="text-5xl font-black text-white leading-none">down the rabbit hole</div>
    </div>
    <div class="w-20 flex items-center justify-center" style="background: #5277C3;"><simple-icons-nixos class="text-4xl text-white" /></div>
  </div>
</div>

<!--
- Section divider: down the rabbit hole
-->

---
layout: center
---

<div class="absolute inset-0 flex items-start justify-center gap-3 pt-38" style="background: #EDF2FA;">
  <div class="w-36">
    <div class="h-36 flex items-center justify-center bg-white">
      <logos-microsoft-windows-icon class="text-6xl" />
    </div>
    <div class="h-9 flex items-center justify-center font-mono text-xs tracking-widest text-white" style="background: #27385D;">windows</div>
    <div class="h-8 flex items-center justify-center font-mono text-xs" style="color: #27385D;">age 8</div>
  </div>
  <div class="flex items-center mt-[4.25rem]">
    <div class="h-0.5 w-6" style="background: #27385D;"></div>
    <div class="w-0 h-0" style="border-top: 5px solid transparent; border-bottom: 5px solid transparent; border-left: 8px solid #27385D;"></div>
  </div>
  <div class="w-36">
    <div class="h-36 flex items-center justify-center bg-white">
      <logos-apple class="text-6xl" />
    </div>
    <div class="h-9 flex items-center justify-center font-mono text-xs tracking-widest text-white" style="background: #27385D;">macos</div>
    <div class="h-8 flex items-center justify-center font-mono text-xs" style="color: #27385D;">~2010</div>
  </div>
  <div class="flex items-center mt-[4.25rem]">
    <div class="h-0.5 w-6" style="background: #27385D;"></div>
    <div class="w-0 h-0" style="border-top: 5px solid transparent; border-bottom: 5px solid transparent; border-left: 8px solid #27385D;"></div>
  </div>
  <div class="w-36">
    <div class="h-36 flex items-center justify-center bg-white">
      <logos-ubuntu class="text-6xl" />
    </div>
    <div class="h-9 flex items-center justify-center font-mono text-xs tracking-widest text-white" style="background: #27385D;">ubuntu</div>
    <div class="h-8 flex items-center justify-center font-mono text-xs" style="color: #27385D;">2019</div>
  </div>
  <div class="flex items-center mt-[4.25rem]">
    <div class="h-0.5 w-6" style="background: #27385D;"></div>
    <div class="w-0 h-0" style="border-top: 5px solid transparent; border-bottom: 5px solid transparent; border-left: 8px solid #27385D;"></div>
  </div>
  <div class="w-36">
    <div class="h-36 flex items-center justify-center bg-white">
      <simple-icons-popos class="text-6xl" style="color: #48B9C7;" />
    </div>
    <div class="h-9 flex items-center justify-center font-mono text-xs tracking-widest text-white" style="background: #27385D;">pop!_os</div>
    <div class="h-8 flex items-center justify-center font-mono text-xs" style="color: #27385D;">2020</div>
  </div>
  <div class="flex items-center mt-[4.25rem]">
    <div class="h-0.5 w-6" style="background: #27385D;"></div>
    <div class="w-0 h-0" style="border-top: 5px solid transparent; border-bottom: 5px solid transparent; border-left: 8px solid #5277C3;"></div>
  </div>
  <div class="w-36">
    <div class="h-36 flex items-center justify-center bg-white">
      <simple-icons-nixos class="text-6xl" style="color: #5277C3;" />
    </div>
    <div class="h-9 flex items-center justify-center font-mono text-xs tracking-widest text-white" style="background: #5277C3;">nixos</div>
    <div class="h-8 flex items-center justify-center gap-1 font-mono text-xs" style="color: #5277C3;">2026 <Ico name="heart" /></div>
  </div>
</div>

<!--
- My distro journey: Windows → macOS → Ubuntu → Pop!_OS → NixOS
- NixOS 2026 is the one I love
-->

---
layout: center
---

<div class="absolute inset-0" style="background: #000 url(/cosmic-tiling.jpg) center / contain no-repeat;"></div>

<!--
- The annoyance that sold me: Pop!_OS COSMIC, no toggle for animations
- My world: patch source, rebuild, repeat every update — forever
- Friend on NixOS: ~10-line overlay, declared once, re-applied each rebuild
-->

---
layout: center
---

<div class="absolute inset-0" style="background: #0D1117;">
  <div class="absolute inset-[10%]" style="background: url(/cosmic-comp-issue.png) center / contain no-repeat;"></div>
</div>

<!--
- cosmic-comp #376: open since Mar 2024, 197 👍
- The ask: a setting for animation durations — still baked into source
- The itch the next slide's overlay scratches
-->

---
layout: center
---

<div class="absolute inset-0 flex items-center justify-center" style="background: #EDF2FA;">
  <div class="w-[720px]">
    <div class="h-10 flex items-center gap-3 px-4" style="background: #5277C3;">
      <simple-icons-nixos class="text-base text-white" />
      <span class="font-mono text-xs tracking-widest text-white">configuration.nix</span>
    </div>
    <div class="text-left">

```nix
nixpkgs.overlays = [
  (final: prev: {
    cosmic-comp = prev.cosmic-comp.overrideAttrs (old: {
      postPatch = ''
        # set every animation duration to 1ms
        for f in src/shell/**/*.rs:
          replace Duration::from_millis([0-9]+)
             with Duration::from_millis(1)
      '';
    });
  })
];
```

</div>
<div class="h-9 flex items-center justify-between px-4 font-mono text-xs tracking-widest" style="background: #e2e8f0; color: #475569;"><span>declared once · re-applied on every rebuild</span><a href="https://github.com/pop-os/cosmic-comp/issues/376" target="_blank" style="color: #475569;">cosmic-comp #376</a></div>
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
- One overlay in configuration.nix re-patches cosmic-comp every build
- Declared once, never touched again
- Source: cosmic-comp #376
-->

---
layout: center
---

<div class="absolute inset-0 grid grid-cols-2">
  <div style="background: url(/versions-chaos.png) center / cover no-repeat;"></div>
  <div style="background: url(/versions-git.png) center / cover no-repeat;"></div>
</div>
<div class="absolute top-0 left-1/2 -translate-x-1/2 px-10 py-5" style="background: #0D1B2E;">
  <div class="text-4xl font-black text-white leading-none whitespace-nowrap">never going back</div>
</div>
<div class="absolute bottom-8 left-0 w-1/2 flex justify-center">
  <div class="w-[400px] text-left">
    <div class="h-9 flex items-center gap-3 px-4" style="background: #27385D;">
      <Ico name="folder-open" class="text-base text-white" />
      <span class="font-mono text-xs tracking-widest text-white">ls ~/thesis</span>
    </div>

```text
thesis_final.docx
thesis_final_v2.docx
thesis_final_v3.docx
thesis_final_v3_FINAL.docx
thesis_final_v3_FINAL_forreal.docx
```

</div>
</div>
<div class="absolute bottom-8 right-0 w-1/2 flex justify-center">
  <div class="w-[400px] text-left">
    <div class="h-9 flex items-center gap-3 px-4" style="background: #5277C3;">
      <Ico name="git-commit" class="text-base text-white" />
      <span class="font-mono text-xs tracking-widest text-white">git log --oneline</span>
    </div>

```text
8f2e41a defend thesis
c7a91b3 rewrite chapter three
0b5e6d1 revert "shorten intro"
4d0f2e9 first draft
```

</div>
</div>

<style>
.slidev-code {
  border-radius: 0 !important;
  margin: 0 !important;
  background: white !important;
  padding: 1rem 1.25rem !important;
}
.slidev-code .line::before {
  color: #cbd5e1 !important;
}
</style>

<!--
- Section closer: how Nix *feels* — the folders→git leap, again
- Remember switching from `_FINAL_v3_forreal` folders to git? Once you feel real version control you can never unfeel it
- Nix is that same leap for the whole system — a strictly better paradigm, not a trade-off
- Honest part: there IS an upfront investment (a language, new concepts) — but the payoff is enormous
- It's not just nicer: managed complexity makes things *possible* that simply weren't before — fearless rollbacks, identical machines, whole-OS experiments
- I am never, ever going back
-->
