library(readr)

#Exercício 1.##############################################################
# leitura das planilhas e criação dos data-frames

df_covidMundo       <- read.csv(file = "mundoCovid19.csv", 
                             header = TRUE, sep = ",", 
                             fill = TRUE, 
                             stringsAsFactors = FALSE)  # lê a planilha)

# imprime as 10 primeiras linhas de um data-frame
# imprime as 6 primeiras linhas se não tiver o n=
head(df_covidMundo, n=10L)


#Exercício 2##############################################################
# 

subs_NA_por_zero <- function(df_coluna) {
  numRow <- length(df_coluna)
# completar
  return(df_coluna)
}

head(df_covidMundo)
df_covidMundo["deaths"] <- subs_NA_por_zero(df_covidMundo$deaths)
head(df_covidMundo)



#Exercício 3############################################################################
# função: calcula o número de óbitos em um continente em um determinado mês/ano
# entrada: df, continente, mês, ano
# saída: total do número de óbitos

obitos_continente_mes <- function(df, cont, mes, ano){
  obitos <- 0
  # completar
  return(obitos)
}


resposta <- obitos_continente_mes(df_covidMundo,"Africa", 5, 2020)
cat("Número de óbitos na África durante o mês de Maio/2020:", resposta)

#Exercício 4 #################################################################
# função: calcula o número de óbitos em uma data
# entrada: df, dia, mês, ano
# saída: total do número de óbitos no dia

obitos_dia <- function(df, dia, mes, ano) {
  obitos <- 0 
  
  # completar
  
  return(obitos)
}

resposta <- obitos_dia(df_covidMundo, 26, 4, 2020)
cat("Número de óbitos no mundo no dia 26/04/2020:  ", resposta)

#Exercício 5 ############################################################
# função: procura o país/data que notificou o maior número de óbitos em 1 único dia
# entrada: df
# saída: número de óbitos, data e país

maior_obitos_pais_data <- function(df) {
  data <- NA # inicialmente indefinida
  deaths <- -1
  
  # completar
  
  return(c(deaths, data, country))
}

resposta <- maior_obitos_pais_data(df_covidMundo)
cat("O maior número de óbitos: ", resposta[1]," \n \t ocorreu em ", resposta[2],
    "\n \t no país: ", resposta[3])


#Exercício 6 ############################################################
# função: calcula data com o maior número de óbitos em 1 dia em um continente
# entrada: df, continente
# saída: data de maior número de óbitos no dado continente e o número de óbitos

maior_obitos_continente <- function(df, continente) {
  deaths <- -1
  data_maior_deaths <- NA  # data inicialmente indefinida
  df_cont <- subset(df, df$continentExp == continente)
  coluna_datas <- df_cont$dateRep  # vetor de datas de notificações
  v_datas <- coluna_datas[!duplicated(coluna_datas)] # datas sem duplicação
  for (data in v_datas) {
    deaths_data <- sum(subset(df_cont$deaths, df_cont$dateRep == data))
    # completar
    
  }

  return(c(data_maior_deaths, deaths))
}

resposta <- maior_obitos_continente(df_covidMundo, "Europe")
cat("Dia com o maior número de óbitos na Europa: ", resposta[1],
    "\n \t número de óbitos:", resposta[2])


#Exercício 7 ###########################################################
# função: país de um dado continente com o registro de mais óbitos em uma data
# entrada: df, continente, data
# saída: país com mais óbitos naquela data e o número de óbitos no país

pais_maior_obitos_continente_data <- function(df, continente, data_obitos) {
  deaths <- -1
  country <- NA  # país indefinido
  df_cont <- subset(df, df$continentExp == continente & 
                        df$dateRep == data_obitos)
  max_obitos <- max(df_cont$deaths)
  
  # completar
  
  return(c(country, deaths))
}

data_obitos <- maior_obitos_continente(df_covidMundo, "Europe")
data <- data_obitos[1]
obitos <- data_obitos[2]
resposta <- pais_maior_obitos_continente_data(df_covidMundo, "Europe", data)
cat("\n Número total de óbitos na Europa no dia", data, "--" , obitos)
cat("País europeu com o maior número de óbitos nesta data: ", resposta[1], 
    "\n \t com um total de óbitos: ", resposta[2])


