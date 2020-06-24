
## Script EP3 - resposta parcila do EP
## não mude o nome do script
## complete cada uma das funções pedidas 
## não mude o nome das funções e nem dos data-frames


#Exercício 1.##############################################################
# leitura das planilhas e criação dos data-frames

df_covidMundo       <- read.csv(file = "mundoCovid19.csv", 
                             header = TRUE, sep = ",", 
                             fill = TRUE, 
                             stringsAsFactors = FALSE)  # lê a planilha


# imprime as 10 primeiras linhas do data-frame
head(df_covidMundo, n=10L)


#Exercício 2 ##############################################################
# 

subs_NA_por_zero <- function(df_coluna) { # NÃO MODIFIQUE
  ## Completar
  return(df_coluna) # NÃO MODIFIQUE
}

df_covidMundo["deaths"] <- subs_NA_por_zero(df_covidMundo$deaths)
head(df_covidMundo)

#Exercício 3 ######################################################
# função: calcula país com mais óbitos em um continente
# entrada: df, continente
# saída: país e total do número de óbitos no país

pais_mais_obitos_continente <- function(df, continente){  # NÃO MODIFIQUE
  df_cont <- subset(df, df$continentExp == continente) # df do continente
  coluna_paises <- df_cont$countriesAndTerritories     # coluna dos países
  v_paises_cont <- coluna_paises[!duplicated(coluna_paises)] # vetor dos países 
                                                             # sem duplicar nomes
  obitos <- -1  # número de óbitos inicialmente (fictício)
  pais_result <- NA # país com maior número de óbitos - inicialmente indefinido
  for (pais in v_paises_cont) {
    df_pais <- subset(df_cont, ) # Completar - extrato do df apenas para o pais
    obitos_pais <- sum()         # Completar - soma dos óbitos no país
    if (obitos < obitos_pais) {
      # Completar
    }
  }
  return(c(pais_result,obitos))  # NÃO MODIFIQUE
}

# exemplo de uso:
result <- pais_mais_obitos_continente(df_covidMundo, "America")
cat("\n País com maior número de óbitos no continente: America - número de óbitos \n")
cat(result[1], " -- ", result[2])


#Exercício 4 ##################################################################
# função: usando a função do item anterior, gera um data-frame com os continentes 
#         e os respectivos países que registraram o maior número de óbitos
# entrada: df_covidMundo
# saída: df com continente, o respectivo país com maior número de óbitos e o num de óbitos

continentes_paises_obitos <- function(df){ # NÃO MODIFIQUE
  # vetor dos continentes
  coluna_continentes <- df$continentExp
  v_continentes <-  coluna_continentes[!duplicated(coluna_continentes)]

  # df com colunas continente, país e num de óbitos no país - inicialmente vazio
  df_resultado <- data.frame(c(), c(), c())

  # calcula o país para cada continente - se quiser, mude para outro comd de repetição
  for(cont in v_continentes){
    pais_mais_obitos <- # completar - use a função do item anterior
    df_resultado <- rbind(df_resultado, data.frame(#Completar
                                                  )
                          )                       # continente, país, número de óbitos país
                                                      
  }

  # coloca header no data-frame
  names(df_resultado) <- c("Continente", "Pais", "NumObitos")
  
  return(df_resultado) # NÃO MODIFIQUE
}

# exemplo de uso:

df_cont_paises <- continentes_paises_obitos(df_covidMundo)
# imprime resposta
cat("\n Países com maior número de óbitos em cada continente")
print(df_cont_paises)


#Exercício 5 ############################################################
# essas funções já estão implementadas - apenas use para ver o resultado

# função: calcula a semana de uma data
# entrada: data (dd/mm/aaaa)
# saída: um inteiro - i-ésima semana do ano
semana_do_ano <- function(data){
   date <- as.Date(data, format="%d/%m/%Y")
   weeknum <- format(date, format="%U")
   return(as.integer(weeknum))
}

# função: gera um vetor de número de semanas de uma data inicial a uma final
# entrada: data (dd/mm/aaaa) incial - data final
# saída: vetor do número das semanas
gera_vetor_semanas <- function(first_date, last_date){
  v_dates <- semana_do_ano(first_date):semana_do_ano(last_date)
  return(v_dates)
}

semana_do_ano("01/01/2020")
semana_do_ano("04/01/2020")
semana_do_ano("05/01/2020")
semana_do_ano("08/01/2020")

gera_vetor_semanas("01/01/2020", "14/03/2020")
gera_vetor_semanas("01/01/2020", "18/03/2020")


#Exercício 6 ############################################################
# função: calcula os óbitos do país a cada semana do ano 
# entrada: df_covid, país, data início, data final
# saída: vetor com o num de óbitos para cada semana (semana, óbitos)

obitos_por_semana_no_pais <- function(df_pais, v_semanas){ # NÃO MODIFIQUE
  # acrescenta uma coluna com as semanas no df_pais
  coluna_semanas <- NULL
  for (data in df_pais$dateRep){
    sem <- semana_do_ano(data)
    coluna_semanas <- c(coluna_semanas, sem)
  }
  df_pais$week <- coluna_semanas # imprima df_pais para ver o que foi acrecentado
  
  # calcula soma de óbitos em cada semana para o dado país e gera um vetor...
  # para cada semana, calcula os óbitos e adiciona ao vetor abaixo
  v_obitos_semana <- NULL
  for (semana in v_semanas){
    ## completar
    total_obitos <- ## completar com o total de óbitos na semana
    v_obitos_semana <- c(v_obitos_semana, total_obitos)
  }
  return(v_obitos_semana)  # NÃO MODIFIQUE
}


## Resumo dos países com o maior número de óbitos por continente - cada semana

## datas consideradas
data_ini = "01/01/2020"
data_fim = "18/05/2020"

v_semanas <- gera_vetor_semanas(data_ini, data_fim) # vetor de semanas
df_paises_semanas_obitos <- data.frame(v_semanas)   # primeira coluna do df
# a ser gerado (as semanas)
df_cont_paises <- continentes_paises_obitos(df_covidMundo) #df - continentes e países
#com maior número de óbitos
v_paises <- df_cont_paises$Pais                     # o vetor de países

# criar um data-frame com o número de óbitos dos países por semana
for (pais in v_paises){ 
  # cria o df do país
  df_pais <- subset(df_covidMundo, df_covidMundo$countriesAndTerritories == pais)
  # cria um vetor com o num de óbitos (por semana) para o dado pais
  v_semana_obitos_pais <- obitos_por_semana_no_pais(df_pais, v_semanas)
  # acrescenta a coluna de óbitos por semana para o país ao df a ser gerado
  df_paises_semanas_obitos <- cbind(df_paises_semanas_obitos, 
                                    v_semana_obitos_pais)
}

# coloca o header no data-frame (Semana e o nome dos países) no df gerado
names(df_paises_semanas_obitos) <- c("Semana",as.character(v_paises))

cat("\n Resumo dos países com o maior número de óbitos nos continentes - \n
    \t de: ", data_ini, "  até: ", data_fim, "\n " )

print(df_paises_semanas_obitos)


## evolução de óbitos no Brasil

v_semanas <- gera_vetor_semanas(data_ini, data_fim) # vetor de semanas
df_brasil <- subset(df_covidMundo, df_covidMundo$countriesAndTerritories == "Brazil")
v_semana_obitos_pais <- obitos_por_semana_no_pais(df_brasil, v_semanas)
#print(df_brasil)
print(data.frame(Semana = v_semanas, Brazil = v_semana_obitos_pais))
