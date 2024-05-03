

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
  out <- gsub("[\\₡.]", "", price)
  out <- as.numeric(out)
  return(out)
}

fix_price_automercado <- function(price) {
  out <- gsub("[₡,]", "", price)
  out <- as.numeric(out)
  return(out)
}

fix_price_maxipali <- function(price){
  out <- gsub("[\\₡.]", "", price)
  out <- as.numeric(out)
  return(out)
}


## Lista de funciones

functions <- list(
  "MasxMenos" = fix_price_masxmenos,
  "Automercado" = fix_price_automercado,
  "Maxipali" = fix_price_maxipali
)

# Función auxiliar para cargar el módulo y exponerlo
.on_load = function (ns) {
  message(
    'Cargando el modulo "', box::name(), '"\n',
    'Ruta del modulo: "', basename(box::file()), '"'
  )
}