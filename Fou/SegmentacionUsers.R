########################### lectura
remove(list=ls())
setwd("~/Desktop/MonocicloMorado/Fou")
files <- dir('RawData')
r <- read.csv('RawData/2019-01.csv', stringsAsFactors = FALSE)
for (i in files[2:9])
{
  path <- paste0('RawData/',i)
  print(path)
  r_ <- read.csv(path, stringsAsFactors = FALSE)
  r <- rbind(r, r_[, names(r)])
}
################### creacion de subdataset
library(dplyr)
r %>% select(Genero_Usuario, Edad_Usuario) %>% group_by(Genero_Usuario, Edad_Usuario)%>%
  summarise(freq = n()) -> x 
edad <- x %>% group_by()