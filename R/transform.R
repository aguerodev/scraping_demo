

# dar formato al precio de los productos ----------------------------------

#' @export
fix_price <- function(price, name){
  box::use(
    purrr[map2_dbl]
  )
  
  fun <- functions[name]
  map2_dbl(.x = price, .y = fun, .f = \(x,fix) fix(x))
}

## MasxMenos

fix_price_masxmenos <- function(price){
  box::use(
    readr[parse_number, locale]
  )
  
  parse_number(price, locale = locale(grouping_mark = "."))
}


## Lista de funciones

functions <- list(
  "MasxMenos" = fix_price_masxmenos
)
