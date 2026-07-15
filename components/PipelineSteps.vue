<script setup>
// The resolve → evaluate → realize → build → store → cache pipeline as a horizontal step guide.
import StepGuide from './StepGuide.vue'

defineProps({ current: { type: Number, default: 0 } })
const steps = [
  { icon: 'compass', label: 'resolve' },
  { icon: 'scroll', label: 'evaluate' },
  { icon: 'shuffle', label: 'realize' },
  { icon: 'hammer', label: 'build' },
  { icon: 'package', label: 'store' },
  { icon: 'globe-hemisphere-west', label: 'cache' },
]
</script>

<template>
  <StepGuide :steps="steps" :current="current" arrow />
</template>
