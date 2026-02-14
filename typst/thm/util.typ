#let pageref(label) = context {
  let loc = locate(label)
  let nums = counter(page).at(loc)
  link(loc, numbering(loc.page-numbering(), ..nums))
}
