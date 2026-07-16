#!/usr/bin/env node
// Capture website screenshots for the ecosystem slides. Viewport is a bit
// tighter than the ~2:1 slide area under the stepper, so content renders
// larger and the bottom crops slightly (background-position: top).
// Run via: PLAYWRIGHT_BROWSERS_PATH=<nix path> node scripts/shoot-sites.mjs [name...]
import { chromium } from 'playwright-chromium'

const SITES = [
  { name: 'nixpkgs', url: 'https://github.com/NixOS/nixpkgs' },
  {
    name: 'nixpkgs-search',
    url: 'https://search.nixos.org/packages?channel=unstable&query=firefox',
  },
  { name: 'nix-community', url: 'https://github.com/nix-community' },
  { name: 'nix-darwin', url: 'https://github.com/nix-darwin/nix-darwin' },
  {
    name: 'home-manager',
    url: 'https://home-manager-options.extranix.com/?query=git&release=release-25.05',
  },
  { name: 'devenv', url: 'https://devenv.sh' },
  { name: 'impermanence', url: 'https://github.com/nix-community/impermanence' },
  { name: 'cachix', url: 'https://www.cachix.org' },
  { name: 'sops-nix', url: 'https://github.com/Mic92/sops-nix' },
  { name: 'ncps', url: 'https://github.com/kalbasit/ncps' },
  { name: 'nixos-anywhere', url: 'https://github.com/nix-community/nixos-anywhere' },
  { name: 'clan', url: 'https://clan.lol' },
  {
    name: 'nixcon',
    url: 'https://2026.nixcon.org',
    // "JOIN NIXCON 2026" flashes; freeze it in its dark state (match body text).
    prep: async (page) => {
      const dark = await page.evaluate(
        () => getComputedStyle(document.querySelector('#about p')).color,
      )
      await page.addStyleTag({
        content: `#nixcon-title { animation: none !important; opacity: 1 !important; color: ${dark} !important; }`,
      })
    },
  },
]

const only = process.argv.slice(2)
const targets = only.length ? SITES.filter((s) => only.includes(s.name)) : SITES

const browser = await chromium.launch()
const ctx = await browser.newContext({
  viewport: { width: 1280, height: 720 },
  deviceScaleFactor: 2,
})

for (const { name, url, prep } of targets) {
  const page = await ctx.newPage()
  try {
    await page.goto(url, { waitUntil: 'networkidle', timeout: 45000 }).catch(() => {})
    await page.waitForTimeout(2500)
    if (prep) await prep(page)
    await page.screenshot({ path: `public/site-${name}.png` })
    console.log(`ok  ${name}`)
  } catch (e) {
    console.log(`ERR ${name}: ${e.message.split('\n')[0]}`)
  }
  await page.close()
}
await browser.close()
