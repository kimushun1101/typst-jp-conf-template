#let font-size-default = 10pt
#let font-size-heading = 11pt

#let rsj-conf(
  title-ja: [日本語タイトル],
  title-en: [],
  authors-ja: [著者],
  authors-en: [],
  abstract: none,
  keywords: (),
  font-gothic: "BIZ UDPGothic",
  font-mincho: "BIZ UDPMincho",
  font-latin: "New Computer Modern",
  body
) = {
  // Set document metadata.
  set document(title: title-ja)

  // Configure the page.
  set page(
    paper: "a4",
    margin: (top: 20mm, bottom: 27mm, x: 20mm)
  )
  set text(size: font-size-default, lang: "ja", font: font-mincho)
  set par(leading: 0.55em, first-line-indent: 1em, justify: true, spacing: 0.55em)
  show "、": "，"
  show "。": "．"

  // Configure equation numbering and spacing.
  set math.equation(numbering: "(1)")
  show math.equation: set block(spacing: 0.55em)

  // Configure appearance of equation references
  // See https://typst.app/docs/reference/model/ref/
  show ref: it => {
    if it.element != none and it.element.func() == math.equation {
      link(it.element.location(), numbering(
        it.element.numbering,
        ..counter(math.equation).at(it.element.location())
      ))
    } else {
      it
    }
  }

  // Configure lists.
  set enum(indent: font-size-default)
  set list(indent: font-size-default)

  // Configure headings.
  set heading(numbering: "1.")
  show heading: it => {
    // Find out the final number of the heading counter.
    let levels = counter(heading).get()
    if it.level == 1 [
      // We don't want to number of the acknowledgment section.
      #set par(first-line-indent: 0pt)
      #set text(font-size-heading, font: font-gothic)
      #v(10pt)
      #if it.numbering != none and not it.body in ([謝辞], [Acknowledgment], [Acknowledgement]) {
        numbering(it.numbering, ..levels)
        h(5pt)
      }
      #it.body
    ] else [
      // The other level headings are run-ins.
      #set par(first-line-indent: 0pt)
      #set text(font-size-default, weight: 400)
      #v(5pt)
      #if it.numbering != none {
        numbering(it.numbering, ..levels)
        h(8pt, weak: true)
      }
      #it.body
    ]
  }

  show figure.where(kind: table): set figure(placement: top, supplement: [表])
  show figure.where(kind: table): set figure.caption(position: top, separator: [ ])
  show figure.where(kind: image): set figure(placement: top, supplement: [図])
  show figure.where(kind: image): set figure.caption(position: bottom, separator: [ ])

  // Display the paper's title.
  align(center, text(18pt, title-ja, weight: "bold", font: font-gothic))
  v(2em, weak: true)

  // Display the authors list.
  align(center, text(12pt, authors-ja, font: font-mincho))
  v(2em, weak: true)

  // Display abstract and index terms.
  if abstract != none {
    grid(
      columns: (0.7cm, 1fr, 0.7cm),
      [],
      [
        #set text(font-size-default, font: font-latin)
        #h(1em) #abstract
      ],
      []
    )
    v(1em, weak: false)
  }

  // Start two column mode and configure paragraph properties.
  show: columns.with(2, gutter: 8mm)

  // Configure Bibliography.
  set bibliography(title: align(center, text(font-size-heading)[参　考　文　献]), style: "rsj-conf.csl")
  show bibliography: it => [
    #set text(9pt, lang: "en", font: font-mincho)
    #show regex("[0-9a-zA-Z]"): set text(font: font-latin)
    #it
  ]

  // Display the paper's contents.
  body
}

#let appendix(font-gothic: "Noto Sans CJK JP", body) = {
  set heading(numbering: "A.1", supplement: [付録])
  counter(heading).update(0)
  counter(figure.where(kind: image)).update(0)
  counter(figure.where(kind: table)).update(0)
  set figure(numbering: it => {
    [#numbering("A", counter(heading).get().at(0)).#it]
  })
  v(20pt, weak: true)
  text(font-size-heading, font: font-gothic, weight: "bold")[付　　録]
  body
}