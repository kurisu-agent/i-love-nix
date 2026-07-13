<script setup>
// Full-bleed section divider: Alice art + a positionable title panel.
const props = defineProps({
  image: { type: String, required: true },
  title: { type: String, required: true },
  subtitle: { type: String, default: '' },
  // one of: top-left · top-right · bottom-left · bottom-right
  position: { type: String, default: 'top-left' },
})

const POSITIONS = {
  'top-left': 'top-8 left-8',
  'top-right': 'top-8 right-8',
  'bottom-left': 'bottom-8 left-8',
  'bottom-right': 'bottom-8 right-8',
}
</script>

<template>
  <div
    class="absolute inset-0"
    :style="{ background: `#000 url(${image}) center / cover no-repeat` }"
  ></div>
  <div
    class="absolute text-left text-white rounded-xl px-6 py-5"
    :class="POSITIONS[props.position] || POSITIONS['top-left']"
    style="background: rgba(0, 0, 0, 0.65); backdrop-filter: blur(4px)"
  >
    <div class="text-4xl font-bold tracking-wide">{{ title }}</div>
    <div v-if="subtitle" class="text-lg opacity-80 pt-2">{{ subtitle }}</div>
  </div>
</template>
