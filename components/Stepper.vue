<script setup>
// Step-guide through the "why people love it" highlights.
import StepGuide from './StepGuide.vue'

defineProps({ current: { type: Number, default: 0 } })
const steps = [
  { icon: 'note-pencil', label: 'Declarative' },
  { icon: 'target', label: 'Deterministic' },
  { icon: 'puzzle-piece', label: 'Composable' },
  { icon: 'gift', label: 'Shareable' },
  { icon: 'plug', label: 'Interfaces' },
  { icon: 'download-simple', label: 'Substitution' },
  { icon: 'graph', label: 'Dependencies' },
  { icon: 'books', label: 'nixpkgs' },
  { icon: 'rewind', label: 'Rollbacks' },
  { icon: 'rocket-launch', label: 'nixos-anywhere' },
]
</script>

<template>
  <StepGuide :steps="steps" :current="current" compact />
</template>
