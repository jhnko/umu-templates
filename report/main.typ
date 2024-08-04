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
  name: "Robot",
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

= Fler rubrikar

Fortsätt skriva rapporten här.

== En underrubrik

$0.5$


Caladan är Paul Atreides hemvärld. @dune

#bibliography("reference.yml",style: "./karlstad-universitet-harvard.csl", title: if lang == "sv" { "Referenser" } else { "References" })