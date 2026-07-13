<script setup>
// The evaluate → realise → store → share pipeline as a horizontal step guide.
import StepGuide from './StepGuide.vue'

defineProps({ current: { type: Number, default: 0 } })
const steps = [
  { icon: '📜', label: 'evaluate' },
  { icon: '🔀', label: 'realise' },
  { icon: '🔨', label: 'build' },
  { icon: '📦', label: 'store' },
  { icon: '🌍', label: 'share' },
]
</script>

<template>
  <StepGuide :steps="steps" :current="current" />
</template>
