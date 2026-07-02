<script setup>
// Image placeholder — swap for a real <img>/CSS-background once art exists.
defineProps({ label: { type: String, default: 'image' } })
</script>

<template>
  <div
    class="flex items-center justify-center h-60 rounded-xl border-2 border-dashed border-gray-400 opacity-60 text-center px-4"
  >
    <div>
      <div class="text-4xl mb-2">🖼️</div>
      <div class="text-sm">{{ label }}</div>
    </div>
  </div>
</template>
