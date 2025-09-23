#import "thm/thm.typ": thm-thesis
#import "glossary.typ": glossary
#import "acronyms.typ": acronyms
#import "abstract.typ": abstract-de, abstract-en

#show: thm-thesis.with(
  title-de: [Einsatz eines Flux-Kompensators für Zeitreisen mit einer maximalen Höchstgeschwindigkeit von WARP~7],
  title-en: [Application of a flux compensator for timetravel with a maximum velocity of warp~7],
  author-surname: "Mustermann",
  author-given-name: "Max",
  abstract-de: abstract-de,
  abstract-en: abstract-en,
  reviewers: ("Prof. Peter Mustermann, Technische Hochschule Mannheim",),
  advisors: ("Erika Mustermann, Paukenschlag GmbH",),
  lang: "de",
  bibliography: bibliography("refs.bib", style: "ieee"),
  glossary: glossary,
  acronyms: acronyms,
)

#include "chapters/chapter1.typ"
#include "chapters/chapter2.typ"
#include "chapters/chapter3.typ"
#include "chapters/chapter4.typ"
#include "chapters/chapter5.typ"

