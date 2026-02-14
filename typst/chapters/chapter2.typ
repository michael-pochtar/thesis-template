#import "../thm/abbreviations.typ": *
#import "@preview/acrostiche:0.6.0": acr, acrfull, acs, acl, acrpl
#import "@preview/glossarium:0.5.10": gls
#import "../thm/util.typ": pageref

= Typografie

== Hervorhebungen <Hervorhebungen>

Achten Sie bitte auf die grundlegenden Regeln der Typografie #footnote[Ein Ratgeber in allen Detailfragen ist @Forssman2002.], wenn Sie Ihren Text schreiben. Hierzu gehören #zb die Verwendung der richtigen "Anführungszeichen" und der Unterschied zwischen Binde- (-), Gedankenstrich (--) und langem Strich (---). Sie erhalten den Bindestrich in LaTeX mit -, den Gedankenstrich mit -\- und den langen Strich mit -\-\-.

Wenn Sie Text hervorheben wollen, dann setzten Sie ihn mit `\textit` _kursiv_ (Italic) und nicht *fett* (Bold). Fettdruck ist Überschriften vorbehalten; im Fließtext stört er den Lesefluss. Das #underline[Unterstreichen] von Fließtext ist im gesamten Dokument tabu und kann maximal bei Pseudo-Code vorkommen.

== Anführungszeichen

Deutsche Anführungszeichen werden mit \"‘ und \"’ erzeugt: "dieser Text steht in 'Anführungszeichen'; alles klar?". Englische Anführungszeichen hingegen mit ‘‘ und ’’: “this is an ‘English’ quotation”. Beachten Sie, dass Sie in Zitaten immer die zur Sprache passenden Anführungszeichen verwenden. Die Verwendung von \" ist für Anführungszeichen immer falsch und führt bei LaTeX zu seltsamen "Ëffekten".

Um sich diesen Ärger zu sparen, bietet sich die Verwendung des Paketes _csquotes_ und des Kommandos `\enquote` an. Hierdurch werden die Anführungszeichen korrekt für die eingestellte Sprache gesetzt und Sie müssen sich "keine Sorgen mehr über die 'Anführungszeichen' machen".

== Silbentrennung

LaTeX führt eine automatische Silbentrennung durch, sodass Sie sich eigentlich um nichts kümmern müssen. Allerdings werden Wörter, die bereits einen Bindestrich enthalten nicht getrennt, #zb #box[Datenschutz-Grundverordnung]. Wenn Sie Ihren Text auf Deutsch schreiben, können Sie dann alternativ \"= für den Bindestrich im Wort verwenden, #zb \ Datenschutz\"=Grundverordnung, damit LaTeX weiterhin richtig trennt.

Ist die Silbentrennung aus einem anderen Grund nicht erfolgt, #zb weil das Wort nur aus Großbuchstaben besteht, sodass die Zeile über den rechten Rand hinaussteht (Sie bekommen eine _overfull hbox_-Warnung), können Sie LaTeX helfen, indem Sie weitere Trennstellen angeben. Dies geschieht durch \"- als Zeichen, #zb Staats\"-ver\"-trag.

== Abkürzungen

Eine #acr("abk") `\gls{abk}` wird bei der ersten Verwendung ausgeschrieben. Danach nicht mehr: #acr("abk"). Man kann allerdings mit `\acrlong{abk}` die Langform explizit anfordern (#acl("abk")) oder mit `\acrshort{abk}` die Kurzform (#acs("abk")) oder mit `\acrfull{abk}` auch noch einmal die Definition (#acrfull("abk")). Wenn Sie eine Abkürzung im Plural verwenden wollen, gibt ihnen `\glspl{isp}` die Möglichkeit (#acrpl("isp")).

Das Abkürzungsverzeichnis muss aufgrund der automatischen Sortierung separat kompiliert werden. Der dazugehörige Befehl lautet:

```
  makeindex -s %.ist -t %.alg -o %.acr %.acn
```

Beachten Sie, dass bei Abkürzungen, die für zwei Wörter stehen, ein schmales Leerzeichen nach dem Punkt kommt (\\, in LaTeX): #zb bzw. #zb und #dh bzw. #dh. Das Template bietet hierfür die beiden Makros `\zb{}` und `\dahe{}`.

== Glossar

Ein Eintrag in dem Glossar kann mithilfe des Befehls `\gls{glos:amplification}` erzeugt werden. Hierbei wird die Begriffserklärung in der Datei `/kapitel/glossar` verwendet und in dem Verzeichnis aufgeführt. Ein Beispiel hierfür wäre: #gls("amplification"). Das Wort Amplification erscheint nun in der Begriffserklärung.

Das Glossar muss aufgrund der automatischen Sortierung separat kompiliert werden. Der dazugehörige Befehl lautet:

```
  "makeindex.exe" -s %.ist -t %.glg -o %.gls %.glo
```

== Symbolverzeichnis

Ein Eintrag in dem Symbolverzeichnis kann mithilfe des Befehls `\gls{symb:Pi}` erzeugt werden. Hierbei wird das Symbol in der Datei `/kapitel/symbole` geladen und in dem Verzeichnis aufgeführt. Ein Beispiel hierfür ist: $pi$ und $P$.

Das Symbolverzeichnis muss aufgrund der automatischen Sortierung separat kompiliert werden. Der dazugehörige Befehl lautet:

```
  "makeindex.exe" -s %.ist -t %.slg -o %.syi %.syg
```

== Querverweise

Querverweise auf eine Kapitelnummer macht man im Text mit `\ref` (@Hervorhebungen) und auf eine bestimmte Seite mit `\pageref` (Seite #pageref(<Hervorhebungen>)). Man kann auch den Befehl `\autoref` benutzen, der automatisch die Art des referenzierten Elements bestimmt (#zb @Hervorhebungen[Abschnitt] oder @Kopplungsformen).

== Fußnoten

Fußnoten werden einfach mit in den Text geschrieben, und zwar genau an die Stelle #footnote[An der die Fußnote auftauchen soll]. Hierzu dient der Befehl `\footnote{Text}`.

== Tabellen

Tabellen werden normalerweise ohne vertikale Striche gesetzt, sondern die Spalten werden durch einen entsprechenden Abstand voneinander getrennt. #footnote[Siehe @Willberg2021[S. 89].] Zum Einsatz kommen ausschließlich horizontale Linien (siehe @Kopplungsformen).

#figure(
  table(
    columns: 3,
    table.hline(),
    [Form der Kopplung], [enge Kopplung], [lose Kopplung],
    table.hline(stroke: 0.3pt),

    [Physikalische Verbindung], [Punkt-zu-Punkt], [über Vermittler],
    [Kommunikationsstil], [synchron], [asynchron],
    [Datenmodell], [komplexe gemeinsame Typen], [nur einfache gemeinsame Typen],
    [Bindung], [statisch], [dynamisch],

    table.hline(),
  ),
  caption: [Lange Tabelle mit ISO-Ländercodes],
) <Kopplungsformen>

Eine Tabelle fließt genauso, wie auch Bilder durch den Text. Siehe @Kopplungsformen.

Manchmal möchte man Tabellen, in denen der Text in der Tabellenspalte umbricht. Hierzu dient die Umgebung `tabularx`, wobei `L` eine Spalte mit Flattersatz und `X` eine mit Blocksatz definiert. Die Breite der Tabelle kann über den Faktor vor `\textwidth` angegeben werden.

#figure(
  table(
    columns: 3,

    table.hline(),
    [Gebiet], [Definition], [Beispiel],
    table.hline(stroke: 0.3pt),

    [_Praktische Informatik_],
    [Informatik-Disziplinen, welche sich vorwiegend mit der Entwicklung und Anwendung der Software-Komponenten befassen],
    [Programmentwicklung, Compilerbau; im Aufbau von #zb Informationssystemen und Netzwerken ergeben sich Überlappungen mit der technischen Informatik],

    table.hline(stroke: 0.3pt),

    [_Technische Informatik_],
    [Informatik-Disziplinen, welche sich vorwiegend mit der Entwicklung und Anwendung der Hardware-Komponenten befassen],
    [Digitaltechnik, Mikroprozessortechnik],

    table.hline(stroke: 0.3pt),

    [_Theoretische Informatik_],
    [Informatik-Disziplinen, welche sich mit der Entwicklung von Theorien und Modellen der Informatik befassen und dabei viel Substanz aus der Mathematik konsumieren],
    [Relationenmodell, Objekt-Paradigmen, Komplexitätstheorie, Kalküle],

    table.hline(stroke: 0.3pt),

    [_Angewandte Informatik_],
    [Informatik als instrumentale Wissenschaft],
    [Rechtsinformatik, Wirtschaftsinformatik, Geoinformatik],

    table.hline(),
  ),
  caption: [Teildisziplinen der Informatik],
) <Teildisziplinen>

Manchmal kommt es vor, dass eine Tabelle so lang wird, dass sie sich über mehr als eine Seite erstreckt. In diesem Fall können Sie das Paket `longtable` verwenden und die Tabelle mit #box[`\begin{longtable}[h]`] definieren. Die Tabelle wird dann _nicht_ in eine `table`-Umgebung eingeschlossen. Siehe hierzu @Laendercodes  @AnhangB.

== Harveyballs

#quote[
  Harvey Balls sind kreisförmige Ideogramme, die dazu dienen, qualitative Daten anschaulich zu machen. Sie werden in Vergleichstabellen verwendet, um anzuzeigen, inwieweit ein Untersuchungsobjekt sich mit definierten Vergleichskriterien deckt. @Wikipedia_HarveyBalls
]

#figure(
  table(
    columns: 4,
    align: center,

    table.hline(),
    [], [Ansatz 1], [Ansatz 2], [Ansatz 3],
    table.hline(stroke: 0.3pt),

    [Eigenschaft 1], [○], [◔], [◑],
    table.hline(stroke: 0.3pt),

    [Eigenschaft 2], [◑], [◕], [●],
    table.hline(stroke: 0.3pt),

    [Eigenschaft 3], [●], [◕], [◔],

    table.hline(),
  ),
  caption: [Beispiel für Harvey Balls],
) <HarveyExample>

== Aufzählungen

Aufzählungen sind toll.

- Ein wichtiger Punkt
- Noch ein wichtiger Punkt
- Ein Punkt mit Unterpunkten
  - Unterpunkt 1
  - Unterpunkt 2
- Ein abschließender Punkt ohne Unterpunkte


Aufzählungen mit laufenden Nummern sind auch toll.

+ Ein wichtiger Punkt
+ Noch ein wichtiger Punkt
+ Ein Punkt mit Unterpunkten
  + Unterpunkt 1
  + Unterpunkt 2
+ Ein abschließender Punkt ohne Unterpunkte


Aufzählungen mit eigenen Bezeichnern sind auch toll.

#enum(
  [Ein wichtiger Punkt],
  [Noch ein wichtiger Punkt],
  [Ein Punkt mit Unterpunkten],
  [Ein abschließender Punkt ohne Unterpunkte],
  numbering: "RQ 1)"
)

Auch die Auflistung im Fließtext ist sehr wertvoll: a) wichtiger Punkt, b) zweiter wichtiger Punkt und c) der letzte Punkt.

