<script setup>
// Step-guide through the "why people love it" highlights.
import StepGuide from './StepGuide.vue'

defineProps({ current: { type: Number, default: 0 } })
const steps = [
  'Rollbacks',
  'Reproducible',
  'Build cache',
  'Declarative',
  'nixpkgs',
  'No dep-hell',
  'nixos-anywhere',
  'Sharing',
].map((label) => ({ label }))
</script>

<template>
  <StepGuide :steps="steps" :current="current" compact />
</template>
