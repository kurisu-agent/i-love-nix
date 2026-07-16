<script setup>
// Step-guide through the ecosystem tour — one stop per slide, most common first.
import StepGuide from './StepGuide.vue'

defineProps({ current: { type: Number, default: 0 } })
const steps = [
  { icon: 'books', label: 'nixpkgs' },
  { icon: 'house', label: 'Home Manager' },
  { icon: 'terminal', label: 'Dev envs' },
  { icon: 'pen-nib', label: 'Editing' },
  { icon: 'magnifying-glass', label: 'Ergonomics' },
  { icon: 'apple-logo', label: 'nix-darwin' },
  { icon: 'shipping-container', label: 'Docker' },
  { icon: 'cloud-arrow-down', label: 'Cachix' },
  { icon: 'lock-key', label: 'Secrets' },
  { icon: 'hard-drives', label: 'ncps' },
  { icon: 'fire', label: 'Impermanence' },
  { icon: 'users-three', label: 'nix-community' },
  { icon: 'share-network', label: 'clan.lol' },
  { icon: 'confetti', label: 'NixCon' },
]
</script>

<template>
  <StepGuide :steps="steps" :current="current" compact />
</template>
