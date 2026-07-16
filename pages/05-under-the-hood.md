---
layout: center
class: text-center
---

<div class="absolute inset-0" style="background: url(/alice-under-the-hood.png) center / cover no-repeat;">
  <div class="absolute top-0 right-0 flex items-stretch">
    <div class="px-10 py-6 text-left" style="background: #0D1B2E;">
      <div class="text-5xl font-black text-white leading-none">under the hood</div>
    </div>
    <div class="w-20 flex items-center justify-center" style="background: #5277C3;"><simple-icons-nixos class="text-4xl text-white" /></div>
  </div>
</div>

<!--
Section divider for Under the hood: the image owns the whole frame, title in a slim flat overlay — ink title bar butted against a nix-blue snowflake square, flush to the top-right corner.
-->

---
layout: center
---

<div class="absolute inset-0 grid grid-cols-2 gap-10 items-center px-16" style="background: #EDF2FA;">

<div class="flex flex-col gap-5">

<div class="text-left">
<div class="h-9 flex items-center gap-3 px-4" style="background: #27385D;"><Ico name="package" class="text-base text-white" /><span class="font-mono text-xs tracking-widest text-white">package.json</span></div>

```json
{
  "dependencies": { "left-pad": "^1.3.0" }
}
```

</div>

<div class="text-left">
<div class="h-9 flex items-center gap-3 px-4" style="background: #27385D;"><Ico name="package" class="text-base text-white" /><span class="font-mono text-xs tracking-widest text-white">package-lock.json</span></div>

```json
{
  "node_modules/left-pad": {
    "version": "1.3.0",
    "integrity": "sha512-mqcy0Xh4…"
  }
}
```

</div>

</div>

<div class="flex flex-col gap-5">

<div class="text-left">
<div class="h-9 flex items-center gap-3 px-4" style="background: #5277C3;"><simple-icons-nixos class="text-base text-white" /><span class="font-mono text-xs tracking-widest text-white">flake.nix</span></div>

```nix
{
  inputs.left-pad.url = "github:acme/left-pad";
  outputs = { left-pad, ... }: { /* … */ };
}
```

</div>

<div class="text-left">
<div class="h-9 flex items-center gap-3 px-4" style="background: #5277C3;"><simple-icons-nixos class="text-base text-white" /><span class="font-mono text-xs tracking-widest text-white">flake.lock</span></div>

```json
{
  "left-pad": {
    "rev": "60e2e3fa…",
    "narHash": "sha256-i8yYPMdb…"
  }
}
```

</div>

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
package.json : package-lock.json :: flake.nix : flake.lock — "what you want" vs "what you got, exactly"; free intuition if the room knows npm. The deep bars are the Node side; the nix-blue bars with the snowflake always mark the Nix side.
Where it ends: npm's `integrity` / flake.lock's `narHash` both hash a *download* — but npm stops there, while Nix also hash-names every *build result*. That extra move is the next few slides.
-->

---
layout: center
---

<div class="absolute inset-0 flex flex-col" style="background: #EDF2FA;">
  <div class="flex h-10 gap-2 mx-8 mt-8">
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs tracking-widest" style="color: #27385D;"><Ico name="compass" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs tracking-widest" style="color: #27385D;"><Ico name="scroll" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs tracking-widest" style="color: #27385D;"><Ico name="shuffle" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs tracking-widest" style="color: #27385D;"><Ico name="globe-hemisphere-west" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs tracking-widest" style="color: #27385D;"><Ico name="hammer" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs tracking-widest" style="color: #27385D;"><Ico name="package" class="text-sm" /></div>
  </div>
  <div class="flex-1 flex items-center justify-center">
    <div class="relative w-[860px] h-[200px] text-sm">
      <svg class="absolute inset-0 w-full h-full" viewBox="0 0 860 200" fill="none">
        <defs>
          <marker id="uth-arrow" viewBox="0 0 10 10" refX="9" refY="5" markerWidth="8" markerHeight="10" markerUnits="userSpaceOnUse" orient="auto">
            <path d="M 0 0 L 10 5 L 0 10 z" fill="#27385D" />
          </marker>
        </defs>
        <path d="M 820 32 H 846 V 100 H 14 V 168 H 34" stroke="#27385D" stroke-width="2" stroke-linejoin="miter" marker-end="url(#uth-arrow)" />
      </svg>
      <span class="absolute left-1/2 top-[100px] -translate-x-1/2 -translate-y-1/2 z-1 font-mono text-[10px] tracking-widest px-2 py-1 text-white whitespace-nowrap" style="background: #27385D;">realize</span>
      <div class="absolute left-[40px] right-[40px] top-0 h-[64px] flex items-center gap-0">
        <div class="w-[176px] h-full bg-white flex flex-col justify-center text-center leading-tight font-mono text-xs" style="color: #0D1B2E;"><span>$ nix run</span><span>nixpkgs#fastfetch</span></div>
        <div class="flex-1 relative flex items-center"><span class="absolute left-1/2 top-1/2 -translate-x-1/2 -translate-y-1/2 z-1 font-mono text-[10px] tracking-widest px-2 py-1 text-white whitespace-nowrap" style="background: #27385D;">resolve</span><div class="h-0.5 flex-1" style="background: #27385D;"></div><div class="w-0 h-0" style="border-top: 5px solid transparent; border-bottom: 5px solid transparent; border-left: 8px solid #27385D;"></div></div>
        <div class="w-[176px] h-full bg-white flex items-center justify-center gap-2 text-center text-sm" style="color: #0D1B2E;"><Ico name="scroll" /> <span class="font-mono text-xs">expression.nix</span></div>
        <div class="flex-1 relative flex items-center"><span class="absolute left-1/2 top-1/2 -translate-x-1/2 -translate-y-1/2 z-1 font-mono text-[10px] tracking-widest px-2 py-1 text-white whitespace-nowrap" style="background: #27385D;">evaluate</span><div class="h-0.5 flex-1" style="background: #27385D;"></div><div class="w-0 h-0" style="border-top: 5px solid transparent; border-bottom: 5px solid transparent; border-left: 8px solid #27385D;"></div></div>
        <div class="w-[176px] h-full bg-white flex items-center justify-center gap-2 text-center text-sm" style="color: #0D1B2E;"><Ico name="receipt" /> <span class="font-mono text-xs">derivation.drv</span></div>
      </div>
      <div class="absolute left-[40px] right-[40px] top-[136px] h-[64px] flex items-center gap-0">
        <div class="w-[176px] h-full bg-white flex items-center justify-center gap-2 text-center text-sm" style="color: #0D1B2E;"><Ico name="hammer" /> sandbox build</div>
        <div class="flex-1 relative flex items-center"><span class="absolute left-1/2 top-1/2 -translate-x-1/2 -translate-y-1/2 z-1 font-mono text-[10px] tracking-widest px-2 py-1 text-white whitespace-nowrap" style="background: #27385D;">store</span><div class="h-0.5 flex-1" style="background: #27385D;"></div><div class="w-0 h-0" style="border-top: 5px solid transparent; border-bottom: 5px solid transparent; border-left: 8px solid #27385D;"></div></div>
        <div class="w-[176px] h-full bg-white flex flex-col justify-center text-center leading-tight text-sm" style="color: #0D1B2E;"><span><Ico name="package" /> store path</span><span><Ico name="graph" /> dep graph</span></div>
        <div class="flex-1 relative flex items-center"><span class="absolute left-1/2 top-1/2 -translate-x-1/2 -translate-y-1/2 z-1 font-mono text-[10px] tracking-widest px-2 py-1 text-white whitespace-nowrap" style="background: #27385D;">cache</span><div class="h-0.5 flex-1" style="background: #27385D;"></div><div class="w-0 h-0" style="border-top: 5px solid transparent; border-bottom: 5px solid transparent; border-left: 8px solid #27385D;"></div></div>
        <div class="w-[176px] h-full flex flex-col justify-center items-center text-center leading-tight text-sm text-white" style="background: #5277C3;"><simple-icons-nixos class="text-xl pb-1" /><span>everywhere, by hash</span></div>
      </div>
    </div>
  </div>
</div>

<!--
Overview map for the section — each of the six stops gets its own slide next; keep pointing back here. The step bar up top names the six stages; the destination block — everywhere, by hash — is the nix-blue snowflake.
Trip: resolve → evaluate (recipe) → realize → sandbox build → immutable store graph → global cache by hash.
Punchline: nothing is "installed" — Nix just execs the binary straight out of `/nix/store`.
-->

---
layout: center
---

<div class="absolute inset-0 flex flex-col" style="background: #EDF2FA;">
  <div class="flex h-10 gap-2 mx-8 mt-8">
    <div class="flex-none flex items-center justify-center gap-2 px-6 text-white" style="background: #5277C3;"><Ico name="compass" class="text-sm" /><span class="font-mono text-xs tracking-widest">resolve</span></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs tracking-widest" style="color: #27385D;"><Ico name="scroll" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs tracking-widest" style="color: #27385D;"><Ico name="shuffle" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs tracking-widest" style="color: #27385D;"><Ico name="globe-hemisphere-west" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs tracking-widest" style="color: #27385D;"><Ico name="hammer" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs tracking-widest" style="color: #27385D;"><Ico name="package" class="text-sm" /></div>
  </div>
  <div class="flex-1 flex flex-col items-center justify-center gap-10">
    <div class="flex items-center gap-0 w-[820px] h-[76px] text-sm">
      <div class="w-[200px] h-full bg-white flex flex-col items-center justify-center text-center leading-tight font-mono text-xs" style="color: #0D1B2E;"><span>nix run</span><span>nixpkgs#fastfetch</span></div>
      <div class="flex-1 relative flex items-center"><span class="absolute left-1/2 top-1/2 -translate-x-1/2 -translate-y-1/2 z-1 font-mono text-[10px] tracking-widest px-2 py-1 text-white whitespace-nowrap" style="background: #27385D;">registry</span><div class="h-0.5 flex-1" style="background: #27385D;"></div><div class="w-0 h-0" style="border-top: 5px solid transparent; border-bottom: 5px solid transparent; border-left: 8px solid #27385D;"></div></div>
      <div class="w-[200px] h-full bg-white flex flex-col items-center justify-center text-center leading-tight font-mono text-xs" style="color: #0D1B2E;"><span>github:NixOS/nixpkgs</span><span>pinned @ 60e2e3fa…</span></div>
      <div class="flex-1 relative flex items-center"><span class="absolute left-1/2 top-1/2 -translate-x-1/2 -translate-y-1/2 z-1 font-mono text-[10px] tracking-widest px-2 py-1 text-white whitespace-nowrap" style="background: #27385D;">select</span><div class="h-0.5 flex-1" style="background: #27385D;"></div><div class="w-0 h-0" style="border-top: 5px solid transparent; border-bottom: 5px solid transparent; border-left: 8px solid #27385D;"></div></div>
      <div class="w-[200px] h-full bg-white flex flex-col items-center justify-center text-center leading-tight font-mono text-xs" style="color: #0D1B2E;"><span>packages.x86_64-linux</span><span>.fastfetch</span></div>
    </div>
    <div class="w-[720px] text-left">
      <div class="h-9 flex items-center gap-3 px-4" style="background: #5277C3;"><simple-icons-nixos class="text-base text-white" /><span class="font-mono text-xs tracking-widest text-white">pkgs/by-name/fa/fastfetch/package.nix</span></div>

```nix
mkDerivation {
  pname = "fastfetch";
  src = fetchFromGitHub { … };
}
```

</div>
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
**Resolve** — a ref is just a pointer: registry name → pinned repo → one `.nix` file. `nixpkgs` resolves via the flake registry to `github:NixOS/nixpkgs`, pinned to an exact rev; `#fastfetch` selects `packages.<system>.fastfetch`, defined in that package.nix.
Nothing fetched yet but git metadata — every Nix journey starts with a file like this.
-->

---
layout: center
---

<div class="absolute inset-0 flex flex-col" style="background: #EDF2FA;">
  <div class="flex h-10 gap-2 mx-8 mt-8">
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs tracking-widest" style="color: #27385D;"><Ico name="compass" class="text-sm" /></div>
    <div class="flex-none flex items-center justify-center gap-2 px-6 text-white" style="background: #5277C3;"><Ico name="scroll" class="text-sm" /><span class="font-mono text-xs tracking-widest">evaluate</span></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs tracking-widest" style="color: #27385D;"><Ico name="shuffle" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs tracking-widest" style="color: #27385D;"><Ico name="globe-hemisphere-west" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs tracking-widest" style="color: #27385D;"><Ico name="hammer" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs tracking-widest" style="color: #27385D;"><Ico name="package" class="text-sm" /></div>
  </div>
  <div class="flex-1 flex flex-col items-center justify-center gap-8 px-16">
    <div class="flex items-center gap-0 w-[640px] h-[68px] text-sm">
      <div class="w-[220px] h-full bg-white flex flex-col items-center justify-center text-center leading-tight font-mono text-xs" style="color: #0D1B2E;"><span>expression</span><span>package.nix</span></div>
      <div class="flex-1 relative flex items-center"><span class="absolute left-1/2 top-1/2 -translate-x-1/2 -translate-y-1/2 z-1 font-mono text-[10px] tracking-widest px-2 py-1 text-white whitespace-nowrap" style="background: #27385D;">evaluate</span><div class="h-0.5 flex-1" style="background: #27385D;"></div><div class="w-0 h-0" style="border-top: 5px solid transparent; border-bottom: 5px solid transparent; border-left: 8px solid #27385D;"></div></div>
      <div class="w-[220px] h-full bg-white flex flex-col items-center justify-center text-center leading-tight font-mono text-xs" style="color: #0D1B2E;"><span>derivation</span><span>fastfetch-2.65.2.drv</span></div>
    </div>
    <div class="grid grid-cols-2 gap-8 w-full">
      <div class="text-left">
        <div class="h-9 flex items-center gap-3 px-4" style="background: #27385D;"><Ico name="target" class="text-base text-white" /><span class="font-mono text-xs tracking-widest text-white">the recipe alone names the output</span></div>

```python
out = "/nix/store/"
    + hash(inputDrvs, builder, env, platform)
    + "-fastfetch-2.65.2"
```

</div>
      <div class="text-left">
        <div class="h-9 flex items-center gap-3 px-4" style="background: #5277C3;"><simple-icons-nixos class="text-base text-white" /><span class="font-mono text-xs tracking-widest text-white">the .drv · a build recipe as plain data</span></div>

```json
{
  "name": "fastfetch-2.65.2",
  "inputDrvs": [ "…-yyjson.drv", "…-gcc-14.drv" ],
  "builder": "/nix/store/…-bash-5.2/bin/bash",
  "env": { "src": "/nix/store/…" },
  "outputs": {
    "out": "/nix/store/rdd4pnr4…-fastfetch-2.65.2"
  }
}
```

</div>
    </div>
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
**Evaluate** — a pure, lazy function: pinned inputs in → build recipe out, nothing built or downloaded yet. The result is a **derivation** (`.drv`): the recipe plus the hash of every input, just data (`nix derivation show`). Even `builder` is a store-path bash — nothing ambient sneaks in.
The key move: evaluation also computes the output's store path as `hash(recipe)` — **input-addressed**, known before any work. Contrast `narHash = hash(bytes)`, a content hash of something already fetched. This is the step npm's analogy lacks — it's what makes outputs cacheable/verifiable/shareable.
If asked: content-addressed (`ca-derivations`) hashes output bytes, still experimental; today nixpkgs is overwhelmingly input-addressed.
-->

---
layout: center
---

<div class="absolute inset-0 flex flex-col" style="background: #EDF2FA;">
  <div class="flex h-10 gap-2 mx-8 mt-8">
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs tracking-widest" style="color: #27385D;"><Ico name="compass" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs tracking-widest" style="color: #27385D;"><Ico name="scroll" class="text-sm" /></div>
    <div class="flex-none flex items-center justify-center gap-2 px-6 text-white" style="background: #5277C3;"><Ico name="shuffle" class="text-sm" /><span class="font-mono text-xs tracking-widest">realize</span></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs tracking-widest" style="color: #27385D;"><Ico name="globe-hemisphere-west" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs tracking-widest" style="color: #27385D;"><Ico name="hammer" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs tracking-widest" style="color: #27385D;"><Ico name="package" class="text-sm" /></div>
  </div>
  <div class="flex-1 flex items-center justify-center">
    <div class="relative w-[900px] h-[390px] text-sm">
      <svg class="absolute inset-0 w-full h-full" viewBox="0 0 900 390" fill="none">
        <defs>
          <marker id="rlz-arrow" viewBox="0 0 10 10" refX="9" refY="5" markerWidth="8" markerHeight="10" markerUnits="userSpaceOnUse" orient="auto">
            <path d="M 0 0 L 10 5 L 0 10 z" fill="#27385D" />
          </marker>
        </defs>
        <path d="M 160 200 H 211" stroke="#27385D" stroke-width="2" marker-end="url(#rlz-arrow)" />
        <path d="M 270 141 V 90 H 400" stroke="#27385D" stroke-width="2" fill="none" marker-end="url(#rlz-arrow)" />
        <path d="M 270 259 V 290 H 411" stroke="#27385D" stroke-width="2" fill="none" marker-end="url(#rlz-arrow)" />
        <path d="M 470 231 V 215 H 600" stroke="#27385D" stroke-width="2" fill="none" marker-end="url(#rlz-arrow)" />
        <path d="M 470 345 H 600" stroke="#27385D" stroke-width="2" fill="none" marker-end="url(#rlz-arrow)" />
        <path d="M 540 90 H 770" stroke="#27385D" stroke-width="2" marker-end="url(#rlz-arrow)" />
        <path d="M 750 215 H 770" stroke="#27385D" stroke-width="2" marker-end="url(#rlz-arrow)" />
        <path d="M 750 345 H 770" stroke="#27385D" stroke-width="2" marker-end="url(#rlz-arrow)" />
      </svg>
      <div class="absolute flex flex-col items-center justify-center text-center leading-tight font-mono text-xs bg-white" style="left: 10px; top: 167px; width: 150px; height: 66px; color: #0D1B2E;"><span>.drv recipe</span><span>+ input hashes</span></div>
      <div class="absolute bg-white" style="left: 228px; top: 158px; width: 84px; height: 84px; transform: rotate(45deg);"></div>
      <div class="absolute flex flex-col items-center justify-center text-center leading-tight font-mono text-[10px]" style="left: 210px; top: 170px; width: 120px; height: 60px; color: #0D1B2E;"><span>in</span><span>/nix/store?</span></div>
      <div class="absolute bg-white flex items-center justify-center gap-2 text-sm" style="left: 400px; top: 65px; width: 140px; height: 50px; color: #0D1B2E;"><Ico name="check-fat" /> use it</div>
      <div class="absolute bg-white" style="left: 428px; top: 248px; width: 84px; height: 84px; transform: rotate(45deg);"></div>
      <div class="absolute flex flex-col items-center justify-center text-center leading-tight font-mono text-[10px]" style="left: 410px; top: 260px; width: 120px; height: 60px; color: #0D1B2E;"><span>in a</span><span>cache?</span></div>
      <div class="absolute bg-white flex items-center justify-center gap-2 text-sm" style="left: 600px; top: 190px; width: 150px; height: 50px; color: #0D1B2E;"><Ico name="download-simple" /> substitute</div>
      <div class="absolute bg-white flex items-center justify-center gap-2 text-sm" style="left: 600px; top: 320px; width: 150px; height: 50px; color: #0D1B2E;"><Ico name="hammer" /> build in sandbox</div>
      <div class="absolute flex flex-col items-center justify-center text-center leading-tight text-white" style="left: 770px; top: 50px; width: 120px; height: 300px; background: #5277C3;"><simple-icons-nixos class="text-2xl pb-2" /><span>realized</span><span>store path</span></div>
      <span class="absolute z-1 font-mono text-[10px] tracking-widest px-2 py-1 text-white" style="left: 252px; top: 104px; background: #27385D;">yes</span>
      <span class="absolute z-1 font-mono text-[10px] tracking-widest px-2 py-1 text-white" style="left: 255px; top: 263px; background: #27385D;">no</span>
      <span class="absolute z-1 font-mono text-[10px] tracking-widest px-2 py-1 text-white" style="left: 512px; top: 204px; background: #27385D;">yes</span>
      <span class="absolute z-1 font-mono text-[10px] tracking-widest px-2 py-1 text-white" style="left: 515px; top: 334px; background: #27385D;">no</span>
    </div>
  </div>
</div>

<!--
**Realize** — recipe into a real store path, cheapest way first: in the store → done; in a cache → download ("substitute"); else build it in a sealed sandbox (next stop).
Nix realizes the whole **closure** this way — pcre2 → gcc-libs → glibc — before anything runs.
-->

---
layout: center
---

<div class="absolute inset-0 flex flex-col" style="background: #EDF2FA;">
  <div class="flex h-10 gap-2 mx-8 mt-8">
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs tracking-widest" style="color: #27385D;"><Ico name="compass" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs tracking-widest" style="color: #27385D;"><Ico name="scroll" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs tracking-widest" style="color: #27385D;"><Ico name="shuffle" class="text-sm" /></div>
    <div class="flex-none flex items-center justify-center gap-2 px-6 text-white" style="background: #5277C3;"><Ico name="globe-hemisphere-west" class="text-sm" /><span class="font-mono text-xs tracking-widest">cache</span></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs tracking-widest" style="color: #27385D;"><Ico name="hammer" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs tracking-widest" style="color: #27385D;"><Ico name="package" class="text-sm" /></div>
  </div>
  <div class="flex-1 flex flex-col items-center justify-center">
    <div class="w-[680px] h-12 bg-white flex items-center justify-center gap-3 font-mono text-xs" style="color: #0D1B2E;"><span class="tracking-widest">need</span><span>/nix/store/a3f9k2q…-fastfetch-2.65.2</span></div>
    <div class="relative w-[680px] h-9"><div class="absolute top-0 bottom-0 left-[100px] -translate-x-1/2 flex flex-col items-center"><div class="w-0.5 flex-1" style="background: #27385D;"></div><div class="w-0 h-0" style="border-left: 5px solid transparent; border-right: 5px solid transparent; border-top: 8px solid #27385D;"></div></div><span class="absolute left-[100px] top-1/2 -translate-x-1/2 -translate-y-1/2 z-1 font-mono text-[10px] tracking-widest px-2 py-0.5 text-white" style="background: #27385D;">query</span></div>
    <div class="w-[680px] h-14 flex items-stretch text-white" style="background: #27385D;">
      <div class="w-[200px] flex flex-col justify-center leading-tight px-5"><span class="font-mono text-[10px] tracking-widest pb-0.5">local store</span><span class="text-[11px]">/nix/store</span></div>
      <div class="flex-1 flex items-center px-5 font-mono text-[11px] bg-white" style="color: #0D1B2E;">ls /nix/store/a3f9k2q… → not found</div>
    </div>
    <div class="relative w-[680px] h-9"><div class="absolute top-0 bottom-0 left-[100px] -translate-x-1/2 flex flex-col items-center"><div class="w-0.5 flex-1" style="background: #27385D;"></div><div class="w-0 h-0" style="border-left: 5px solid transparent; border-right: 5px solid transparent; border-top: 8px solid #27385D;"></div></div><span class="absolute left-[100px] top-1/2 -translate-x-1/2 -translate-y-1/2 z-1 font-mono text-[10px] tracking-widest px-2 py-0.5 text-white" style="background: #27385D;">miss</span></div>
    <div class="w-[680px] h-14 flex items-stretch text-white" style="background: #27385D;">
      <div class="w-[200px] flex flex-col justify-center leading-tight px-5"><span class="font-mono text-[10px] tracking-widest pb-0.5">LAN Cache (Harmonia)</span><span class="text-[11px]">http://10.0.0.5:5000</span></div>
      <div class="flex-1 flex items-center px-5 font-mono text-[11px] bg-white" style="color: #0D1B2E;">GET 10.0.0.5:5000/a3f9k2q….narinfo → 404</div>
    </div>
    <div class="relative w-[680px] h-9"><div class="absolute top-0 bottom-0 left-[100px] -translate-x-1/2 flex flex-col items-center"><div class="w-0.5 flex-1" style="background: #27385D;"></div><div class="w-0 h-0" style="border-left: 5px solid transparent; border-right: 5px solid transparent; border-top: 8px solid #27385D;"></div></div><span class="absolute left-[100px] top-1/2 -translate-x-1/2 -translate-y-1/2 z-1 font-mono text-[10px] tracking-widest px-2 py-0.5 text-white" style="background: #27385D;">miss</span></div>
    <div class="w-[680px] h-14 flex items-stretch text-white" style="background: #27385D;">
      <div class="w-[200px] flex flex-col justify-center leading-tight px-5"><span class="font-mono text-[10px] tracking-widest pb-0.5">Public Cache</span><span class="text-[11px]">cache.nixos.org, cachix</span></div>
      <div class="flex-1 flex items-center px-5 font-mono text-[11px] bg-white" style="color: #0D1B2E;">GET /a3f9k2q….narinfo → 404</div>
    </div>
    <div class="relative w-[680px] h-9"><div class="absolute top-0 bottom-0 left-[100px] -translate-x-1/2 flex flex-col items-center"><div class="w-0.5 flex-1" style="background: #27385D;"></div><div class="w-0 h-0" style="border-left: 5px solid transparent; border-right: 5px solid transparent; border-top: 8px solid #27385D;"></div></div><span class="absolute left-[100px] top-1/2 -translate-x-1/2 -translate-y-1/2 z-1 font-mono text-[10px] tracking-widest px-2 py-0.5 text-white" style="background: #27385D;">miss</span></div>
    <div class="w-[680px] h-12 bg-white flex items-center justify-center gap-2 text-sm" style="color: #0D1B2E;"><Ico name="hammer" /><span>build it, push back to LAN cache</span></div>
  </div>
</div>

<!--
The hash is a global key — every machine agrees what a build *should* be — so the store is a **cache hierarchy** (like CPU caches): local store (free) → LAN cache (Harmonia) → public cache (cache.nixos.org / Cachix). Nearest copy wins; whoever builds pushes back, warming the cache for everyone behind them.
You trust the hash + signatures, never the server. Cachix = hosted caches (push once, community substitutes); Nix paths are already content-addressed, so they map onto IPFS too.
End of the trip: one `.nix` expression → a build the whole planet can reuse.
-->

---
layout: center
---

<div class="absolute inset-0 flex flex-col" style="background: #EDF2FA;">
  <div class="flex h-10 gap-2 mx-8 mt-8">
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs tracking-widest" style="color: #27385D;"><Ico name="compass" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs tracking-widest" style="color: #27385D;"><Ico name="scroll" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs tracking-widest" style="color: #27385D;"><Ico name="shuffle" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs tracking-widest" style="color: #27385D;"><Ico name="globe-hemisphere-west" class="text-sm" /></div>
    <div class="flex-none flex items-center justify-center gap-2 px-6 text-white" style="background: #5277C3;"><Ico name="hammer" class="text-sm" /><span class="font-mono text-xs tracking-widest">build</span></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs tracking-widest" style="color: #27385D;"><Ico name="package" class="text-sm" /></div>
  </div>
  <div class="flex-1 flex items-center justify-center">
    <div class="relative w-[940px] h-[360px] text-xs">
      <svg class="absolute inset-0 w-full h-full" viewBox="0 0 940 360" fill="none">
        <defs>
          <marker id="bld-arrow" viewBox="0 0 10 10" refX="9" refY="5" markerWidth="8" markerHeight="10" markerUnits="userSpaceOnUse" orient="auto">
            <path d="M 0 0 L 10 5 L 0 10 z" fill="#27385D" />
          </marker>
        </defs>
        <path d="M 180 50 H 345 V 128" stroke="#27385D" stroke-width="2" fill="none" marker-end="url(#bld-arrow)" />
        <path d="M 180 130 H 270" stroke="#27385D" stroke-width="2" marker-end="url(#bld-arrow)" />
        <path d="M 180 195 H 270" stroke="#27385D" stroke-width="2" marker-end="url(#bld-arrow)" />
        <path d="M 180 265 H 345 V 212" stroke="#27385D" stroke-width="2" fill="none" marker-end="url(#bld-arrow)" />
        <path d="M 420 170 H 460 V 90 H 500" stroke="#27385D" stroke-width="2" fill="none" marker-end="url(#bld-arrow)" />
        <path d="M 420 170 H 460 V 270 H 500" stroke="#27385D" stroke-width="2" fill="none" marker-end="url(#bld-arrow)" />
        <path d="M 700 90 H 725 V 180 H 750" stroke="#27385D" stroke-width="2" fill="none" marker-end="url(#bld-arrow)" />
        <path d="M 700 270 H 725 V 180 H 750" stroke="#27385D" stroke-width="2" fill="none" marker-end="url(#bld-arrow)" />
      </svg>
      <div class="absolute bg-white flex flex-col items-center justify-center text-center leading-tight font-mono" style="left: 10px; top: 27px; width: 170px; height: 46px; color: #0D1B2E;"><span>source tarball</span><span class="text-[9px] tracking-widest" style="color: #27385D;">sha256-Xq3…</span></div>
      <div class="absolute bg-white flex flex-col items-center justify-center text-center leading-tight font-mono" style="left: 10px; top: 107px; width: 170px; height: 46px; color: #0D1B2E;"><span>yyjson</span><span class="text-[9px] tracking-widest" style="color: #27385D;">/nix/store/b7c4…</span></div>
      <div class="absolute bg-white flex flex-col items-center justify-center text-center leading-tight font-mono" style="left: 10px; top: 172px; width: 170px; height: 46px; color: #0D1B2E;"><span>glibc</span><span class="text-[9px] tracking-widest" style="color: #27385D;">/nix/store/a1f9…</span></div>
      <div class="absolute bg-white flex flex-col items-center justify-center text-center leading-tight font-mono" style="left: 10px; top: 242px; width: 170px; height: 46px; color: #0D1B2E;"><span>gcc toolchain</span><span class="text-[9px] tracking-widest" style="color: #27385D;">/nix/store/9d2k…</span></div>
      <div class="absolute bg-white flex flex-col items-center justify-center text-center leading-tight font-mono" style="left: 270px; top: 128px; width: 150px; height: 84px; color: #0D1B2E;"><Ico name="receipt" class="pb-1 text-base" /><span>pinned recipe</span></div>
      <div class="absolute flex flex-col bg-white" style="left: 500px; top: 42px; width: 200px; height: 96px;"><div class="h-7 flex items-center px-3 font-mono text-[10px] tracking-widest text-white" style="background: #27385D;">local sandbox</div><div class="flex-1 flex items-center justify-center gap-2 text-sm" style="color: #0D1B2E;"><Ico name="hammer" /> build</div></div>
      <div class="absolute flex flex-col bg-white" style="left: 500px; top: 222px; width: 200px; height: 96px;"><div class="h-7 flex items-center px-3 font-mono text-[10px] tracking-widest text-white" style="background: #27385D;">remote · ssh://10.0.0.5</div><div class="flex-1 flex items-center justify-center gap-2 text-sm" style="color: #0D1B2E;"><Ico name="hammer" /> build</div></div>
      <div class="absolute flex flex-col items-center justify-center text-center leading-tight text-white" style="left: 750px; top: 110px; width: 170px; height: 140px; background: #5277C3;"><simple-icons-nixos class="text-2xl pb-2" /><span class="font-mono text-[11px]">…-fastfetch-2.65.2</span><span class="text-[11px] pt-1">bit-identical either way</span></div>
      <span class="absolute z-1 font-mono text-[10px] tracking-widest px-2 py-1 text-white" style="left: 230px; top: 40px; background: #27385D;">content hash</span>
      <span class="absolute z-1 font-mono text-[10px] tracking-widest px-2 py-1 text-white" style="left: 230px; top: 253px; background: #27385D;">store path</span>
      <span class="absolute z-1 font-mono text-[10px] tracking-widest px-2 py-1 text-white" style="left: 440px; top: 120px; background: #27385D;">local</span>
      <span class="absolute z-1 font-mono text-[10px] tracking-widest px-2 py-1 text-white" style="left: 430px; top: 214px; background: #27385D;">remote</span>
    </div>
  </div>
</div>

<!--
Zoom into "build in sandbox." Clean room: no network, declared inputs only (read-only), sealed namespaces + pinned build user + fixed timestamps — that seal is *why* the hash can promise reproducibility.
Two doors in, both hashes: **sources by content hash** (fetchurl/fetchFromGitHub are fixed-output — network allowed only because bytes must match a declared sha256, wherever they come from) and **dependencies by store path** (yyjson, glibc, gcc, mounted read-only; nothing ambient).
Because everything's pinned, either room yields the same bytes — so build wherever's fastest: `nix build --builders "ssh://10.0.0.5"` ships the derivation off, path comes back bit-identical.
-->

---
layout: center
---

<div class="absolute inset-0 flex flex-col" style="background: #EDF2FA;">
  <div class="flex h-10 gap-2 mx-8 mt-8">
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs tracking-widest" style="color: #27385D;"><Ico name="compass" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs tracking-widest" style="color: #27385D;"><Ico name="scroll" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs tracking-widest" style="color: #27385D;"><Ico name="shuffle" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs tracking-widest" style="color: #27385D;"><Ico name="globe-hemisphere-west" class="text-sm" /></div>
    <div class="flex-1 flex items-center justify-center bg-white font-mono text-xs tracking-widest" style="color: #27385D;"><Ico name="hammer" class="text-sm" /></div>
    <div class="flex-none flex items-center justify-center gap-2 px-6 text-white" style="background: #5277C3;"><Ico name="package" class="text-sm" /><span class="font-mono text-xs tracking-widest">store</span></div>
  </div>
  <div class="flex-1 grid grid-cols-2 gap-10 items-center px-16">
    <div class="text-left">
      <div class="h-9 flex items-center gap-3 px-4" style="background: #27385D;"><Ico name="archive" class="text-base text-white" /><span class="font-mono text-xs tracking-widest text-white">FHS — every other distro</span></div>

```sh
/usr/bin/python3         # THE python
/usr/lib/libssl.so       # THE openssl
/etc/nginx/nginx.conf    # THE config

# one global path, for every program
$ whereis python3
python3: /usr/bin/python3

# …at best a version alias in the same shared dir
$ readlink /usr/bin/python3
python3.12

# everyone loads THE same global libs
$ ldd /usr/bin/python3
libpython3.12.so => /usr/lib/libpython3.12.so
libssl.so.3 => /usr/lib/libssl.so.3
…
```

<div class="h-9 flex items-center px-4 font-mono text-xs tracking-widest" style="background: #e2e8f0; color: #475569;">one global namespace</div>
    </div>
    <div class="text-left">
      <div class="h-9 flex items-center gap-3 px-4" style="background: #5277C3;"><simple-icons-nixos class="text-base text-white" /><span class="font-mono text-xs tracking-widest text-white">/nix/store</span></div>

```sh
/nix/store/a3f9…-python3-3.12.8/bin/python3
/nix/store/b7c4…-openssl-3.0.13/lib/libssl.so
/nix/store/c1x8…-openssl-1.1.1w/lib/libssl.so

# no /usr/bin — PATH leads straight into the store
$ whereis python3
python3: /nix/store/2qjb…-system-path/bin/python3

# …that path is itself a symlink to the package
$ readlink /nix/store/2qjb…-system-path/bin/python3
/nix/store/a3f9…-python3-3.12.8/bin/python3

# nothing copied — even its own lib resolves by path
$ ldd /nix/store/a3f9…-python3-3.12.8/bin/python3
libpython3.12.so => /nix/store/a3f9…-python3…/lib/…
libssl.so.3 => /nix/store/b7c4…-openssl-3.0.13/lib/…
…
```

<div class="h-9 flex items-center px-4 font-mono text-xs tracking-widest" style="background: #e2e8f0; color: #475569;">read-only · hash-addressed</div>
    </div>
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
Nix deliberately breaks the **FHS** (the /usr/bin, /usr/lib, /etc convention = global mutable state, one version of each thing, installs overwrite in place). On NixOS there's no populated /usr/lib; every package lives in its own hash-addressed prefix, binaries find deps via RPATH/patched shebangs to absolute store paths — which is *how* the two OpenSSLs coexisted in the dependency DAG back in Why people love it.
The /nix/store panel (real output): nothing is "installed" — PATH points at `/run/current-system/sw`, which is itself a symlink to the `…-system-path` store path (the buildEnv merging every system package), so `whereis` prints a store path straight away. And that `bin/python3` is *still* a symlink — `readlink` lands in the actual python3 package: the first path in the listing above, closing the loop. The composition layer is symlinks almost everywhere: profiles (`~/.nix-profile`), `/run/current-system`, `./result`, the system-path forest. Flip one symlink, flip the whole system; that's why rollbacks are O(1).
The `ldd` beat: libraries aren't symlinked — absolute store paths are baked into each ELF's RPATH at build time — and nothing is ever copied into a package. Python's own libpython resolves *inside its own store path* (the same `a3f9…` as above), while libssl resolves into openssl's path (`b7c4…`, second line of the listing): RPATH points inward for internal libs, outward for dependencies. Pedant's footnote: libssl is really linked by python's `_ssl` extension module, not the main binary — fine as an illustration. The deep bar is the FHS world; the nix-blue snowflake bar marks the store. The FHS panel mirrors the same three commands: `whereis` lands on THE one path, `readlink` at best finds a version alias in the same shared dir, and `ldd` loads THE same global libs — the ones any install can overwrite in place.
The catch: pre-built FHS-assuming binaries (Steam, vendor tools, Claude Code) need a shim — nix-ld / buildFHSEnv / steam-run, covered in NixMaxxing.
-->
