// MIT No Attribution
// Copyright 2024, 2025 Shunsuke Kimura

#let conference-name = "制御部門マルチシンポジウム"
#import "@preview/jaconf:0.3.0": jaconf, definition, lemma, theorem, corollary, proof, appendix

#let mscs(
  title-ja: [日本語タイトル],
  title-en: [],
  authors-ja: [著者],
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
    title-ja: title-ja,
    title-en: title-en,
    authors-ja: authors-ja,
    authors-en: authors-en,
    abstract: abstract,
    keywords: keywords,
    // フォント名 Font family
    font-heading: font-gothic,
    font-main: font-mincho,
    font-latin: font-latin,
    // 見出し Headings
    heading-abstract: [*Abstract--* #h(0.5em)],
    heading-keywords: [*Key Words*: #h(1em)],
    heading-bibliography: [#h(1em)参考文献],
    heading-appendix: [#h(1em)付録],
    // フォントサイズ Font size
    font-size-title-ja: 18pt,
    // 補足語 Supplement
    supplement-image: [Fig.],
    supplement-table: [Table],
    supplement-separator: [ ],
  )
  body
}
