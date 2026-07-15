<script setup>
// Horizontal pin timeline. Labels alternate above/below the line so columns
// can carry larger text without crowding each other.
//
//   <Timeline :items="[
//     { year: '2003', label: 'PhD research begins', muted: true, dashedAfter: true },
//     { year: '2006', label: 'the thesis', icon: 'graduation-cap' },
//     …
//   ]" />
//
// item fields:
//   year        — big label on the pin (string)
//   label       — caption, rendered as HTML (<b>, <a> ok)
//   icon        — optional Phosphor icon name appended to the caption
//   muted       — faded hollow pin (for "lead-in" points)
//   dashedAfter — the segment to the NEXT pin is dotted
import Ico from './Ico.vue'

defineProps({
  items: { type: Array, required: true },
})
</script>

<template>
  <div class="w-full">
    <div class="grid" :style="{ gridTemplateColumns: `repeat(${items.length}, minmax(0, 1fr))` }">
      <div
        v-for="(item, i) in items"
        :key="i"
        class="text-center"
        :class="item.muted ? 'opacity-60' : ''"
      >
        <!-- label above the line (even columns) -->
        <div class="h-36 flex flex-col justify-end pb-4">
          <template v-if="i % 2 === 0">
            <div class="text-2xl font-bold">{{ item.year }}</div>
            <div class="text-lg opacity-75 pt-1 -mx-[40%] leading-snug">
              <span v-html="item.label"></span>
              <Ico v-if="item.icon" :name="item.icon" class="ml-1" />
            </div>
          </template>
        </div>
        <!-- the line + pin -->
        <div class="relative flex items-center justify-center h-12">
          <div
            v-if="i > 0"
            class="absolute left-0 right-1/2 top-1/2 border-t-2 opacity-30"
            :class="items[i - 1].dashedAfter ? 'border-dashed' : ''"
          ></div>
          <div
            v-if="i < items.length - 1"
            class="absolute left-1/2 right-0 top-1/2 border-t-2 opacity-30"
            :class="item.dashedAfter ? 'border-dashed' : ''"
          ></div>
          <Ico
            v-if="item.muted"
            name="map-pin"
            weight="thin"
            class="relative text-3xl opacity-50"
          />
          <Ico v-else name="map-pin" weight="fill" class="relative text-4xl text-rose-400" />
        </div>
        <!-- label below the line (odd columns) -->
        <div class="h-36 flex flex-col justify-start pt-4">
          <template v-if="i % 2 === 1">
            <div class="text-2xl font-bold">{{ item.year }}</div>
            <div class="text-lg opacity-75 pt-1 -mx-[40%] leading-snug">
              <span v-html="item.label"></span>
              <Ico v-if="item.icon" :name="item.icon" class="ml-1" />
            </div>
          </template>
        </div>
      </div>
    </div>
  </div>
</template>
