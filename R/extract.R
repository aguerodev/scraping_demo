
#' @export
extract_prices <- function(supermercado) {
  box::use(
    purrr[map]
  )
  urls <- map(supermercado$productos, ~ .x$url_producto) 
  nombres <- map(supermercado$productos, ~ .x$nombre)
  categorias <- map(supermercado$productos, ~ .x$categoria)
  
  precios <- map(urls, ~ extract_price(supermercado$url_base, .x, supermercado$xpath_precio))
  
  data.frame(
    supermercado = supermercado$nombre,
    nombre = unlist(nombres),
    url_producto = unlist(urls),
    categoria = unlist(categorias),
    precio = unlist(precios),
    fecha_extraccion = Sys.time()
  )
}

extract_price <- function(base_url, product_url, xpath) {
  box::use(
    rvest[read_html, html_element, html_text]
  )
  full_url <- paste0(base_url, product_url)
  page <- read_html(full_url)
  price <- page |> 
    html_element(xpath = xpath) |> 
    html_text(trim = TRUE)
  
  return(price)
}

# Función auxiliar para cargar el módulo y exponerlo
.on_load = function (ns) {
  message(
    'Cargando el modulo "', box::name(), '"\n',
    'Ruta del modulo: "', basename(box::file()), '"'
  )
}