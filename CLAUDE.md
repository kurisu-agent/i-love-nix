# nix-pres-draft

A Slidev deck: "I ❤️ NixOS — and you should too". Themed around Alice in Wonderland
(falling down the rabbit hole into Nix).

## Presentation style

**Minimal information, visual imagery — not walls of text.**

- Prefer a strong full-bleed image or a single idea per slide over dense bullet lists.
- Cut subtitles, taglines, and "fluff" (e.g. "press space to advance"). Let visuals carry the message.
- A slide should read in a glance; details go in the speaker's mouth, not on the slide.
- Generate on-theme imagery with `scripts/gen_image.py` (Gemini, Nano Banana Pro, 16:9).

## Validation

`slides.md` is owned by `scripts/check-slides.mjs`, NOT prettier (prettier mangles Slidev's
per-slide frontmatter — it's in `.prettierignore`). After editing slides:

- `npm run validate` — full gate: structural check + `prettier --check` + `slidev build`.
- `npm run check` / `npm run check:fix` — structural validation / auto-repair.
- `npm run fmt` — format repo + self-heal `slides.md`.

Gotcha: under `mdc: true`, `<img src="/foo.png">` becomes a JS import (trips
slide-import-guard). Use a CSS background for `public/` assets instead.
