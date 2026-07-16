<script setup>
// Full-bleed layer of falling nix snowflakes, driven by motion's frame loop.
//
//   <NixSnow class="text-white" />          flake color comes from CSS color
//   <NixSnow :count="80" :wind="0.04" />    denser storm, stronger breeze
//
// Each flake gets a depth: near flakes are bigger, faster, more opaque and
// drift further with the wind; far flakes are small, slow, and slightly
// blurred. Flakes flutter side to side on their own sine wave and tumble at
// their own rate — no two move alike. Honors prefers-reduced-motion by
// rendering a static scatter.
import { onMounted, onUnmounted, useTemplateRef } from 'vue'
import { frame, cancelFrame } from 'motion'
import Ico from './Ico.vue'

const props = defineProps({
  // How many flakes in the sky.
  count: { type: Number, default: 48 },
  // Horizontal wind, as a fraction of the container width per second.
  wind: { type: Number, default: 0.015 },
})

const container = useTemplateRef('container')
const flakeEls = useTemplateRef('flakeEls')

const rand = (lo, hi) => lo + Math.random() * (hi - lo)

// Depth-biased toward the back so the sky reads as a field, not a wall.
const flakes = Array.from({ length: props.count }, () => {
  const depth = Math.random() ** 1.4
  return {
    depth,
    size: 10 + 34 * depth,
    opacity: 0.22 + 0.38 * depth,
    blur: (1 - depth) * 1.1,
    // Fractions of container height/width per second; scaled on each frame
    // so resizes just work.
    fallSpeed: 0.05 + 0.16 * depth,
    swayAmp: rand(0.8, 2.2), // in flake sizes
    swayOmega: rand(1.2, 3.2), // rad/s
    swayPhase: rand(0, Math.PI * 2),
    tumbleSpeed: rand(12, 55) * (Math.random() < 0.5 ? -1 : 1), // deg/s
    x: Math.random(), // fraction of width
    y: rand(-0.1, 1), // fraction of height — prefilled sky
  }
})

let frameHandle = null
let elapsed = 0

function place(f, el, w, h) {
  const sway = f.swayAmp * f.size * Math.sin(f.swayOmega * elapsed + f.swayPhase)
  const rot = f.tumbleSpeed * elapsed
  el.style.transform = `translate3d(${f.x * w + sway}px, ${f.y * h}px, 0) rotate(${rot}deg)`
}

function tick({ delta }) {
  const box = container.value
  if (!box) return
  const w = box.clientWidth
  const h = box.clientHeight
  const dt = delta / 1000
  elapsed += dt

  flakes.forEach((f, i) => {
    const el = flakeEls.value?.[i]
    if (!el) return
    f.y += f.fallSpeed * dt
    f.x += props.wind * (0.4 + 0.6 * f.depth) * dt
    if (f.y * h > h + f.size * 3) {
      f.y = -(f.size * 3) / h
      f.x = Math.random()
    }
    if (f.x > 1.05) f.x -= 1.1
    if (f.x < -0.05) f.x += 1.1
    place(f, el, w, h)
  })
}

onMounted(() => {
  const reduced = window.matchMedia('(prefers-reduced-motion: reduce)').matches
  if (reduced) {
    const { clientWidth: w, clientHeight: h } = container.value
    flakes.forEach((f, i) => place(f, flakeEls.value[i], w, h))
    return
  }
  frameHandle = frame.update(tick, true)
})

onUnmounted(() => {
  if (frameHandle) cancelFrame(tick)
})
</script>

<template>
  <div
    ref="container"
    class="absolute inset-0 overflow-hidden pointer-events-none"
    aria-hidden="true"
  >
    <span
      v-for="(f, i) in flakes"
      :key="i"
      ref="flakeEls"
      class="flake"
      :style="{
        fontSize: `${f.size}px`,
        opacity: f.opacity,
        filter: f.blur > 0.3 ? `blur(${f.blur}px)` : 'none',
      }"
    >
      <Ico name="simple-icons:nixos" />
    </span>
  </div>
</template>

<style scoped>
.flake {
  position: absolute;
  top: 0;
  left: 0;
  line-height: 1;
  will-change: transform;
}
</style>
