<script setup>
// The nixos.org "above the fold" pillars, one per stepper step — icon (raw SVG
// lifted from the homepage into public/pillar-*.svg), heading, and verbatim copy.
// Renders the full slide: 3-tab stepper header with the active pillar + the
// two-column landscape body.
//
//   <NixosPillar step="reproducible" />
import { computed } from 'vue'

const props = defineProps({
  step: { type: String, required: true }, // reproducible | declarative | reliable
})

const PILLARS = [
  {
    key: 'reproducible',
    icon: 'target',
    title: 'Reproducible',
    svg: `${import.meta.env.BASE_URL}pillar-reproducible.svg`,
    html: `Nix builds packages in isolation from each other. This ensures that they are reproducible and don't have undeclared dependencies, so <b>if a package works on one machine, it will also work on another.</b>`,
  },
  {
    key: 'declarative',
    icon: 'note-pencil',
    title: 'Declarative',
    svg: `${import.meta.env.BASE_URL}pillar-declarative.svg`,
    html: `Nix makes it <b>trivial to share development and build environments</b> for your projects, regardless of what programming languages and tools you're using.`,
  },
  {
    key: 'reliable',
    icon: 'shield-check',
    title: 'Reliable',
    svg: `${import.meta.env.BASE_URL}pillar-reliable.svg`,
    html: `Nix ensures that installing or upgrading one package <b>cannot break other packages</b>. It allows you to <b>roll back to previous versions</b>, and ensures that no package is in an inconsistent state during an upgrade.`,
  },
]

const current = computed(() => PILLARS.find((p) => p.key === props.step))
</script>

<template>
  <div class="absolute inset-0 flex flex-col" style="background: #edf2fa">
    <div class="flex h-12 gap-2 m-2">
      <div
        v-for="p in PILLARS"
        :key="p.key"
        class="flex-1 flex items-center justify-center gap-2"
        :class="p.key === step ? 'text-white' : 'bg-white'"
        :style="p.key === step ? 'background: #5277C3' : 'color: #27385D'"
      >
        <Ico :name="p.icon" class="text-sm" />
        <span class="font-mono text-xs tracking-widest">{{ p.key }}</span>
      </div>
    </div>
    <div class="flex-1 m-2 mt-0 bg-white grid grid-cols-[2fr_3fr] items-center">
      <div
        class="h-64 mx-14"
        :style="`background: url(${current.svg}) center / contain no-repeat`"
      ></div>
      <div class="text-left pr-20">
        <div class="text-5xl font-bold pb-8" style="color: #5277c3">{{ current.title }}</div>
        <div class="text-2xl leading-relaxed" style="color: #0d1b2e" v-html="current.html"></div>
        <div class="font-mono text-xs tracking-widest pt-8" style="color: #94a3b8">nixos.org</div>
      </div>
    </div>
  </div>
</template>
