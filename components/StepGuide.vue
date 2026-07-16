<script>
// Remembers the last active step per stepper (keyed by its labels), so the
// highlight pill glides in from wherever the presenter last was — in both
// navigation directions. Module scope survives across slide instances.
const lastActive = new Map()
</script>

<script setup>
// Generic horizontal step guide for multi-slide sequences.
// steps: [{ icon?, label }] — icon is a Phosphor name (via <Ico>); falls back to the step number
// current: 1-based index of the active step; 0 = overview (all steps equal)
// compact: inactive steps collapse to their number/icon (for long step lists)
// arrow: connectors get an arrowhead (for pipelines with a direction)
import { onMounted, ref } from 'vue'
import { useNav } from '@slidev/client'
import { motion, useReducedMotion } from 'motion-v'
import Ico from './Ico.vue'

const props = defineProps({
  steps: { type: Array, required: true },
  current: { type: Number, default: 0 },
  compact: { type: Boolean, default: false },
  arrow: { type: Boolean, default: false },
})

const stepEls = ref([])
const pill = ref(null)
const reduced = useReducedMotion()
const { isPrintMode } = useNav()
const still = () => reduced.value || isPrintMode.value

const spring = { type: 'spring', visualDuration: 0.4, bounce: 0.2 }
const stepperKey = props.steps.map((s) => s.label).join('|')

const setStepEl = (i) => (r) => {
  stepEls.value[i] = r?.$el ?? r
}

function rectOf(step) {
  const el = stepEls.value[step - 1]
  if (!el) return null
  return { x: el.offsetLeft, y: el.offsetTop, width: el.offsetWidth, height: el.offsetHeight }
}

// Overview: chips drift up into place with a gentle stagger.
const overviewAnim = (i) =>
  still()
    ? {}
    : {
        initial: { opacity: 0, y: 10, scale: 0.9 },
        animate: { opacity: 1, y: 0, scale: 1 },
        transition: { ...spring, delay: i * 0.05 },
      }

const connectorAnim = (i) =>
  still()
    ? {}
    : {
        initial: { opacity: 0 },
        animate: { opacity: 1 },
        transition: { duration: 0.3, delay: i * 0.05 },
      }

onMounted(() => {
  if (props.current > 0) {
    const to = rectOf(props.current)
    if (to) {
      const from = lastActive.get(stepperKey)
      const fromRect = !still() && from && from !== props.current ? rectOf(from) : null
      pill.value = {
        initial: still() ? false : (fromRect ?? { ...to, opacity: 0, scale: 0.6 }),
        animate: { ...to, opacity: 1, scale: 1.1 },
      }
    }
  }
  lastActive.set(stepperKey, props.current)
})
</script>

<template>
  <div class="relative flex items-center gap-2 text-xs my-6 select-none">
    <motion.div
      v-if="pill"
      class="absolute top-0 left-0 rounded-full bg-blue-500 shadow"
      :initial="pill.initial"
      :animate="pill.animate"
      :transition="spring"
    />
    <template v-for="(s, i) in steps" :key="i">
      <component
        :is="current === 0 && !still() ? motion.div : 'div'"
        v-if="i"
        class="flex-1 flex items-center"
        v-bind="current === 0 ? connectorAnim(i) : {}"
      >
        <div class="h-px flex-1 bg-gray-300 dark:bg-gray-600"></div>
        <span v-if="arrow" class="text-gray-400 dark:text-gray-500 text-sm leading-none -ml-0.5"
          >▸</span
        >
      </component>
      <component
        :is="current === 0 && !still() ? motion.div : 'div'"
        :ref="setStepEl(i)"
        class="flex items-center gap-1.5 px-2.5 py-1 rounded-full whitespace-nowrap"
        :class="
          current === i + 1
            ? 'relative text-white font-bold scale-110'
            : current === 0
              ? 'bg-gray-200 dark:bg-gray-700'
              : 'bg-gray-200 dark:bg-gray-700 opacity-50'
        "
        v-bind="current === 0 ? overviewAnim(i) : {}"
      >
        <span v-if="s.icon" class="text-sm leading-none"><Ico :name="s.icon" /></span>
        <span v-else class="font-mono">{{ i + 1 }}</span>
        <span v-if="!compact || current === i + 1 || current === 0">{{ s.label }}</span>
      </component>
    </template>
  </div>
</template>
