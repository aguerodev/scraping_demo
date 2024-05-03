library(config)
library(purrr)
library(DBI)
library(duckdb)

box::use(R/extract[extract_prices])
box::use(R/transform[fix_price])

con <- dbConnect(duckdb(), dbdir = "data/precios.duckdb", read_only = FALSE)

## obtener lista de supermercados y productos
supermercados <- get(file = "config.yml")

## Extraer los precios para cada producto
df <- map(supermercados, extract_prices) |> 
  list_rbind() 

df$precio <- fix_price(df$precio, df$supermercado)

## Escribir en la db
dbWriteTable(con, "productos", df, append = TRUE)
DBI::dbDisconnect(con)


