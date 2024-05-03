library(config)
library(purrr)
library(dplyr)
library(DBI)
library(duckdb)

box::use(R/extract[extract_prices])
box::use(R/transform[fix_price])

con <- dbConnect(duckdb(), dbdir = "data/precios.duckdb", read_only = FALSE)

## obtener lista de supermercados y productos
supermercados <- get(file = "config.yml")

## Extraer los precios para cada producto
df <- map(supermercados, extract_prices) |> 
  list_rbind() |> 
  mutate(
    precio = fix_price(precio, supermercado)
  )

## Escribir en la db
dbWriteTable(con, "productos", df, append = TRUE)
DBI::dbDisconnect(con)


