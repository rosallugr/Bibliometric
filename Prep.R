# 1. Cargar librerías
if (!require(bibliometrix)) install.packages("bibliometrix")
library(bibliometrix)

# 2. Definir archivo de entrada
archivo <- "wos_unificado_2.txt"

# 3. Convertir archivo WoS al formato bibliometrix
M <- convert2df(file = archivo, dbsource = "wos", format = "plaintext")

# 4. Lanzar Biblioshiny con los datos
biblioshiny(M)