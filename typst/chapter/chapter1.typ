= Schreibstil

== Rechtschreibung und Wortbenutzung

Beachten Sie die Hinweise zur Wortbenutzung, Rechtschreibung und Zeichensetzung im Anhang~\ref{AnhangA}.
Hier finden Sie Tipps zur Übersetzung von deutschen und englischen Begriffen, zur Zeichensetzung und Wortbenutzung.

== Fremdsprachige Begriffe

Wenn Sie Ihre Arbeit auf Deutsch verfassen, gehen Sie sparsam mit englischen Ausdrücken um. Natürlich brauchen Sie etablierte englische Fachbegriffe, wie z.\,B. \textit{Interrupt}, nicht zu übersetzen. Sie sollten aber immer dann, wenn es einen gleichwertigen deutschen Begriff gibt, diesem den Vorrang geben. Den englischen Begriff (\textit{term}) können Sie dann in Klammern oder in einer Fußnote\footnote{Englisch: \textit{footnote}.} erwähnen. Absolut unakzeptabel sind deutsch gebeugte englische Wörter oder Kompositionen aus deutschen und englischen Wörtern wie z.\,B. downgeloadet, upgedated, Keydruck oder Beautyzentrum.


== Zitate

=== Zitate im Text

Wichtig ist das korrekte Zitieren von Quellen, wie es \zb{} von \cite{Kornmeier2011} dargelegt wird. Interessant ist in diesem Zusammenhang weiterhin der Artikel von \cite{Kramer2009}. Häufig werden die Zitate auch in Klammern gesetzt, wie bei \parencite{Kornmeier2011} und zusätzlich mit Seitenzahlen versehen \parencite[S. 301--303]{Kornmeier2011}. Wenn nur zwei aufeinanderfolgende Seiten zitiert werden sollen, kann man \texttt{f.} bei mehreren \texttt{ff.} verwenden, also im Beispiel von Kornmeier \parencite[S. 301 f.]{Kornmeier2011} meint dies die Seiten 301 und 302 bzw. \parencite[S. 301 ff.]{Kornmeier2011} bezieht sich auf mehrere Seiten, die bei 301 beginnen. Generell ist es besser, einen Seitenbereich anzugeben, als \texttt{ff.} zu verwenden.

Bei Webseiten wird auch die URL und das Abrufdatum mit angegeben \parencite{Gao2017}. Wenn die URL nicht korrekt umgebrochen wird, lohnt es sich, an den Parametern \textit{biburl*penalty} in der \texttt{preambel.tex} zu drehen. Kleinere Werte erhöhen die Wahrscheinlichkeit, dass getrennt wird.

Veröffentlichungen in Konferenzbänden werden in sogenannten Inbooks oder Inproceedings veröffentlicht und besitzen meist eine \gls{doi} (\zb{} \cite{Lang2022}).

=== Zitierstile

Verwenden Sie eine einheitliche und im gesamten Dokument konsequent durchgehaltene Zitierweise\index{Zitierweise}. Es gibt eine ganze Reihe von unterschiedlichen Standards für das Zitieren und den Aufbau eines Literaturverzeichnisses. Sie können entweder mit Fußnoten oder Kurzbelegen im Text arbeiten. Welches Verfahren Sie einsetzen ist Ihnen überlassen, nur müssen Sie es konsequent durchhalten. Stimmen Sie sich im Vorfeld mit Ihrem Betreuer ab -- diese Vorlage unterstützt alle gängigen Zitierweisen.

In der Informatik ist das Zitieren mit Kurzbelegen\index{Zitat!Kurzbeleg} im Text (Harvard"=Zitierweise) weit verbreitet, wobei für das Literaturverzeichnis häufig die Regeln der \gls{acm} oder \gls{ieee} angewandt werden.\footnote{Einen Überblick über viele verschiedene Zitierweisen finden Sie in der \url{http://amath.colorado.edu/documentation/LaTeX/reference/faq/bibstyles.pdf}}

Am einfachsten ist es, wenn Sie das \verb+\autocite{}+-Kommando verwenden. Bei diesem Kommando können Sie in der Datei \texttt{perambel.tex} festlegen, wie die Zitate generell aussehen sollen, \zb{} ob sie in Fußnoten erfolgen sollen oder nicht. Wollen Sie von dem globalen Zitierstil abweichen, können Sie weiterhin spezielle Kommandos benutzen:

=== Zitieren von Internetquellen

== Gliederung: Zweite Ebene

=== Gliederung: Dritte Ebene

==== Gliederung: Vierte Ebene

===== Gliederung: Fünfte Ebene
