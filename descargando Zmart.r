setwd("C:/Users/Alumno/Desktop/Trabajo_BigData")

#instalarndo Rvest
# install.packages("rvest")
# install.packages("gdata")

library(rvest)
library(gdata)


# DESCARGANDO PAGINA ZMART (JUEGOS PS4)
zmartPs4 <- read_html("https://www.zmart.cl/JuegosPS4")

# LISTADO DE PRODUCTOS PS4
listadoPs4 <- html_nodes(zmartPs4, css = "#ProdDisplayType5_32641_Products")

# TITULOS DE LOS PRODUCTOS PS4
titulosPs4 <- html_nodes(listadoPs4, ".BoxProductoS2_Descripcion")
textoTitulosPs4 <- html_text(titulosPs4)

for (n in 1:length(textoTitulosPs4)) {
  print(textoTitulosPs4[n])
}


# PRECIOS DE LOS PRODUCTOS PS4
preciosPs4 <- html_nodes(listadoPs4, ".BoxProductoS2_Precio")
textoPreciosPs4 <- html_text(preciosPs4)

for (k in 1:length(textoPreciosPs4)) {
  print(textoPreciosPs4[k])
}

# [ALMACENANDO INFORMACION 1] CREACION DE UN DATAFRAME DE PS4

todosLosDatosPs4 <- data.frame()


for (i in 1:length(textoTitulosPs4)) {
  print("========== ITEM ==========")
  
  # nombre del juego:
  print(textoTitulosPs4[i])
  
  # precio:
  textoPreciosPs4 <- gsub("[.]","",textoPreciosPs4)
  textoPreciosPs4 <- as.numeric(textoPreciosPs4)
  print(textoPreciosPs4[i])
  
  # [ALMACENANDO INFORMACION 2] CREANDO DATAFRAME CON LOS DETALLES
  # DE CADA ITEM
  
  itemPs4 <- data.frame(titulosPs4 = textoTitulosPs4, 
                             preciosPs4 = textoPreciosPs4)
  
  # [ALMACENANDO INFORMACION 3] ALMACENANDO LA INFO DEL PRODUCTO CON 
  # LOS DATOS TOTALES
  
  todosLosDatosPs4 <- rbind(todosLosDatosPs4,itemPs4)
  break = 32
}

library(dplyr)
todosLosDatosPs4 <- mutate(todosLosDatosPs4, plataforma = "PlayStation 4")



############################################################################



# DESCARGANDO PAGINA ZMART (JUEGOS XBOX ONE)
zmartXbox <- read_html("https://www.zmart.cl/JuegosXBONE")

# LISTADO DE PRODUCTOS XBOX ONE
listadoXbox <- html_nodes(zmartXbox, css = "#ProdDisplayType5_32654_Products")

# TITULOS DE LOS PRODUCTOS XBOX ONE
tituloDelJuego <- html_nodes(listadoXbox, ".BoxProductoS2_Descripcion")
textoTitulosXbox <- html_text(tituloDelJuego)

for (x in 1:length(textoTitulosXbox)) {
  print(textoTitulosXbox[x])
}



# PRECIOS DE LOS PRODUCTOS XBOX ONE
precioDelJuego <- html_nodes(listadoXbox, ".BoxProductoS2_Precio")
textoPreciosXbox <- html_text(precioDelJuego)

for (o in 1:length(textoPreciosXbox)) {
  print(textoPreciosXbox[o])
}



# [ALMACENANDO INFORMACION 1] CREACION DE UN DATAFRAME DE XBOX ONE

todosLosDatosXbox <- data.frame()


for (u in 1:length(textoTitulosXbox)) {
  print("========== ITEM ==========")
  
  # nombre del juego:
  print(textoTitulosXbox[u])
  
  # precio:
  textoPreciosXbox <- gsub("[.]","",textoPreciosXbox)
  textoPreciosXbox <- as.numeric(textoPreciosXbox)
  print(textoPreciosXbox[o])
  
  # [ALMACENANDO INFORMACION 2] CREANDO DATAFRAME CON LOS DETALLES
  # DE CADA ITEM
  
  itemXbox <- data.frame(tituloDelJuego = textoTitulosXbox, 
                         precioDelJuego = textoPreciosXbox)
  
  # [ALMACENANDO INFORMACION 3] ALMACENANDO LA INFO DEL PRODUCTO CON 
  # LOS DATOS TOTALES
  
  todosLosDatosXbox <- rbind(todosLosDatosXbox,itemXbox)
  break = 32
  
}

library(dplyr)
todosLosDatosXbox <- mutate(todosLosDatosXbox, plataforma = "XBOX ONE")










