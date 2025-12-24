#let user_id = "kaiseja1"

// Define box styles
#let info_box(body, fill, stroke) = block(
  inset: 4pt,
  radius: 3pt,
  fill: fill,
  stroke: (paint: stroke, thickness: 0.5pt),
)[#body]

#let formula(body) = info_box(body, rgb("#e9f5ee"), rgb("#8bc5a3"))
#let math(body) = info_box(body, rgb("#c8e6d0"), rgb("#6ba885"))
#let example(body) = info_box(body, rgb("#f0f4ff"), rgb("#a3b8e8"))
#let steps(body)   = info_box(body, rgb("#fff8e1"), rgb("#ffb74d"))
#let variables(body) = info_box(body, rgb("#ffe6e6"), rgb("#ff6b6b"))
#let remark(body) = info_box(body, rgb("#ffffff"), rgb("#dd5de4"))

#let default_style(body) = {
  set document(title: "Zusammenfassung", author: "Jan Kaiser (kaiseja1)")
  set page(
    paper: "a4",
    flipped: true, // landscape
    footer: [#align(right)[#user_id]],
  )
  set text(size: 8.5pt)
  set heading(numbering: "1.1")

  body
}
