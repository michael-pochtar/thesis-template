#import "thm/thm.typ": thm-thesis
#import "glossary.typ": glossary

#show: thm-thesis.with(
  title: [Einsatz eines Flux-Kompensators für Zeitreisen mit einer maximalen Höchstgeschwindigkeit von WARP 7],
  thesis-type: [Bachelor-Thesis],
  author: [Max Mustermann],
  reviewer: "Prof. Peter Mustermann, Technische Hochschule Mannheim",
  advisors: ("Erika Mustermann, Paukenschlag GmbH",),
  lang: "de",
  bibliography: bibliography("refs.bib"),
  glossary: glossary,
)

#include "chapter/chapter1.typ"
#include "chapter/chapter2.typ"
#include "chapter/chapter3.typ"
#include "chapter/chapter4.typ"
#include "chapter/chapter5.typ"
