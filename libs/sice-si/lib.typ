// MIT No Attribution
// Copyright 2024, 2025 Shunsuke Kimura

#let conference-name = "SICE SI部門講演会"
#import "@preview/jaconf:0.5.1": jaconf, definition, lemma, theorem, corollary, proof, appendix

#let sice-si(
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
    paper-margin: (top: 20mm, bottom: 27mm, x: 15mm),
    paper-columns: 2,  // 1: single column, 2: double column
    page-number: none,  // e.g. "1/1"
    column-gutter: 4%+0pt,
    spacing-heading: 0.5em,
    front-matter-order: ("title", "authors", "title-en", "authors-en", "abstract", "keywords"),  // 独自コンテンツの追加も可能
    front-matter-spacing: 1.5em,
    front-matter-margin: 2.0em,
    abstract-language: "en",  // "ja" or "en"
    bibliography-style: bytes(read("sice-si.csl")),  // "sice.csl", "rsj.csl", "ieee", etc.
    // 見出し Headings
    heading-abstract: [Abstract:],
    heading-bibliography: [参考文献],
    heading-appendix: [付録],
    // フォントサイズ Font size
    font-size-title: 16pt,
    font-size-title-en: 12pt,
    font-size-authors: 12pt,
    font-size-authors-en: 12pt,
    font-size-abstract: 9pt,
    font-size-heading: 12pt,
    font-size-main: 10pt,
    font-size-bibliography: 9pt,
    // 補足語 Supplement
    supplement-image: [Fig.],
    supplement-table: [Table],
    supplement-separator: [　],
    // 番号付け Numbering
    numbering-headings: "1.",
    numbering-equation: "(1)",
    numbering-appendix: "A.1",  // #show: appendix.with(numbering-appendix: "A.1") の呼び出しにも同じ引数を与えてください。
  )
  body
}
