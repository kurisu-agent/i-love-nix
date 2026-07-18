# i-love-nix

A Slidev deck: "I ❤️ NixOS — and you should too". Themed around Alice in Wonderland
(falling down the rabbit hole into Nix).

## Presentation style

**Minimal information, visual imagery — not walls of text.**

- Prefer a strong full-bleed image or a single idea per slide over dense bullet lists.
- Cut subtitles, taglines, and "fluff" (e.g. "press space to advance"). Let visuals carry the message.
- A slide should read in a glance; details go in the speaker's mouth, not on the slide.
- Generate on-theme imagery with `scripts/gen_image.py` (Gemini, Nano Banana Pro, 16:9).
- The live demo is scripted in `demos/README.md` (run-sheet + sample.nix + a runnable
  flake in `demos/potion/`). `demos/` must stay git-tracked — Nix only sees tracked
  files when evaluating a flake in a git repo.

## Animation

Subtle, not over the top. Three layers, use the right one:

- **Slide transitions**: global plain `fade` — deliberately boring. No whole-slide movement/blur (tried, rejected); motion belongs on individual elements.
- **In-slide reveals (markdown)**: Slidev built-ins — `<v-clicks>` / `v-click` (global `clickAnimation: up` gives a soft rise) and Slidev's built-in `v-motion` directive (@vueuse/motion, click-aware: `:initial`/`:enter`/`:click-x`/`:leave`) for one-off entrances.
- **Vue components**: `motion-v` (Motion for Vue) — import `motion` / `AnimatePresence` directly in the SFC (see `StepGuide.vue`). Do NOT register motion-v's `MotionPlugin` globally: its `v-motion` directive collides with Slidev's built-in one.

Component animations must respect `useReducedMotion()` and `useNav().isPrintMode` (exports/screenshots must render the final state, not a mid-animation frame). `StepGuide` animates its active pill from the previous step automatically — keep passing plain `:current` per slide.

## Deck structure

`slides.md` is a thin index: title/agenda slides plus one `src: ./pages/NN-section.md`
import per section. The actual content lives in `pages/*.md` (one file per section, each
opening with a section-divider slide). Edit slides in `pages/`; only touch `slides.md` to
add/reorder sections or change the agenda.

## Validation

`slides.md` and `pages/*.md` are owned by `scripts/check-slides.mjs`, NOT prettier (prettier
mangles Slidev's per-slide frontmatter — they're in `.prettierignore`). The checker follows
`src:` imports from `slides.md` automatically. After editing slides:

- `npm run validate` — full gate: structural check + `prettier --check` + `slidev build`.
- `npm run check` / `npm run check:fix` — structural validation / auto-repair.
- `npm run fmt` — format repo + self-heal `slides.md`.

Gotcha: under `mdc: true`, `<img src="/foo.png">` becomes a JS import (trips
slide-import-guard). Use a CSS background for `public/` assets instead.
