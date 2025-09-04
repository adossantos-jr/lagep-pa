# passo 1 - diretorios e pacotes

setwd('C:/Users/alexa/OneDrive/Área de Trabalho/outras_coisas/data_camp')

library(tidyverse)
library(readxl)


dados = read_xlsx('dados_alb_branca.xlsx')

# passo 2 - operacoes basicas

## somas

sum(dados$alb_branca_peso) # eita, tem que remover os NAs

## como remover NAs facilmente (usando pipe e sem pipe)
## aqui tambem ensinar a criar um objeto

dados1 = 
dados %>% 
  mutate_if(is.numeric, ~replace_na(., 0)) 

## agora a gente consegue somar, tirar medias e etc

mean(dados1$alb_branca_peso)
mean(dados1$alb_branca_num)

max(dados1$alb_branca_num)

max(dados1$sal)

## por ai vai

# manipulando e extraindo

# extraindo mes, ano e trimestre
library(lubridate)


dados1$ano = year(dados1$data)
dados1$mes = month(dados1$data)
dados1$trimestre = quarter(dados1$data)

# subsets (em pipe & criando objetos)

primeiro_tri = subset(dados1, trimestre == 1)
segundo_tri = subset(dados1, trimestre == 2)

## tambem comparar as medias

m1 = mean(primeiro_tri$alb_branca_peso)
m2 = mean(segundo_tri$alb_branca_peso)

m2 - m1

# salvando 

dados1 %>%
writexl::write_xlsx('dados_alb_branca_limpos.xlsx')



