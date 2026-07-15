import { defineMermaidRendererSetup } from '@slidev/types'
// @ts-expect-error mermaid ships no types for the ESM dist entry
import mermaid from 'mermaid/dist/mermaid.esm.mjs'
import { MERMAID_CONFIG } from './mermaid'

// Custom renderer so MERMAID_CONFIG wins over Slidev's per-scheme override
// (Slidev injects theme:'dark' in dark mode *after* the mermaid setup, which
// would silently discard our themeVariables). Charts render identically in
// light and dark — self-contained colors, readable on both backgrounds.
export default defineMermaidRendererSetup(() => {
  let counter = 0
  return async (code: string, options: Record<string, unknown>) => {
    mermaid.initialize({
      startOnLoad: false,
      ...options,
      ...MERMAID_CONFIG,
    })
    // Render inside Slidev's on-DOM container — without it, label sizes are
    // measured against a detached element and edge-label chips come out wrong.
    const container = document.getElementById('mermaid-rendering-container') ?? undefined
    const { svg } = await mermaid.render(`deck-mermaid-${counter++}`, code, container)
    return svg
  }
})
