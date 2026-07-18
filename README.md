# i <3 nix — and you should too

A conference-style talk deck that falls down the Alice in Wonderland rabbit hole into [Nix](https://nixos.org) and NixOS, built with [Slidev](https://sli.dev).

**Just want the slides?** Grab the rendered [PDF export](./i-love-nix.pdf).

## Run it locally

```bash
npm install
npm run dev      # live preview at http://localhost:3030
npm run build    # static build into dist/
npm run export   # export to PDF
npm run validate # structural check + prettier + build
```

Prefer Nix? A dev shell pins Node 22 for you:

```bash
nix develop
npm install && npm run dev
```

## Deck structure

`slides.md` is a thin index: the title and agenda slides, then one `src:` import per section, played in order.

| #   | Section              | File                         |
| --- | -------------------- | ---------------------------- |
| 01  | Down the rabbit hole | `pages/01-rabbit-hole.md`    |
| 02  | Meet Nix             | `pages/02-meet-nix.md`       |
| 03  | Why people love it   | `pages/03-why-love-it.md`    |
| 04  | Drink me (demo)      | `pages/04-drink-me.md`       |
| 05  | Under the hood       | `pages/05-under-the-hood.md` |
| 06  | The ecosystem        | `pages/06-ecosystem.md`      |

`pages/07-nixmaxxing.md` is a bonus section — it lives in `pages/` but isn't imported into the deck.

## Live demo

The "Drink me" section is a scripted live demo. Everything it needs is under `demos/`:

- `demos/README.md` — the run-sheet, act by act.
- `crab-potion`, `snake-potion`, `rabbit-potion`, `web-potion` — runnable example flakes.
- An ephemeral NixOS demo VM: `nix build .#vm --impure` (needs `DEMO_VM_SSH_PUBKEY`), driven by `demos/run-vm.sh`.
- `demos/start-slidev.sh` serves the deck from inside the VM.

## Deploy

Pushing to `master` builds and publishes the deck to GitHub Pages via `.github/workflows/pages.yml`. The base path is derived from the repository name automatically.

## Credits

Imagery is AI-generated with `scripts/gen_image.py` (Gemini). Licensed under [MIT](./LICENSE).
