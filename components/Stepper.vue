<script setup>
// Step-guide through the "why people love it" highlights.
// current: 1-based index of the active step; 0 = overview (show all labels, none active).
defineProps({ current: { type: Number, default: 0 } })
const steps = [
  'Rollbacks',
  'Reproducible',
  'Build cache',
  'Declarative',
  'nixpkgs',
  'No dep-hell',
  'Flakes',
  'nixos-anywhere',
]
</script>

<template>
  <div class="flex items-center gap-2 text-xs my-6 select-none">
    <template v-for="(s, i) in steps" :key="i">
      <div v-if="i" class="h-px flex-1 bg-gray-300 dark:bg-gray-600"></div>
      <div
        class="flex items-center gap-1 px-2 py-1 rounded-full transition-all duration-300 whitespace-nowrap"
        :class="
          current === i + 1
            ? 'bg-blue-500 text-white font-bold scale-110 shadow'
            : current === 0
              ? 'bg-gray-200 dark:bg-gray-700'
              : 'bg-gray-200 dark:bg-gray-700 opacity-50'
        "
      >
        <span class="font-mono">{{ i + 1 }}</span>
        <span v-if="current === i + 1 || current === 0">{{ s }}</span>
      </div>
    </template>
  </div>
</template>
