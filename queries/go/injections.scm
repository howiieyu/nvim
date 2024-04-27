; extends



((raw_string_literal) @injection.content
 (#contains? @injection.content "<!-- html -->")
 (#offset! @injection.content 0 1 0 -1)
 (#set! injection.language "html"))


