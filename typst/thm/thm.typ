#import "@preview/glossarium:0.5.9": make-glossary, print-glossary, register-glossary
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
  is-proposal: true,
  bibliography: none,
  glossary: none,
  acronyms: none,
  body
) = {

  let is-en = lang == "en"
  let sans = "TeX Gyre Heros"
  let serif = "TeX Gyre Termes"

  let title = if is-en { title-en } else { title-de }

  let course-of-study = courses-of-study.at(course-of-study)
  let faculty = faculties.at(faculty)

  set page(paper: "a4")

  set text(size: 12pt, font: serif, lang: lang)

  let date-format = "[day].[month].[year]"

  set page(numbering: none)

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

      #if is-proposal {
        pad(top: 3.5em, [#course-of-study.type-en Proposal])
      } else {
        if is-en {
          pad(top: 3.5em, course-of-study.type-en)
          text(size: 11pt, [for the acquisition of the academic degree #course-of-study.degree])
          parbreak()
          [Course of Studies: #course-of-study.en]
        } else {
          pad(top: 3.5em, course-of-study.type-de)
          text(size: 11pt, [zur Erlangung des akademischen Grades #course-of-study.degree])
          parbreak()
          [Studiengang #course-of-study.de]
        }
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

      #place(bottom, [
        Um die Lesbarkeit zu vereinfachen, wird auf die zusätzliche Formulierung der weiblichen Form bei Personenbezeichnungen verzichtet.
        Ich weise deshalb darauf hin, dass die Verwendung der männlichen Form explizit als geschlechtsunabhängig verstanden werden soll.
      ])
    ]

    page[
      #text(size: 20pt, font: sans, strong([Erklärung]))

      Hiermit erkläre ich, dass ich die vorliegende Arbeit selbstständig verfasst und keine anderen als die angegebenen Quellen und Hilfsmittel benutzt habe.

      #city, #submission-date.display(date-format)

      #place(bottom, [
        Ich bin damit einverstanden, dass meine Arbeit veröffentlicht wird, d. h. dass die Arbeit elektronisch gespeichert,
        in andere Formate konvertiert, auf den Servern der Technischen Hochschule Mannheim öffentlich zugänglich gemacht
        und über das Internet verbreitet werden darf.
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
    // text(size: 22pt, h)
    pad(top: 5em, bottom: 1em, text(size: 22pt, h))
  }

  // show heading.where(level: 2): h => pad(bottom: 0.5em, text(size: 15pt, h))
  // show heading.where(level: 3): h => pad(bottom: 1em, h)
  // show heading.where(level: 4): h => text(font: sans, h.body)

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
    init-acronyms(acronyms)
    print-index(delimiter: "", title: "Abkürzungsverzeichnis", clickable: false, row-gutter: 1em, outlined: true)
  }

  set heading(numbering: "1.1")

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
}
