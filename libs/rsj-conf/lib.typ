// MIT No Attribution
// Copyright 2024, 2025 Shunsuke Kimura

#let conference-name = "日本ロボット学会学術講演会"
#import "@preview/jaconf:0.5.0": jaconf, definition, lemma, theorem, corollary, proof, appendix as jaconf-appendix

#let rsj-conf(
  title: [日本語タイトル],
  title-en: [],
  authors: [著者],
  authors-en: [],
  abstract: none,
  keywords: (),
  font-gothic: "Noto Sans CJK JP",
  font-mincho: "Noto Serif CJK JP",
  font-latin: "New Computer Modern",
  abstract-language: "en",
  body
) = {
  show: jaconf.with(
    // 基本 Basic
    title: title,
    title-en: title-en,
    authors: authors,
    authors-en: authors-en,
    abstract: abstract,
    keywords: (),
    // フォント名 Font family
    font-heading: font-gothic,
    font-main: font-mincho,
    font-latin: font-latin,
    // 外観 Appearance
    spacing-heading: 10pt,
    bibliography-style: "rsj.csl",  // "sice.csl", "rsj.csl", "ieee", etc.
    abstract-language: abstract-language,
    // 見出し Headings
    heading-abstract: [#h(1em)],
    heading-bibliography: [#align(center, [参　考　文　献])],
    heading-appendix: [#align(center, [付　録])],
    // フォントサイズ Font size
    // font-size-heading: 10pt,
    font-size-bibliography: 10pt,
    // 補足語 Supplement
    supplement-image: [図],
    supplement-table: [表],
    supplement-separator: [　],
    // 番号付け Numbering
    numbering-headings: "1.1.",
    numbering-appendix: "A.1.",  // #show: appendix.with(numbering-appendix: "A.1") の呼び出しにも同じ引数を与えてください。
  )
  body
}

#let appendix(body) = {
  jaconf-appendix(numbering-appendix: "A.1.", body)
}
