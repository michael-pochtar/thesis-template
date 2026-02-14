#import "@preview/glossarium:0.5.10": make-glossary, print-glossary, register-glossary, gls
#import "@preview/acrostiche:0.6.0": init-acronyms, print-index
#import "thm-helpers.typ": *

#let thm-thesis(
  title-en: [Title of the Thesis],
  title-de: [Titel der Thesis],
  lang: "en",
  abstract-en: [English abstract.],
  abstract-de: [Deutsche Zusammenfassung.],
  author-surname: [Mustermann],
  author-given-name: [Max],
  reviewers: ("Prof. A", "Prof. B"),
  advisors: ("C, M.Sc.", "D, M.Sc."),
  submission-date: datetime.today(),
  city: "Mannheim",
  faculty: "I",
  course-of-study: "IB",
  is-proposal: false,
  bibliography: none,
  glossary: none,
  acronyms: none,
  appendix: none,
  signature: none,
  body
) = {

  let is-en = lang == "en"
  let sans = "TeX Gyre Heros"
  let serif = "TeX Gyre Termes"

  let title = if is-en { title-en } else { title-de }

  let course-of-study = courses-of-study.at(course-of-study)
  let faculty = faculties.at(faculty)

  set page(paper: "a4")

  set text(size: 11pt, font: serif, lang: lang)

  let date-format = "[day].[month].[year]"

  set page(numbering: none)

  set enum(indent: 1em, spacing: 1em, numbering: (..n) => {
    let level = n.pos().len() - 1
    let pattern = "1a".at(level, default: "a")
    let suffix = ".)".at(level, default: ")")
    numbering(pattern, n.pos().last()) + suffix
  }, full: true)

  set list(indent: 1em, spacing: 1em, marker: ([•], [*–*]))

  set figure(gap: 1.5em)
  show figure.caption: set text(font: sans, size: 9pt)
  show figure.where(kind: table): set figure.caption(position: top)
  show figure: set block(breakable: true)
  // show table.cell.where(y: 0): set text(weight: "bold")
  set table(stroke: none, align: left)
  set table.hline(stroke: 0.8pt)

  set quote(block: true)
  show quote: set pad(x: 3em, top: -2em)

  page(
    margin: (right: 9.5%, top: 7.9%, left: 9.5%, bottom: 7.9%),
    [
      #image(height: 2.15cm, "images/thm-logo.svg")

      #set text(size: 14pt, font: sans)
      #set align(center)
      #set par(leading: 0.75em)

      #pad(
        top: 2.63em,
        bottom: 2.5em,
        left: 5em,
        right: 5em,
        text(font: sans, size: 17pt, hyphenate: false, strong(title))
      )

      #author-given-name #author-surname

      #if is-en {
          pad(top: 3.5em, [#course-of-study.type-en #if is-proposal [ Proposal ]])
          text(size: 11pt, [for the acquisition of the academic degree #course-of-study.degree])
          parbreak()
          [Course of Studies: #course-of-study.en]
      } else {
          pad(top: 3.5em, [#course-of-study.type-de #if is-proposal [ Exposé ]])
          text(size: 11pt, [zur Erlangung des akademischen Grades #course-of-study.degree])
          parbreak()
          [Studiengang #course-of-study.de]
      }

      #pad(top: 2em, bottom: 2em, [
        #if is-en { faculty.en } else { faculty.de }
        #parbreak()
        #if is-en { institute.en } else { institute.de }
      ])

      #submission-date.display(date-format)

      #place(bottom + center, {
        if is-en [Supervisors] else [Betreuer]
        parbreak()

        for reviewer in reviewers {
          reviewer
          parbreak()
        }

        for advisor in advisors {
          advisor
          parbreak()
        }
      })
    ],
  )

  if not is-proposal {
    page[
      *#author-surname, #author-given-name*:
      #parbreak()
      #title-de / #author-given-name #author-surname. --
      #parbreak()
      #course-of-study.type-de, #city: #institute.de, #submission-date.year(). #context counter(page).final().first() Seiten.

      #v(3em)

      *#author-surname, #author-given-name*:
      #parbreak()
      #title-en / #author-given-name #author-surname. --
      #parbreak()
      #course-of-study.type-en, #city: #institute.en, #submission-date.year(). #context counter(page).final().first() pages.

      #if not is-en {
        place(bottom, [
          Um die Lesbarkeit zu vereinfachen, wird auf die zusätzliche Formulierung der weiblichen Form bei Personenbezeichnungen verzichtet.
          Ich weise deshalb darauf hin, dass die Verwendung der männlichen Form explizit als geschlechtsunabhängig verstanden werden soll.
        ])
      }
    ]

    page[
      /*
      #let declaration-ai = if is-en [Declaration on Generative AI] else [Erklärung zum Einsatz generativer KI]
      #text(size: 20pt, font: sans, strong(declaration-ai))

      #if is-en [
        During the preparation of this work, the authors used ChatGPT and Grammarly in order to perform grammar and
        spelling checks as well as paraphrasing and rewording. After using these tools, the authors reviewed and edited
        the content as needed and take full responsibility for the publication’s content.
      ] else [
        Während der Erstellung dieser Arbeit wurden ChatGPT und Grammarly zur Unterstützung bei der Grammatik- und
        Rechtschreibprüfung sowie zum Paraphrasieren und Umformulieren von Textpassagen verwendet. Nach der Nutzung
        dieser Werkzeuge wurden die Inhalte eigenständig überprüft und bei Bedarf angepasst. Die Verantwortung für
        den Inhalt dieser Arbeit liegt vollständig bei den Autoren.
      ]
      */

      #let declaration = if is-en [Declaration] else [Erklärung]
      #text(size: 20pt, font: sans, strong(declaration))

      #if is-en [
        I confirm that the submitted thesis is original work and was written by me without further assistance. Appropriate credit has been given where reference has been made to the work of others.
      ] else [
        Hiermit erkläre ich, dass ich die vorliegende Arbeit selbstständig verfasst und keine anderen als die angegebenen Quellen und Hilfsmittel benutzt habe.
      ]

      #pad(
        [#city, #submission-date.display(date-format)],
        top: 0.5cm,
        bottom: 0.25cm,
      )

      #if signature != none {
        block(signature, width: 4cm)
      }

      #author-given-name #author-surname

      #place(bottom, [
        #if is-en [
          I agree that my work may be published, i.e. that the work may be stored electronically, converted into other formats,
          made publicly available on the servers of the #institute.en and distributed via the Internet.
        ] else [
          Ich bin damit einverstanden, dass meine Arbeit veröffentlicht wird, d. h. dass die Arbeit elektronisch gespeichert,
          in andere Formate konvertiert, auf den Servern der #institute.de öffentlich zugänglich gemacht
          und über das Internet verbreitet werden darf.
        ]

        #v(1em)
        #grid(
          columns: (2fr, 1fr),
          align(top, [
            #if is-en [
              This work is licensed under a #link("https://creativecommons.org/licenses/by-sa/4.0/")[Creative Commons Attribution-ShareAlike 4.0 International License].
            ] else [
              Dieses Werk ist lizenziert unter einer #link("https://creativecommons.org/licenses/by-sa/4.0/")[Creative Commons Namensnennung -- Weitergabe unter gleichen Bedingungen 4.0 International Lizenz].
            ]
          ]),
          align(right, image("images/by-sa.svg", width: 100%)),
        )
      ])
    ]
  }

  set par(justify: true)

  set page(numbering: "i")

  show heading: h => {
    text(font: sans, strong(h))
  }
  show heading.where(level: 1): h => {
    pagebreak(weak: true)
    pad(top: 5em, bottom: 1em, text(size: 22pt, h))
  }

  show heading.where(level: 2): h => pad(bottom: 1em, top: 1em, text(size: 15pt, h))
  show heading.where(level: 3): h => pad(bottom: 1em, h)
  show heading.where(level: 4): h => text(font: sans, h.body)

  if acronyms != none {
    init-acronyms(acronyms)
  }

  if not is-proposal {
    text(size: 20pt, font: sans, strong([Abstrakt]))
    v(1em)
    text(size: 12pt, font: sans, strong(emph(title-de)))
    v(1em)
    abstract-de

    v(2em)

    text(size: 20pt, font: sans, strong([Abstract]))
    v(1em)
    text(size: 12pt, font: sans, strong(emph(title-en)))
    v(1em)
    abstract-en
  }

  show outline.entry.where(level: 1): it => link(
    it.element.location(),
    pad(
      top: 0.5em,
      text(font: sans, weight: "bold", it.indented(it.prefix(), [#it.body() #h(1fr) #it.page()], gap: 1em))
    ),
  )

  outline(indent: auto, depth: 3)

  if acronyms != none {
    context {
      let lang = text.lang
      let title = if lang == "de" [Abkürzungsverzeichnis] else [Acronyms Index]
      print-index(delimiter: "", title: title, clickable: false, row-gutter: 1em, outlined: true)
    }
  }

  show outline.entry: it => link(
      it.element.location(),
      it.indented(it.prefix(), it.inner()),
  )
  show outline: set heading(outlined: true)

  context {
    if counter(figure.where(kind: image)).final().at(0) > 0 {
      let title = if lang == "de" [Abbildungsverzeichnis] else [List of Figures]
      outline(indent: auto, title: title, target: figure.where(kind: image))
    }
  }

  context {
    if counter(figure.where(kind: table)).final().at(0) > 0 {
      let title = if lang == "de" [Tabellenverzeichnis] else [List of Tables]
      outline(indent: auto, title: title, target: figure.where(kind: table))
    }
  }

  // TODO: Symbolverzeichnis

  context {
    if counter(figure.where(kind: raw)).final().at(0) > 0 {
      let title = if lang == "de" [Quellcodeverzeichnis] else [List of Listings]
      outline(indent: auto, title: title, target: figure.where(kind: raw))
    }
  }

  let supplement = if is-en [Chapter] else [Kapitel]
  set heading(numbering: "1.1", supplement: supplement)

  set page(
    header: [
      #context {
        let current-page = here().page()
        let headings-on-page = query(heading)
          .filter(h => h.level < 3 and h.location().page() == current-page)
          .sorted(key: h => h.level)
        let headings-before-page = query(heading)
          .filter(h => h.level < 3 and h.location().page() < current-page)

        let h = none
        if headings-on-page.len() > 0 {
          h = headings-on-page.first()
        } else if headings-before-page.len() > 0 {
          h = headings-before-page.last()
        }

        set align(center)

        if h != none and h.level != 1 {
          if h.numbering != none {
            emph(numbering(h.numbering, ..counter(heading).at(h.location())))
          }

          [ #emph(h.body)]
          v(-0.75em)
          line(length: 100%, stroke: 0.5pt)
        }
      }
    ],
  )

  if glossary != none {
    show: make-glossary
    register-glossary(glossary)
  }

  context {
    let page-number = here().page() - 1

    set page(numbering: "1")
    // counter(page).update(1)

    body

    set page(numbering: "i")
    // counter(page).update(page-number)
  }

  set heading(numbering: none)

  if glossary != none {
    pagebreak(weak: true)
    [= Glossar]
    print-glossary(glossary)
  }

  bibliography

  counter(heading).update(0)
  let supplement = if is-en [Appendix] else [Anhang]
  set heading(numbering: "A.1", supplement: supplement)

  if appendix != none {
    [#appendix]
  }
}
