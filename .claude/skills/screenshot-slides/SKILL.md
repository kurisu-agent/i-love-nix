---
name: screenshot-slides
description: Render deck slides to PNGs for visual inspection (slidev export + Nix-provided Playwright). Use when asked to screenshot, preview, or visually verify slides, or after editing slide layout/mermaid charts. Optional argument: a slide range like "17-22".
---

# Screenshot slides

Run the helper script (it self-heals its own setup — Playwright browsers from
Nix, matching npm `playwright-chromium`, emoji font for Chromium):

```bash
scripts/screenshot-slides.sh [range] [outdir]
```

- `range` — optional slide range like `17-22` or `5` (omit for the whole deck)
- `outdir` — optional output directory, default `shots/` (recreated each run)

Then Read the PNGs (`shots/<slide-number>.png`) to inspect them.

Notes:

- Slide numbers match the list printed by `npm run check`.
- First run may take a minute (Nix fetches browsers); later runs are fast.
- Look for: charts overflowing the slide or drowning in dead space (fix via the
  mermaid `{scale: N}` value), tofu boxes where emoji should be, misaligned
  ASCII diagrams, and stray/unclosed `</div>`s (these surface as an "Invalid
  end tag" Pre-transform error in the export output and a blank slide).
