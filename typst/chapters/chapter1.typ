#import "../thm/abbreviations.typ": *
#import "@preview/acrostiche:0.6.0": acr

= Schreibstil

== Rechtschreibung und Wortbenutzung

Beachten Sie die Hinweise zur Wortbenutzung, Rechtschreibung und Zeichensetzung im Anhang A.
Hier finden Sie Tipps zur Übersetzung von deutschen und englischen Begriffen, zur Zeichensetzung und Wortbenutzung.

== Fremdsprachige Begriffe

Wenn Sie Ihre Arbeit auf Deutsch verfassen, gehen Sie sparsam mit englischen Ausdrücken um. Natürlich brauchen Sie etablierte englische Fachbegriffe,
wie #zb _Interrupt_, nicht zu übersetzen. Sie sollten aber immer dann, wenn es einen gleichwertigen deutschen Begriff gibt, diesem den Vorrang geben.
Den englischen Begriff (_term_) können Sie dann in Klammern oder in einer Fußnote #footnote[Englisch: _footnote_] erwähnen.
Absolut unakzeptabel sind deutsch gebeugte englische Wörter oder Kompositionen aus deutschen und englischen Wörtern wie #zb downgeloadet, upgedated, Keydruck oder Beautyzentrum.

== Zitate

=== Zitate im Text

Wichtig ist das korrekte Zitieren von Quellen, wie es #zb von @Kornmeier2011 dargelegt wird. Interessant ist in diesem Zusammenhang weiterhin der Artikel von @Kramer2009.
Häufig werden die Zitate auch in Klammern gesetzt, wie bei @Kornmeier2011 und zusätzlich mit Seitenzahlen versehen @Kornmeier2011[S. 301--303].
Wenn nur zwei aufeinanderfolgende Seiten zitiert werden sollen, kann man `f.` bei mehreren `ff.` verwenden, also im Beispiel von Kornmeier @Kornmeier2011[S. 301 f.]
meint dies die Seiten 301 und 302 bzw. @Kornmeier2011[S. 301 ff.] bezieht sich auf mehrere Seiten, die bei 301 beginnen. Generell ist es besser,
einen Seitenbereich anzugeben, als `ff.` zu verwenden.

Bei Webseiten wird auch die URL und das Abrufdatum mit angegeben @Gao2017. Wenn die URL nicht korrekt umgebrochen wird, lohnt es sich,
an den Parametern _biburl*penalty_ in der `preambel.tex` zu drehen. Kleinere Werte erhöhen die Wahrscheinlichkeit, dass getrennt wird.

Veröffentlichungen in Konferenzbänden werden in sogenannten Inbooks oder Inproceedings veröffentlicht und besitzen meist eine #acr("doi") (#zb @Lang2022).

=== Zitierstile

Verwenden Sie eine einheitliche und im gesamten Dokument konsequent durchgehaltene Zitierweise. Es gibt eine ganze Reihe von unterschiedlichen Standards für das
Zitieren und den Aufbau eines Literaturverzeichnisses. Sie können entweder mit Fußnoten oder Kurzbelegen im Text arbeiten. Welches Verfahren Sie einsetzen ist
Ihnen überlassen, nur müssen Sie es konsequent durchhalten. Stimmen Sie sich im Vorfeld mit Ihrem Betreuer ab -- diese Vorlage unterstützt alle gängigen Zitierweisen.

In der Informatik ist das Zitieren mit Kurzbelegen im Text (Harvard-Zitierweise) weit verbreitet, wobei für das Literaturverzeichnis häufig die Regeln der #acr("acm")
oder #acr("ieee") angewandt werden. #footnote[Einen Überblick über viele verschiedene Zitierweisen finden Sie in der http://amath.colorado.edu/documentation/LaTeX/reference/faq/bibstyles.pdf]

Am einfachsten ist es, wenn Sie das `\autocite{}`-Kommando verwenden. Bei diesem Kommando können Sie in der Datei `perambel.tex` festlegen,
wie die Zitate generell aussehen sollen, #zb ob sie in Fußnoten erfolgen sollen oder nicht. Wollen Sie von dem globalen Zitierstil abweichen,
können Sie weiterhin spezielle Kommandos benutzen:

// TODO: Ein vom Template definiertes, einheitliches, globales styling für Listen.
#pad(top: 1em, bottom: 1em,
  [
    #set list(spacing: 1.5em, indent: 1.5em)

    - `\autocite{Willberg2021}`: @Willberg2021
    - `\cite{Willberg2021}`: @Willberg2021
    - `\parencite{Willberg2021}`: @Willberg2021
    - `\footcite{Willberg2021}`: #footnote[@Willberg2021]
    - `\citeauthor{Willberg2021}`: Willberg und Frossmann
    - `\citeauthor*{Willberg2021}`: Willberg #ua 
    - `\citetitle{Willberg2021}`: _Wegweiser Schrift: Was passt - was wirkt - was stört?_
    - `\fullcite{Willberg2021}`: #cite(<Willberg2021>, form: "full")
  ],
)

Denken Sie daran, dass das Übernehmen einer fremden Textstelle ohne entsprechenden Hinweis auf die Herkunft in wissenschaftlichen Arbeiten nicht akzeptabel ist und dazu
führen kann, dass die Arbeit nicht anerkannt wird. Plagiate werden mit mangelhaft (5,0) bewertet und können weitere rechtliche Schritte nach sich ziehen.

=== Zitieren von Internetquellen

== Gliederung: Zweite Ebene

=== Gliederung: Dritte Ebene

==== Gliederung: Vierte Ebene

===== Gliederung: Fünfte Ebene
