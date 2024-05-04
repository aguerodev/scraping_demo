library(rvest)

url <- "https://www.masxmenos.cr/cafe-britt-afternoon-blend-molido-340gr-4/p"
xpath = "//div[@class='vtex-store-components-3-x-sellingPrice vtex-store-components-3-x-sellingPriceContainer pv1 b c-on-base vtex-store-components-3-x-price_sellingPriceContainer vtex-store-components-3-x-price_sellingPriceContainer--summary']/span/span/span"

read_html(url) |> 
  html_element(xpath = xpath) |> 
  html_text()
