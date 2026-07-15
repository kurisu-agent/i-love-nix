import { defineMermaidSetup } from '@slidev/types'

// One dark theme for every mermaid chart in the deck.
// Palette matches the hand-built diagrams and StepGuide: slate nodes, indigo
// borders, gray lines. Self-contained colors → readable on light slides too.
// NOTE: setup/mermaid-renderer.ts imports this config and force-applies it —
// Slidev otherwise overrides `theme` per color scheme, discarding themeVariables.
export const MERMAID_CONFIG = {
  theme: 'base',
  themeVariables: {
    primaryColor: '#1e293b', // node fill (slate-800)
    primaryBorderColor: '#818cf8', // node border (indigo-400)
    primaryTextColor: '#e2e8f0', // node text (slate-200)
    textColor: '#e2e8f0', // loose labels (slate-200)
    lineColor: '#94a3b8', // edges (slate-400)
    secondaryColor: '#312e81', // decision nodes etc. (indigo-900)
    tertiaryColor: '#0f172a', // subgraph tint (slate-900)
    edgeLabelBackground: '#334155', // edge label chip (slate-700)
    clusterBkg: 'transparent',
    clusterBorder: '#6366f1', // subgraph border (indigo-500)
    fontFamily: '"Noto Sans", ui-sans-serif, system-ui, sans-serif',
    fontSize: '15px',
  },
  // Edge labels get breathing room via box-shadow (padding would desync
  // mermaid's pre-computed label boxes) — needs foreignObject overflow.
  // NB: the shadow goes on the <p> (the text box); its parent span.edgeLabel
  // is a zero-width inline box and would paint the ring as a vertical bar.
  themeCSS: `
    foreignObject { overflow: visible; }
    .edgeLabel, .edgeLabel p { background: transparent; }
    .edgeLabel p { border-radius: 4px; background: #334155; box-shadow: 0 0 0 6px #334155; }
    .node rect, .cluster rect { rx: 6px; ry: 6px; }
    .cluster-label, .cluster-label span { color: #94a3b8; fill: #94a3b8; }
  `,
} as const

export default defineMermaidSetup(() => MERMAID_CONFIG)
