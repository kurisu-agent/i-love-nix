#!/usr/bin/env node
// Deterministic structural validator for the Slidev deck.
// No dev server, no network — pure source + @slidev/parser analysis.
//
// Usage:
//   node scripts/check-slides.mjs [file]        # validate (exit 1 on error)
//   node scripts/check-slides.mjs [file] --fix  # auto-fix what's safely fixable
//   node scripts/check-slides.mjs [file] --quiet # only print problems
import { load } from '@slidev/parser/fs'
import { readFileSync, writeFileSync } from 'node:fs'
import { resolve, dirname, basename } from 'node:path'

const argv = process.argv.slice(2)
const FIX = argv.includes('--fix')
const QUIET = argv.includes('--quiet')
const FILE = resolve(argv.find((a) => !a.startsWith('--')) || 'slides.md')

const YAML_KEY = /^[A-Za-z_][\w-]*\s*:/
const isSep = (l) => l.trim() === '---'

function lint(src) {
  const lines = src.split('\n')
  const errors = []
  const warnings = []
  const blanksToDrop = [] // line indices (0-based) to delete for --fix

  // 1. Blank line between a `---` separator and a frontmatter block.
  //    Splits the YAML into a stray text slide (the "phantom slide" bug).
  for (let i = 0; i < lines.length; i++) {
    if (!isSep(lines[i])) continue
    let j = i + 1
    while (j < lines.length && lines[j].trim() === '') j++
    if (j === i + 1) continue // no blank line — already glued, fine
    if (!YAML_KEY.test(lines[j] || '')) continue // not frontmatter, real <hr>
    // confirm the block up to the next `---` is all YAML-ish
    let k = j
    while (k < lines.length && !isSep(lines[k])) k++
    const block = lines.slice(j, k)
    if (k < lines.length && block.every((l) => l.trim() === '' || YAML_KEY.test(l.trim()))) {
      errors.push(
        `line ${i + 1}: blank line after '---' separator splits frontmatter into a stray slide — ` +
          `glue '---' directly to '${lines[j].trim()}'`,
      )
      for (let b = i + 1; b < j; b++) blanksToDrop.push(b)
    }
  }

  // 2. <img src="/..."> under mdc:true becomes a JS import → slide-import-guard error.
  lines.forEach((l, idx) => {
    if (/<img[^>]+src=["']\/[^"']+["']/.test(l))
      warnings.push(
        `line ${idx + 1}: <img src="/..."> is rewritten to a JS import and trips slide-import-guard. ` +
          `Use a CSS background for public/ assets instead.`,
      )
  })

  let fixed = src
  if (FIX && blanksToDrop.length) {
    const drop = new Set(blanksToDrop)
    fixed = lines.filter((_, i) => !drop.has(i)).join('\n')
  }
  return { errors, warnings, fixed, fixable: blanksToDrop.length }
}

const original = readFileSync(FILE, 'utf8')
let { errors, warnings, fixed, fixable } = lint(original)

if (FIX && fixable) {
  writeFileSync(FILE, fixed)
  if (!QUIET)
    console.log(`🔧 fixed ${fixable} stray-frontmatter blank line(s) in ${basename(FILE)}`)
  // re-lint the fixed source so the report reflects reality
  ;({ errors, warnings } = lint(fixed))
}

// 3. Parser-based structural check: real slide count + leaked-frontmatter slides.
let data
try {
  data = await load(dirname(FILE), FILE)
} catch (e) {
  errors.push(`@slidev/parser failed to load deck: ${e.message}`)
}

if (data) {
  if (!QUIET) {
    console.log(`slides: ${data.slides.length}`)
    data.slides.forEach((s, i) => {
      const head = (s.title || (s.content || '').trim().split('\n')[0] || '(empty)').slice(0, 64)
      console.log(`  ${String(i + 1).padStart(2)}. ${head}`)
    })
  }
  data.slides.forEach((s, i) => {
    const c = (s.content || '').trim()
    if (c && c.split('\n').every((l) => l.trim() === '' || YAML_KEY.test(l.trim())))
      errors.push(
        `slide ${i + 1}: content is bare frontmatter keys ("${c.slice(0, 40)}…") — likely a stray slide`,
      )
  })
}

for (const w of warnings) console.log(`⚠️  ${w}`)
for (const e of errors) console.log(`❌ ${e}`)

if (errors.length) {
  console.log(
    `\n${errors.length} error(s)` + (FIX ? '' : ` — run with --fix to repair blank-line issues`),
  )
  process.exit(1)
}
console.log(`\n✓ deck structure OK${warnings.length ? ` (${warnings.length} warning(s))` : ''}`)
