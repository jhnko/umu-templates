#import "@preview/tablex:0.0.6": tablex


#let TABLE_STROKE = 0.5pt + black

#show terms: it => {
  it.children
    .map(child => [
      #strong[#child.term]
      #block(inset: (left: 1.5em, top: -0.4em))[#child.description]
      ])
    .join()
}

#let swedish_month(month_num) = {
  let months = (
    "januari",
    "februari",
    "mars",
    "april",
    "maj",
    "juni",
    "juli",
    "augusti",
    "september",
    "oktober",
    "november",
    "december"
  )

  let month = months.at(month_num - 1)
  
  return month
}

#let format_date(lang, date) = {
  if lang == "sv" [
    #date.day() #swedish_month(date.month()) #date.year()
  ] else {
    date.display("[month repr:long] [day padding:none], [year]")
  }
}

// Call this function to use the template
#let conf(
  title: none,
  authors: none,
  subtitle: none,
  top_left_title: none,
  date: datetime.today(),
  chapter_count: none,
  abstract: none,
  cols: 1,
  margin: (x: 1.25in, y: 1.25in),
  paper: "a4",
  lang: "sv",
  region: "SE",
  font: (),
  fontsize: 12pt,
  bibliography: none,
  doc,
) = {
  show figure.where(kind: table): set figure.caption(position: top)

  // Decimal comma for Swedish
  show math.equation: it => if lang == "sv" {
      show regex("\d+\.\d+"): it => {show ".": {","+h(0pt)}
          it}
      it
  } else {
    it
  }

  show heading: it => {
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
  
  counter(page).update(0)

  let is_outline_page = state("is_outline_page", false)
  let last_outline_page = state("last_outline_page", false)  

  let date_text = format_date(lang, date)
  

  let pageheader = locate(loc => {
    let pagenumber = counter(page).at(loc).first()

    let chapter_headings = query(heading.where(level: 1), loc).rev()

    let current_chapter_heading = chapter_headings
               .find(h => h.location().page() <= loc.page())

    let current_chapter_count = counter(heading).at(current_chapter_heading.location()).first()

    if pagenumber > 0 {
      if current_chapter_heading != none {
        let n = if current_chapter_heading.numbering != none {
          current_chapter_heading.numbering
        } else {
          "1."
        }
        let current_chapter_name = current_chapter_heading.body

        let num_text = if (not is_outline_page.at(loc)) and current_chapter_count != none {
          numbering(n, current_chapter_count)
        } else {
          none
        }

        block(below: 0.5em)[
          #smallcaps(subtitle) #h(1fr) #num_text #current_chapter_name
        ]
        line(length: 100%)
      }
    }
  })
  
  let pagefooter = locate(loc => {
    let pagenumber = counter(page).at(loc).first()

    if pagenumber == 0 {
      if authors.find(author => username == "c23jkt") == none {

        let typst_link = link("https://typst.app/")[Typst]
        let template_author_mail_link = link("mailto:c23jkt@cs.umu.se")[`c23jkt`]

        let template_author_disclaimer = if lang == "sv" [
          Rapportmall översatt till #typst_link av #template_author_mail_link
        ] else [
          Report template translated to #typst_link by #template_author_mail_link
        ]

        linebreak()
        linebreak()
        text(size: 10pt, template_author_disclaimer)
      }
    } else [
      #line(length: 100%)
      #columns(3)[
   //      #author.name, #username

        #colbreak()

        #set align(center)

        #if is_outline_page.at(loc) or last_outline_page.at(loc) {
          counter(page).display("i")
        } else {
          counter(page).display()
        }

        #colbreak()

        #set align(right)
        #date_text
      ]
    ]
  })
  

  set page(
    paper: paper,
    margin: margin,
    header: pageheader,
    footer: pagefooter
  )
  

  set text(
    lang: lang,
    region: region,
    font: font,
    size: fontsize
  )
           

  set table(stroke: TABLE_STROKE)

  let department = authors.at(0).department.at(lang)

  columns(2)[
        #text(
          size: 13pt,
          weight: "bold",
          block(
            above: 5cm,
          )[
          #upper([Umeå universitet]) \
          #department \
          #top_left_title
          ]
        )

        #colbreak()

        #set align(right)

        *#date_text*
  ]

  v(4cm)

  if title != none {
    align(center)[
      #block(
        inset: 1em,
        width: 75%,
        below: 1em,
      )[
        #text(
          size: 24pt,
          )[
            #title
      ]
    ]]
  }
  

  if subtitle != none {
    align(center,
      block(
        inset: 1em,
        text(
        weight: "thin",
        size: 20pt,
        )[
          #subtitle
        ]
      )
    )
  }
  

  let name_label = if lang == "sv" [Namn] else [Name]
  let username_label = if lang == "sv" [Användarnamn] else [Username]

  let author_info = authors.map(author => {
    
  })

  if authors != none {
    align(center,
      block(
        height: 8em,
        inset: 1em,
        grid(
          columns: array.range(authors.len()).map(n => auto),
          row-gutter: 1.5em,
          column-gutter: 3em,
          ..authors.map(author => {
            [
              #set align(center)
              #set text(size: 13pt)

              #author.name
            ]
          }),
          ..authors.map(author => block(
            if "email" in author {
              let link_title = if "username" in author {
                author.username
              } else {
                author.email
              }

              let email_link = "mailto:" + author.email

              link(email_link)[#raw(link_title)]
            } else {
              if "username" in author {
                raw(author.username)
              }
            }))
        )
      )
    )
  }
  

  v(1fr)
  

  set par(justify: true)

  set heading(numbering: "1.1")

  // // Deprecated feature of reports
  // 

  // let graders_label = if lang == "sv" [Labrättare] else [Graders]
  

  // align(
  //   center,
  //   block()[
  //     #text(size: 14pt)[
  //       *#graders_label*
  //     ] \
  //     #text(size: 12pt)[
  //       #graders
  //     ]
  //   ]
  // )
  

  is_outline_page.update(true)
  

  pagebreak()

  
  counter(page).update(1)

  outline(indent: true)

  last_outline_page.update(true)
  is_outline_page.update(false)
  

  pagebreak()
  

  last_outline_page.update(false)
  

  set page(
    numbering: "1"
  )
  
  counter(page).update(1)
  


  if cols == 1 {
    doc
  } else {
    columns(cols, doc)
  }
}