setwd("C:/Users/Alumno/Desktop/Trabajo_BigData")

#instalarndo Rvest
# install.packages("rvest")
# install.packages("gdata")

library(rvest)
library(gdata)

# descargando pagina zmart
zmart <- read_html("https://www.zmart.cl/JuegosPS4")

# listados de productos
listadoJuegosZmart <- html_nodes(zmart, css = "#ProdDisplayType5_32641_Products")

# titulos de los productos
titulosZmart <- html_nodes(listadoJuegosZmart, ".BoxProductoS2_Descripcion")
textTitulosZmart <- html_text(titulosZmart)

for (n in 1:length(textTitulosZmart)) {
  print(textTitulosZmart[n])
}


# precios de los productos
preciosZmart <- html_nodes(listadoJuegosZmart, ".BoxProductoS2_Precio")
textPreciosZmart <- html_text(preciosZmart)

for (k in 1:length(textPreciosZmart)) {
  print(textPreciosZmart[k])
}

# [almacenando informacion 1] creacion de un dataframe

todosLosDatos <- data.frame()


for (i in 1:length(textTitulosZmart)) {
  print("========== ITEM ==========")
  
  # nombre del juego:
  print(textTitulosZmart[i])
  
  # precio:
  textPreciosZmart <- gsub("[.]","",textPreciosZmart)
  textPreciosZmart <- as.numeric(textPreciosZmart)
  print(textPreciosZmart[i])
  
  # [almacenando informacion 2] creando dataframe con los detalles
  # de cada item
  
  itemZmart <- data.frame(titulosZmart = textTitulosZmart, preciosZmart = textPreciosZmart)
  
  # [almacenando informacion 3] almacenando la info del producto con 
  # con los datos totales
  
  todosLosDatos <- rbind(todosLosDatos,itemZmart)
  break = 32
}

