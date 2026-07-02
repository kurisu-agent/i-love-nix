<script setup>
// Intermission gag — the OG transparent dancing banana GIF (public/pbj-banana.gif,
// by creator Trym Stene) on a flashing background; the colors show through the
// transparency. Absolute src → served from public/, dodging the slide-import-guard.
// Audio (public/pbj.mp3) plays while this slide is on-screen and stops on leave.
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
  <div ref="root" class="pbj">
    <img
      src="/pbj-banana.gif"
      alt="It's peanut butter jelly time — dancing banana"
      class="pbj-gif"
    />
    <audio ref="audio" src="/pbj.mp3" loop preload="auto"></audio>
  </div>
</template>

<style scoped>
.pbj {
  position: absolute;
  inset: 0;
  display: flex;
  align-items: center;
  justify-content: center;
  overflow: hidden;
  animation: pbj-flash 0.7s steps(1, end) infinite;
}
@keyframes pbj-flash {
  0% {
    background: #ff004d;
  }
  16% {
    background: #ffa300;
  }
  33% {
    background: #ffec27;
  }
  50% {
    background: #00e436;
  }
  66% {
    background: #29adff;
  }
  83% {
    background: #ff77a8;
  }
  100% {
    background: #ff004d;
  }
}
.pbj-gif {
  height: 82%;
  width: auto;
  filter: drop-shadow(0 14px 30px rgba(0, 0, 0, 0.45));
  animation: pbj-bob 0.5s ease-in-out infinite;
}
@keyframes pbj-bob {
  0%,
  100% {
    transform: translateY(0) rotate(-1.5deg);
  }
  50% {
    transform: translateY(-14px) rotate(1.5deg);
  }
}
</style>
