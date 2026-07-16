import { defineShikiSetup } from '@slidev/types'

// Deck-wide syntax highlighting: cool blues with a purple accent, on white.
// Anchored to the nix-logo-blue swatch (pages/00-theme.md) but with a wider
// tonal spread for contrast: ink text, vivid-blue keywords, teal strings,
// indigo functions, purple operators/params, slate punctuation, sky comments.
const nixLight = {
  name: 'nix-light',
  type: 'light' as const,
  colors: {
    'editor.background': '#ffffff',
    'editor.foreground': '#0D1B2E',
  },
  settings: [
    { settings: { foreground: '#0D1B2E', background: '#ffffff' } },
    { scope: ['comment', 'punctuation.definition.comment'], settings: { foreground: '#94b0d0' } },
    {
      scope: ['string', 'string.quoted', 'string.interpolated', 'string.unquoted'],
      settings: { foreground: '#0e7490' },
    },
    {
      scope: ['keyword', 'keyword.control', 'storage', 'storage.type', 'constant.language'],
      settings: { foreground: '#2563eb', fontStyle: 'bold' },
    },
    {
      scope: ['keyword.operator', 'punctuation.separator.key-value'],
      settings: { foreground: '#7c3aed' },
    },
    {
      scope: ['constant.numeric', 'constant.other', 'variable.other.constant'],
      settings: { foreground: '#9333ea' },
    },
    {
      scope: ['variable.parameter', 'meta.function.parameters'],
      settings: { foreground: '#7c3aed', fontStyle: 'italic' },
    },
    {
      scope: ['entity.name.function', 'support.function', 'meta.function-call'],
      settings: { foreground: '#4f46e5' },
    },
    {
      scope: ['entity.name.type', 'entity.name.tag', 'support.class'],
      settings: { foreground: '#4f46e5' },
    },
    {
      scope: [
        'support.type.property-name',
        'entity.other.attribute-name',
        'variable.other.property',
        'meta.attribute',
      ],
      settings: { foreground: '#2563eb' },
    },
    {
      scope: ['variable', 'variable.other'],
      settings: { foreground: '#1e40af' },
    },
    {
      scope: ['punctuation', 'meta.brace', 'punctuation.separator'],
      settings: { foreground: '#64748b' },
    },
  ],
}

export default defineShikiSetup(() => {
  return {
    themes: {
      dark: nixLight,
      light: nixLight,
    },
  }
})
