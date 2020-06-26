# EP1 - Script Alunos
# Nome:
# Num USP:

# Este script tem uma solução parcial do EP1 
# Como vários dos comandos estão incompletos, foram colocados como comentários.
# Vá retirando o símbolo de comentários "#" à medida que for completando os comandos

# opção para imprimir números reais com 2 casas decimais (para ficar mais fácil de ler na tela)
options(digits = 2)

#--------------------------------
# leitura das planilhas
#--------------------------------
## planilha municípios com convid-19
df_municipios <- read.csv(file = "scripts/eps/dados/covid.municipios.SP.csv", 
                          header = TRUE,                     # com header 
                          sep = ",",                         # separador ","
                          fill = TRUE,                       # preenche com NA células vazias
                          as.is = TRUE)                      # lê e armazena os caracteres com o tipo caracter

print(df_municipios)   # só para ver os dados na tela

# Ordena a Planilha pela coluna Municipio
df_municipios <- df_municipios[order(as.character(df_municipios$Municipio)),]

#-------
## planilha população - municípios SP
df_pop <- read.csv(file = "pop.SP.2020.csv", 
                   header = TRUE,                     # com header 
                   sep = ",",                         # separador ","
                   fill = TRUE,                       # preenche com NA células vazias
                   as.is = TRUE                      # lê e armazena os caracteres com o tipo caracter
)

print(df_pop)  # só para ver os dados na tela


#-------------------------------------------------------------------
# novo data-frame - info dos municípios e população correspondente
#-------------------------------------------------------------------

# para gerar este data-frame:
# lembre-se de que as planilhas precisam estar ordenadas pela coluna dos nomes dos municípios
# conteúdo do data-frame: informações do df_municipios +
#                         população, grau urb, infectados/100mil, óbitos/100mil
# Nomes das colunas:
    # Municipio
    # Grande regiao
    # Num Casos
    # Num obitos
    # Pop
    # Grau.Urb
    # infec.100mil
    # obitos.100mil

#df_municipios_pop <- ... Completar ...


#-------------------------------------------------------------------
# novo data-frame e planilha - municípios predominantemente Rurais
#-------------------------------------------------------------------

df_rural <- ... Complete ...

# gravar a planilha
write.table(df_rural, file = "plan.covid.rural.csv" , 
            quote = FALSE,         # sem aspas
            sep = ",",             # separador ","
            row.names = FALSE)     # sem numeração das linhas



#-------------------------------------------------------------------
# novo data-frame e planilha - municípios predominantemente Urbanos
#-------------------------------------------------------------------

#df_urbano <- ... Complete ...

# gravar a planilha
write.table(df_urbano, file = "plan.covid.urbana.csv" , 
            ...complete... ,         # sem aspas
            ...complete... ,         # separador ","
            ...complete...           # sem numeração das linhas
)




##### Final do EP #####
############################################################################

# Outros extratos das planilhas - SÓ PARA DIVERSÃO

# municípios infectados com óbitos: extrato do df


# municípios infectados sem óbitos: extrato do df


# municípios infectados com óbitos mas com pop predominantemente rural: extrato do df


# municípios infectados sem óbitos mas com pop predominantemente urbana: extrato do df


# fazer gráficos  para ver os dados de uma outra forma!!



