<script setup>
// Generic horizontal step guide for multi-slide sequences.
// steps: [{ icon?, label }] — icon falls back to the step number
// current: 1-based index of the active step; 0 = overview (all steps equal)
// compact: inactive steps collapse to their number/icon (for long step lists)
defineProps({
  steps: { type: Array, required: true },
  current: { type: Number, default: 0 },
  compact: { type: Boolean, default: false },
})
</script>

<template>
  <div class="flex items-center gap-2 text-xs my-6 select-none">
    <template v-for="(s, i) in steps" :key="i">
      <div v-if="i" class="h-px flex-1 bg-gray-300 dark:bg-gray-600"></div>
      <div
        class="flex items-center gap-1.5 px-2.5 py-1 rounded-full transition-all duration-300 whitespace-nowrap"
        :class="
          current === i + 1
            ? 'bg-blue-500 text-white font-bold scale-110 shadow'
            : current === 0
              ? 'bg-gray-200 dark:bg-gray-700'
              : 'bg-gray-200 dark:bg-gray-700 opacity-50'
        "
      >
        <span v-if="s.icon" class="text-sm leading-none">{{ s.icon }}</span>
        <span v-else class="font-mono">{{ i + 1 }}</span>
        <span v-if="!compact || current === i + 1 || current === 0">{{ s.label }}</span>
      </div>
    </template>
  </div>
</template>
