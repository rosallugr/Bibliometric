print("Hola mundo")

# Establece el directorio donde están tus archivos
setwd("/Users/rosa.equilatera/Prueba Bibliométrico")

# Carga la librería bibliometrix
library(bibliometrix)

# Lista los archivos .txt originales (los de WoS)
files <- list.files(pattern = "\\.txt$")

# Imprime los nombres de los archivos para verificar
print(files)

# Crea el objeto M desde los archivos originales de WoS
M <- convert2df(files, dbsource = "wos", format = "plaintext")

# Guardar M para usar siempre (el .txt unificado da error)
saveRDS(M, file = "wos_unificado.rds")

## Cuando quiera usar M en el futuro para ir diretamente a biblioshiny:
M <- readRDS("wos_unificado.rds")

biblioshiny()

library(readr)
# Leer el tesauro VOSviewer
vos <- read.csv("thesaurus.csv")

# Agrupar todos los términos que se reemplazan por el mismo
library(dplyr)

synonym_groups <- vos %>%
  group_by(replaceby) %>%
  summarise(synonyms = paste(unique(c(replaceby, label)), collapse = ",")) %>%
  pull(synonyms)

# Guardar como archivo TXT
writeLines(synonym_groups, "sinonimos_biblioshiny.txt")


biblioshiny()
