<script setup>
// Step-guide through the "why people love it" highlights.
import StepGuide from './StepGuide.vue'

defineProps({ current: { type: Number, default: 0 } })
const steps = [
  'Declarative',
  'Reproducible',
  'Composable',
  'Interfaces',
  'Shareable',
  'Caching',
  'nixpkgs',
  'Dependencies',
  'Rollbacks',
  'nixos-anywhere',
].map((label) => ({ label }))
</script>

<template>
  <StepGuide :steps="steps" :current="current" compact />
</template>
