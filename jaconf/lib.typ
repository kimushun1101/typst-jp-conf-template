#let spacing-size-heading = 12pt
#let appendix-numbering = "A.1"

// import third-party packages
#import "@preview/codly:1.3.0": codly-init
#import "@preview/ctheorems:1.1.3": thmplain, thmproof, thmrules

// Theorem environments
#let thmja = thmplain.with(base: {}, separator: [#h(0.5em)], titlefmt: strong, inset: (top: 0em, left: 0em))
#let definition = thmja("definition", context{text(font: query(<gothic-font>).first().value)[定義]})
#let lemma = thmja("lemma", context{text(font: query(<gothic-font>).first().value)[補題]})
#let theorem = thmja("theorem", context{text(font: query(<gothic-font>).first().value)[定理]})
#let corollary = thmja("corollary", context{text(font: query(<gothic-font>).first().value)[系]})
#let proof = thmproof("proof", context{text(font: query(<gothic-font>).first().value)[証明]}, separator: [#h(0.9em)], titlefmt: strong, inset: (top: 0em, left: 0em))

#let jaconf(
  // basic settings
  title-ja: [日本語タイトル],
  title-en: [],
  authors-ja: [著者],
  authors-en: [],
  abstract: none,
  keywords: (),
  // font family
  font-gothic: "Noto Sans CJK JP",
  font-mincho: "Noto Serif CJK JP",
  font-latin: "New Computer Modern",
  font-math: "New Computer Modern Math",
  // appearance
  paper-columns: 2,
  page-number: none, // "- 1/1 -"
  margin-top: 20mm,
  margin-bottom: 27mm,
  margin-side: 20mm,
  column-gutter: 4%+0pt,
  bibliography-style: "sice.csl",
  // headings
  heading-abstract: [*Abstract--*],
  heading-keywords: [*Key Words*: ],
  heading-bibliography: [参考文献],
  heading-appendix: [付録],
  // font size
  font-size-title-ja: 16pt,
  font-size-title-en: 12pt,
  font-size-authors-ja: 12pt,
  font-size-authors-en: 12pt,
  font-size-abstract: 10pt,
  font-size-heading: 11pt,
  font-size-main: 10pt,
  font-size-bibliography: 9pt,
  // supplement
  supplement-image: [図],
  supplement-table: [表],
  supplement-separater: [: ],
  // numbering
  numbering-headings: "1.1",
  numbering-equation: "(1)",
  // main content
  body
) = {
  // Set metadata.
  [#metadata(font-gothic) <gothic-font>]
  [#metadata(font-size-heading) <heading-font-size>]
  [#metadata(heading-appendix) <appendix-heading>]

  // Enable packages.
  show: thmrules.with(qed-symbol: $square$)
  show: codly-init.with()

  // Set document metadata.
  set document(title: title-ja)

  // Configure the page.
  set page(
    paper: "a4",
    margin: (top: margin-top, bottom: margin-bottom, x: margin-side),
    numbering: page-number
  )
  set text(font-size-main, font: font-mincho)
  set par(leading: 0.5em, first-line-indent: 1em, justify: true, spacing: 0.6em)

  // Configure equations.
  set math.equation(numbering: numbering-equation)
  show math.equation: it => {
    set text(font: font-math)
    it
  }

  // Configure appearance of references
  show ref: it => {
    // Equation -> (n).
    // See https://typst.app/docs/reference/model/ref/
    let eq = math.equation
    let el = it.element
    if el != none and el.func() == eq {
      link(el.location(), numbering(
        el.numbering,
        ..counter(eq).at(el.location())
      ))
    }
    // Sections -> n章m節l項.
    // Appendix -> 付録A.
    else if el != none and el.func() == heading {
      let sec-cnt = counter(heading).at(el.location())
      if el.numbering != appendix-numbering {
        if el.depth == 1 {
          link(el.location(), [#sec-cnt.at(0)章])
        } else if el.depth == 2{
          link(el.location(), [#sec-cnt.at(0)章#sec-cnt.at(1)節])
        } else if el.depth == 3{
          link(el.location(), [#sec-cnt.at(0)章#sec-cnt.at(1)節#sec-cnt.at(2)項])
        }
      } else {
        link(el.location(), [
          付録#numbering(el.numbering, ..sec-cnt)
        ])
      }
    } else {
      it
    }
  }

  // Configure lists.
  set enum(indent: 1em)
  set list(indent: 1em)

  // Configure headings.
  set heading(numbering: numbering-headings)
  show heading: it => {
    set par(first-line-indent: 0em, spacing: spacing-size-heading)
    let levels = counter(heading).get()
    if it.level == 1 {
      set text(font-size-heading, font: font-gothic)
      // Acknowledgment sections are not numbered.
      if it.numbering != none and not it.body in ([謝辞], [Acknowledgment], [Acknowledgement]) {
        numbering(it.numbering, ..levels)
        h(1em)
      }
      it.body
    } else {
      set text(font-size-main, font: font-gothic)
      if it.numbering != none {
        numbering(it.numbering, ..levels)
        h(1em)
      }
      it.body
    }
  }

  // Configure figures.
  show figure.where(kind: table): set figure(placement: top, supplement: supplement-table)
  show figure.where(kind: table): set figure.caption(position: top, separator: supplement-separater)
  show figure.where(kind: image): set figure(placement: top, supplement: supplement-image)
  show figure.where(kind: image): set figure.caption(position: bottom, separator: supplement-separater)

  // Display the paper's title.
  align(center, text(font-size-title-ja, title-ja, weight: "bold", font: font-gothic))
  v(18pt, weak: true)

  // Display the authors list.
  align(center, text(font-size-authors-ja, authors-ja, font: font-mincho))
  v(1.5em, weak: true)

  // Display the paper's title in English.
  align(center, text(font-size-title-en, title-en, weight: "bold", font: font-latin))
  v(1.5em, weak: true)

  // Display the authors list in English.
  align(center, text(font-size-authors-en, authors-en, font: font-latin))
  v(1.5em, weak: true)

  // Display abstract and index terms.
  if abstract != none {
    grid(
      columns: (0.7cm, 1fr, 0.7cm),
      [],
      {
        set text(font-size-abstract, font: font-latin)
        set par(first-line-indent: 0em)
        heading-abstract
        h(0.5em)
        abstract
        if keywords != () {
          v(1em)
          heading-keywords
          h(0.5em)
          keywords.join(", ")
        }
      },
      []
    )
    v(1em, weak: false)
  }

  // Start two column mode and configure paragraph properties.
  show: columns.with(paper-columns, gutter: column-gutter)

  // Configure Bibliography.
  set bibliography(title: text(size: font-size-heading, heading-bibliography), style: bibliography-style)
  show bibliography: it => {
    set text(9pt, font: font-mincho)
    show regex("[0-9a-zA-Z]"): set text(font: font-latin)
    it
  }

  // Display the paper's contents.
  body
}

// Appendix
#let appendix(body) = {
  set heading(numbering: appendix-numbering)
  counter(heading).update(0)
  counter(figure.where(kind: image)).update(0)
  counter(figure.where(kind: table)).update(0)
  set figure(numbering: it => {
    [#numbering("A", counter(heading).get().at(0)).#it]
  })
  v(spacing-size-heading)
  context{
    text(
      size: query(<heading-font-size>).first().value,
      font: query(<gothic-font>).first().value,
      weight: "bold",
      query(<appendix-heading>).first().value)
  }
  body
}
