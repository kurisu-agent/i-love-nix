<script>
// Central icon component — every icon in the deck goes through <Ico>.
//
//   <Ico name="rabbit" />                 Phosphor, deck-default weight
//   <Ico name="rabbit" weight="fill" />   Phosphor, per-use weight override
//   <Ico name="logos:docker-icon" />      full-color brand mark
//   <Ico name="simple-icons:nixos" />     monochrome brand glyph (tints via CSS color)
//   <Ico name="circle-flags:fr" />        country flags
//   <Ico name="x:something" />            hand-added SVG from ./custom-icons.js
//
// Size and color are inherited: style with the usual `text-*` classes.
import { addCollection } from '@iconify/vue'
import ph from '@iconify-json/ph/icons.json'
import logos from '@iconify-json/logos/icons.json'
import simpleIcons from '@iconify-json/simple-icons/icons.json'
import circleFlags from '@iconify-json/circle-flags/icons.json'
import custom from './custom-icons.js'

addCollection(ph)
addCollection(logos)
addCollection(simpleIcons)
addCollection(circleFlags)
if (Object.keys(custom.icons).length > 0) addCollection(custom)

// Deck-wide default weight for Phosphor icons — flip this one string
// (thin | light | regular | bold | fill | duotone) to restyle every icon.
const DEFAULT_WEIGHT = 'duotone'
const WEIGHTS = ['thin', 'light', 'regular', 'bold', 'fill', 'duotone']
</script>

<script setup>
import { computed } from 'vue'
import { Icon } from '@iconify/vue'

const props = defineProps({
  // Phosphor name without prefix ("rabbit"), or a prefixed Iconify id for
  // brands ("logos:docker-icon", "simple-icons:nixos", "x:custom").
  name: { type: String, required: true },
  // Per-use Phosphor weight override; ignored for prefixed names.
  weight: { type: String, default: '' },
})

const icon = computed(() => {
  if (props.name.includes(':')) return props.name
  const weight = props.weight || DEFAULT_WEIGHT
  const alreadyWeighted = WEIGHTS.some((w) => props.name.endsWith(`-${w}`))
  if (alreadyWeighted || weight === 'regular') return `ph:${props.name}`
  return `ph:${props.name}-${weight}`
})
</script>

<template>
  <Icon :icon="icon" class="ico" />
</template>

<style scoped>
/* One place to style every icon in the deck. */
.ico {
  display: inline-block;
  vertical-align: -0.125em;
}
</style>
