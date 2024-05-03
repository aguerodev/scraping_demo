

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
  out <- gsub("[\\$.]", "", price)
  return(out)
}


## Lista de funciones

functions <- list(
  "MasxMenos" = fix_price_masxmenos
)

# Función auxiliar para cargar el módulo y exponerlo
.on_load = function (ns) {
  message(
    'Cargando el modulo "', box::name(), '"\n',
    'Ruta del modulo: "', basename(box::file()), '"'
  )
}