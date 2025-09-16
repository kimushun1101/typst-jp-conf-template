// MIT No Attribution
// Copyright 2024, 2025 Shunsuke Kimura

#let conference-name = "自動制御連合講演会"
#import "@preview/jaconf:0.5.1": jaconf, definition, lemma, theorem, corollary, proof, appendix

#let rengo(
  title: [日本語タイトル],
  title-en: [],
  authors: [著者],
  authors-en: [],
  abstract: none,
  keywords: (),
  font-gothic: "Noto Sans CJK JP",
  font-mincho: "Noto Serif CJK JP",
  font-latin: "New Computer Modern",
  body
) = {
  show: jaconf.with(
    // 基本 Basic
    title: title,
    title-en: title-en,
    authors: authors,
    authors-en: authors-en,
    abstract: abstract,
    keywords: keywords,
    // フォント名 Font family
    font-heading: font-gothic,
    font-main: font-mincho,
    font-latin: font-latin,
    // 外観 Appearance
    spacing-heading: 1.5em,
    bibliography-style: bytes(read("rengo.csl")),
    abstract-language: "en",  // "ja" or "en"
    // 見出し Headings
    heading-abstract: [*Abstract:*],
    heading-keywords: [*Keywords*:],
    heading-bibliography: [参考文献],
    heading-appendix: [付録],
    // フォントサイズ Font size
    font-size-heading: 10pt,
    font-size-bibliography: 10pt,
    // 補足語 Supplement
    supplement-image: [Fig.],
    supplement-table: [Table],
  )
  body
}
