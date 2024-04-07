// Workaround for the lack of an `std` scope.
#let std-bibliography = bibliography

#let rengo(
  title: [タイトル],
  authors: [著者],
  etitle: "", 
  eauthors: "",
  abstract: none,
  keywords: (),
  bibliography: none,
  body
) = {
  // Set document metadata.
  set document(title: title)

  // Set the Fonts
  let gothic = ("MS PGothic", "Hiragino Kaku Gothic Pro", "IPAexGothic", "Noto Sans CJK JP")
  let mincho = ("MS PMincho", "Hiragino Mincho Pro", "IPAexMincho", "Noto Serif CJK JP")
  let english = ("Times New Roman", "New Computer Modern")

  // Configure the page.
  set page(
    paper: "a4",
    margin: (top: 20mm, bottom: 27mm, x: 20mm)
  )
  set text(size: 10pt, font: mincho)
  // show regex("[0-9a-zA-Z]"): set text(font: "New Computer Modern Math")
  set par(leading: 0.55em, first-line-indent: 1em, justify: true)
  show par: set block(spacing: 0.55em)

  // Configure equation numbering and spacing.
  set math.equation(numbering: "(1)")
  show math.equation: set block(spacing: 0.55em)

  // Configure appearance of equation references
  show ref: it => {
    if it.element != none and it.element.func() == math.equation {
      // Override equation references.
      link(it.element.location(), numbering(
        it.element.numbering,
        ..counter(math.equation).at(it.element.location())
      ))
    } else {
      // Other references as usual.
      it
    }
  }

  // Configure lists.
  set enum(indent: 10pt, body-indent: 9pt)
  set list(indent: 10pt, body-indent: 9pt)

  // Configure headings.
  set heading(numbering: "1.")
  show heading: it => locate(loc => {
    // Find out the final number of the heading counter.
    let levels = counter(heading).at(loc)
    let deepest = if levels != () {
      levels.last()
    } else {
      1
    }
    if it.level == 1 [
      // First-level headings are centered smallcaps.
      // We don't want to number of the acknowledgment section.
      #set par(first-line-indent: 0pt)
      #let is-ack = it.body in ([謝辞], [Acknowledgment], [Acknowledgement])
      #set text(if is-ack { 11pt } else { 11pt }, font: gothic)
      #v(20pt, weak: true)
      #if it.numbering != none and not is-ack {
        numbering("1.", ..levels)
        h(8pt, weak: true)
      }
      #it.body
      #v(13.75pt, weak: true)
    ] else [
      // The other level headings are run-ins.
      #set par(first-line-indent: 0pt)
      #set text(10pt, weight: 400)
      #v(10pt, weak: true)
      #if it.numbering != none {
        numbering("1.", ..levels)
        h(8pt, weak: true)
      }
      #it.body
      #v(10pt, weak: true)
    ]
  })

  // Configure figures.
  show figure.where(kind: table): set figure(placement: top, supplement: [Table])
  show figure.where(kind: table): set figure.caption(position: top, separator: [: ])
  show figure.where(kind: image): set figure(placement: top, supplement: [Fig.])
  show figure.where(kind: image): set figure.caption(position: bottom, separator: [: ])

  // Display the paper's title.
  align(center, text(16pt, title, weight: "bold", font: gothic))
  v(18pt, weak: true)

  // Display the authors list.
  align(center, text(12pt, authors, font: mincho))
  v(1.5em, weak: true)

  // Display the paper's title in English.
  align(center, text(12pt, etitle, weight: "bold", font: english))
  v(1.5em, weak: true)

  // Display the authors list in English.
  align(center, text(12pt, eauthors, font: english))
  v(1.5em, weak: true)

  // Display abstract and index terms.
  if abstract != none {
    grid(
      columns: (0.7cm, 1fr, 0.7cm),
      [],
      [
        #set text(10pt, font: english)
        #set par(first-line-indent: 0pt)
        *Abstract:* #h(0.5em) #abstract
        #v(1em)
        *Keywords:* #keywords.join(", ")
      ],
      []
    )
    v(1em, weak: false)
  }

  // Start two column mode and configure paragraph properties.
  show: columns.with(2, gutter: 8mm)

  // Display the paper's contents.
  body

  // Display bibliography.
  if bibliography != none {
    show std-bibliography: set text(9pt)
    show regex("[0-9a-zA-Z]"): set text(font: english)
    set std-bibliography(title:  align(center, text(11pt)[参　考　文　献]), style: "rengo.csl")
    bibliography
  }
}