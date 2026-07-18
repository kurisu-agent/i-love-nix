---
theme: default
title: i <3 nix
info: A short intro to the Nix package manager and language.
favicon: ./nix-logo.png
class: text-center
transition: fade
clickAnimation: up
mdc: true
lineNumbers: false
fonts:
  sans: Noto Sans
  mono: JetBrains Mono
---

<div class="absolute inset-0 overflow-hidden" style="background: #5277C3;">
  <NixSnow class="text-white" />
  <div class="absolute inset-0 flex flex-col items-center justify-center">
    <div class="text-8xl font-black text-white leading-none">i &lt;3 nix</div>
    <div class="font-mono text-lg tracking-[0.5em] pt-8 text-white opacity-90">AND YOU SHOULD TOO</div>
    <a href="https://github.com/kurisu-agent/i-love-nix" target="_blank" class="font-mono text-sm pt-10 text-white opacity-60 hover:opacity-100">github.com/kurisu-agent/i-love-nix</a>
  </div>
</div>

<!--
- open: "i love nix — and you should too"
- let the snow land before speaking
-->

---
layout: center
class: text-center
---

<div class="absolute inset-0 flex items-center justify-center" style="background: #EDF2FA;">
  <div class="aspect-[96/150] h-[62%]" style="background: url(/wakaba-mark.svg) center / contain no-repeat;"></div>
</div>

---
layout: center
---

<div class="absolute inset-0 grid grid-cols-2 grid-rows-2 gap-0.5" style="background: #27385D;">
  <v-clicks>
  <div class="flex flex-col items-center justify-center gap-5 bg-white p-8">
    <Ico name="question" class="text-6xl" style="color: #5277C3;" />
    <div class="text-lg text-center" style="color: #0D1B2E;">never heard of it: "nix… what?"</div>
  </div>
  <div class="flex flex-col items-center justify-center gap-5 bg-white p-8">
    <Ico name="megaphone" class="text-6xl" style="color: #5277C3;" />
    <div class="text-lg text-center" style="color: #0D1B2E;">heard the hype, never touched it</div>
  </div>
  <div class="flex flex-col items-center justify-center gap-5 bg-white p-8">
    <Ico name="test-tube" class="text-6xl" style="color: #5277C3;" />
    <div class="text-lg text-center" style="color: #0D1B2E;">dabbled: ran <code>nix</code>, maybe broke a system once</div>
  </div>
  <div class="flex flex-col items-center justify-center gap-5 bg-white p-8">
    <Ico name="laptop" class="text-6xl" style="color: #5277C3;" />
    <div class="text-lg text-center" style="color: #0D1B2E;">daily driver: it's running on my laptop right now</div>
  </div>
  </v-clicks>
  <div class="absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 h-10 flex items-center gap-3 px-4" style="background: #27385D;">
    <Ico name="hand-waving" class="text-base text-white" />
    <span class="font-mono text-xs tracking-widest text-white">show of hands</span>
  </div>
</div>

<!--
- show of hands across the four quadrants — calibrates how deep to go
- launch the live poll if using one
-->


---
layout: center
---

<div class="absolute inset-0 flex items-center justify-center" style="background: #EDF2FA;">
  <div class="w-[560px] flex flex-col gap-2">
    <div class="h-10 flex items-center gap-3 px-4" style="background: #5277C3;">
      <simple-icons-nixos class="text-base text-white" />
      <span class="font-mono text-xs tracking-widest text-white">agenda</span>
    </div>
    <div class="h-11 flex items-center gap-4 px-5 bg-white"><Ico name="rabbit" class="text-lg" style="color: #5277C3;" /><span class="font-mono text-xs tracking-widest" style="color: #0D1B2E;">down the rabbit hole</span></div>
    <div class="h-11 flex items-center gap-4 px-5 bg-white"><Ico name="bug" class="text-lg" style="color: #5277C3;" /><span class="font-mono text-xs tracking-widest" style="color: #0D1B2E;">meet nix</span></div>
    <div class="h-11 flex items-center gap-4 px-5 bg-white"><Ico name="heart" class="text-lg" style="color: #5277C3;" /><span class="font-mono text-xs tracking-widest" style="color: #0D1B2E;">why people love it</span></div>
    <div class="h-11 flex items-center gap-4 px-5 bg-white"><Ico name="flask" class="text-lg" style="color: #5277C3;" /><span class="font-mono text-xs tracking-widest" style="color: #0D1B2E;">drink me (demo)</span></div>
    <div class="h-11 flex items-center gap-4 px-5 bg-white"><Ico name="gear" class="text-lg" style="color: #5277C3;" /><span class="font-mono text-xs tracking-widest" style="color: #0D1B2E;">under the hood</span></div>
    <div class="h-11 flex items-center gap-4 px-5 bg-white"><Ico name="globe-hemisphere-west" class="text-lg" style="color: #5277C3;" /><span class="font-mono text-xs tracking-widest" style="color: #0D1B2E;">the ecosystem</span></div>
  </div>
</div>

---
src: ./pages/01-rabbit-hole.md
---

---
src: ./pages/02-meet-nix.md
---

---
src: ./pages/03-why-love-it.md
---

---
src: ./pages/04-drink-me.md
---

---
src: ./pages/05-under-the-hood.md
---

---
src: ./pages/06-ecosystem.md
---

---
layout: center
class: text-center
---

<div class="absolute inset-0" style="background: url(/alice-fin.png) center / cover no-repeat;">
  <div class="absolute bottom-0 left-0 flex items-stretch">
    <div class="w-20 flex items-center justify-center" style="background: #5277C3;"><simple-icons-nixos class="text-4xl text-white" /></div>
    <div class="px-10 py-6 text-left" style="background: #0D1B2E;">
      <div class="text-5xl font-black text-white leading-none">fin.</div>
    </div>
  </div>
</div>

<!--
- thank the room
- open the floor for questions
-->


<!--
Bonus material lives on in pages/ but is not part of the deck:
pages/07-nixmaxxing.md. Re-add a `src:` import here to bring it back.
-->
