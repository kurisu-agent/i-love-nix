<script setup>
// National-anthem gag — a glorious waving Dutch flag (public/dutch-flag.png) with
// the Wilhelmus (public/wilhelmus.ogg, US Navy Band, public domain) playing while
// this slide is on-screen; stops on leave. Same play/pause pattern as PbjTime.vue.
import { ref, onMounted, onBeforeUnmount } from 'vue'

const root = ref(null)
const audio = ref(null)
let observer

// Only play when the slide really fills the viewport — not as a small overview thumbnail.
function isFullscreen(el) {
  const r = el.getBoundingClientRect()
  return r.width >= window.innerWidth * 0.6
}

onMounted(() => {
  observer = new IntersectionObserver(
    ([entry]) => {
      const a = audio.value
      if (!a) return
      if (entry.isIntersecting && entry.intersectionRatio > 0.5 && isFullscreen(entry.target)) {
        a.play().catch(() => {}) // autoplay may be blocked until a user gesture
      } else {
        a.pause()
        a.currentTime = 0
      }
    },
    { threshold: [0, 0.5, 1] },
  )
  observer.observe(root.value)
})

onBeforeUnmount(() => {
  observer?.disconnect()
  const a = audio.value
  if (a) {
    a.pause()
    a.currentTime = 0
  }
})
</script>

<template>
  <div ref="root" class="wilhelmus">
    <audio ref="audio" src="/wilhelmus.ogg" loop preload="auto"></audio>
  </div>
</template>

<style scoped>
.wilhelmus {
  position: absolute;
  inset: 0;
  overflow: hidden;
  background: url(/dutch-flag.png) center / cover no-repeat;
  animation: wilhelmus-wave 18s ease-in-out infinite alternate;
}
@keyframes wilhelmus-wave {
  0% {
    transform: scale(1);
  }
  100% {
    transform: scale(1.12);
  }
}
</style>
