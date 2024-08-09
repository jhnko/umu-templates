#import "@preview/codelst:2.0.1": sourcecode, code-frame
#import "@preview/cetz:0.2.2": *
#import "@preview/fletcher:0.4.4" as fletcher: node, edge
#import "@preview/drafting:0.2.0": margin-note, set-page-properties

#import "template.typ": *

// Makes the code listings look a bit nicer.
#let code-frame = code-frame.with(
  fill: none, stroke: 0.6pt + luma(150)
)
#let sourcecode = sourcecode.with(frame: code-frame)

#show heading: it => {
  set text(weight: "regular")

  let above = if it.level > 1 {
    2em
  } else {
    1em
  }

  block(
    above: above,
    it
  )
}

#show figure.where(kind: table): set figure.caption(position: top)

#let authors = (
  (
    name: "Sven Svensson",
    // username: "c00abc",
    email: "c00abc@cs.umu.se",
    programme: (
      sv: "Civilingenjörsprogrammet i teknisk datavetenskap", 
      en: "Master of Science Programme in Computing Science and Engineering"
    ),
    department: (
      sv: "Institutionen för datavetenskap",
      en: "Department of Computer Science"
    ),
  ),
)

#let course = (
  name: "Kursnamn",
  code: "5DV999"
)

// Specify the language of the document here.
#let lang = "sv"

// Assignments usually follow the pattern "Obligatorisk uppgift 1", "Obligatorisk uppgift 2", etc.
// Feel free to just use `subtitle` and `top_left_title` directly.
#let assignment = (
  name: "Uppgiftsnamn",
  number: 1,
  type: if lang == "sv" {
    "Obligatorisk uppgift"
  } else {
    "Assignment"
  },
)

// Assignment titles usually follow the pattern "Obligatorisk uppgift 1", "Obligatorisk uppgift 2", etc.
// Feel free to just use `subtitle` and `top_left_title` directly.
#let assignment_title = [#assignment.type #assignment.number]

// See template.typ for more parameters.
#show: doc => conf(
  title: [#course.code #course.name], // Feel free to use `title` directly
  subtitle: [#assignment_title #sym.dash.em #assignment.name],
  top_left_title: assignment_title,
  margin: (x: 1.25in, y: 1.5in),
  lang: lang,
  authors: authors,
  cols: 1,
  // Why not make the template your own and add your own parameters to the template?
  doc,
)

#set-page-properties()

// The choice of headings is completely up to you.
#if lang == "sv" [
  = Introduktion
] else [
  = Introduction
]

Skriv en introduktion här.

= En till rubrik

Planeten _Caladan_ är Paul Atreides hemvärld @dune.

Nu ska jag visa lite matte och kod.

== Matematik <math>

Jag vet att om $a > b$ och $b > c$ så är $a > c$.

Igår insåg jag även att två halvor blir en hel:
$
0.5 + 0.5 = 1
$

== Programmering

Rust är ett vackert programmeringsspråk, kolla här:
```rust
fn main() {
  let apples_per_bag = vec![5, 4, 3, 5, 7, 2];

  let total_apples = grades.iter().sum();
  let bag_count = apples_per_bag.len();

  println!("We have {total_apples} apples in the {bag_count} bags.");
}
```

Som ni såg så använde jag mina additionskunskaper, som jag demonstrerade i avsnitt @math.

#figure(
  caption: [Mängden frukt på kontoret.],
  table(
    columns: 2,
    table.header([Frukt], [Antal]),
    [Äpple, 5],
    [Apelsin, 3],
    [Banan], [2],
    [Päron], [4],
    [Kiwi], [1],
  )
)

#let thin_black = 0.6pt + black

#figure(
  caption: [Mängden bilar på parkeringen.],
  table(
    columns: 2,
    stroke: none,
    table.header([Bilfärg], table.vline(stroke: thin_black), [Antal]),
    table.hline(stroke: thin_black),
    [Svart], [5],
    [Blå], [3],
    [Röd], [2],
    [Grå], [4],
    [Gul], [1],
  )
)

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam aliquet tempus mattis. Vivamus molestie non ligula at tristique. Fusce tincidunt a turpis eget pretium. Vivamus odio orci, congue sit amet risus a, consequat feugiat eros. Suspendisse potenti. Pellentesque feugiat malesuada egestas. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque aliquet porttitor tempus. In et lectus nulla. Aliquam vel arcu aliquam, porta felis scelerisque, placerat massa. Donec dapibus pulvinar interdum. In at lobortis sem. Nam lacinia ex non tempor pulvinar. Nullam luctus blandit sem a facilisis. Duis et magna pretium, tempor mauris at, congue eros.

#bibliography("reference.yml",style: "./karlstad-universitet-harvard.csl", title: if lang == "sv" { "Referenser" } else { "References" })