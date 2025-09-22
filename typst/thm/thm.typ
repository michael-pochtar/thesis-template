#import "@preview/glossarium:0.5.9": make-glossary, print-glossary, register-glossary

#let thm-thesis(
  title: [Title of the Thesis],
  thesis-type: "Master's thesis/Bachelor's thesis",
  lang: "en",
  region: none,
  english-abstract: [English abstract.],
  german-abstract: [Deutsche Zusammenfassung.],
  author: [My Name],
  reviewer: "Prof. A",
  advisors: ("C, M.Sc.", "D, M.Sc."),
  start-date: datetime.today() - duration(weeks: 16),
  end-date: datetime.today(),
  include-declaration: true,
  declaration-date: datetime.today(),
  declaration-city: "Mannheim",
  bibliography: none,
  glossary: none,
  body
) = {

  let is-en = lang == "en"
  let sans = "TeX Gyre Heros"
  let serif = "TeX Gyre Termes"

  set page(paper: "a4")

  set text(size: 12pt, font: serif, lang: lang, region: region)

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

      #author

      #pad(top: 3.5em, thesis-type)

      #if is-en {
        text(size: 11pt, [in partial fulfillment of the requirements for the degree of Bachelor of Science (B.Sc.)])
        parbreak()
        [Course of Study: Computer Science]
      } else {
        text(size: 11pt, [zur Erlangung des akademischen Grades Bachelor of Science (B.Sc.)])
        parbreak()
        [Studiengang Informatik]
      }

      #pad(top: 2em, bottom: 2em, [
        #if is-en [Faculty of Computer Science] else [Fakultät für Informatik]
        #parbreak()
        #if is-en [University of Applied Sciences Mannheim] else [Technische Hochschule Mannheim]
      ])

      #declaration-date.display(date-format)

      #pad(top: 5em, {
        if is-en [Supervisors] else [Betreuer]
        parbreak()

        reviewer
        parbreak()

        for advisor in advisors {
          advisor
          parbreak()
        }
      })
    ],
  )

  set par(justify: true)

  set page(numbering: "i")
  counter(page).update(1)

  show heading: h => {
    text(font: sans, strong(h))
  }
  show heading.where(level: 1): h => {
    pagebreak(weak: true)
    pad(top: 5em, bottom: 2em, text(size: 24pt, h))
  }
  show heading.where(level: 2): h => pad(top: 2em, bottom: 2em, text(size: 16pt, h))

  show heading.where(level: 4): h => pad(top: 0.5em, text(font: sans, h.body))

  show outline.entry.where(level: 1): it => link(
    it.element.location(),
    pad(
      top: 0.5em,
      text(font: sans, weight: "bold", it.indented(it.prefix(), [#it.body() #h(1fr) #it.page()], gap: 1em))
    ),
  )

  outline(indent: auto, depth: 3)

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
    let test = counter(page).at(here())

    set page(numbering: "1")
    counter(page).update(1)

    body

    set page(numbering: "i")
    counter(page).update(test)
  }

  if glossary != none {
    pagebreak(weak: true)
    [= Glossar]
    print-glossary(glossary, show-all: true)
  }

  bibliography
}
