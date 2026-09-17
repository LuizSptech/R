datasets::infert

df_infertil <- data.frame(infert)


# variaveis

# contínua
df_infertil$age

# discreta
df_infertil$induced

# nominal
df_infertil$case

# Variável ordinal
df_infertil$education


# 2. VISUALIZAÇÃO GRÁFICA

# CONTÍNUA - Idade

hist(df_infertil$age,
     main = "Histograma - Idade",
     xlab = "Idade",
     ylab = "Frequência")


# DISCRETA - Número de abortos induzidos

barplot(table(df_infertil$induced),
        main = "Frequência - Abortos Induzidos",
        xlab = "Número de abortos induzidos",
        ylab = "Frequência")




# NOMINAL - Caso

barplot(table(df_infertil$case),
        main = "Distribuição dos Casos",
        xlab = "Grupo",
        ylab = "Frequência")

# ORDINAL - Escolaridade

barplot(table(df_infertil$education),
        main = "Frequência - Escolaridade",
        xlab = "Nível de escolaridade",
        ylab = "Frequência")




# Explicação

#Histograma – Idade:
#O histograma mostra como as idades das mulheres estão distribuídas no conjunto de dados. 
#É possível observar quais faixas etárias possuem maior frequência e como os valores estão distribuídos.

#Gráfico de barras – Abortos induzidos:
#O gráfico apresenta a quantidade de mulheres para cada número de abortos induzidos. 
#Como induced representa uma contagem inteira, o gráfico de barras permite comparar facilmente a frequência de cada valor.

#Gráfico de barras – Caso:
#O gráfico mostra a frequência de cada categoria da variável case, 
#permitindo visualizar a quantidade de observações pertencentes a cada grupo.

#Gráfico de barras – Escolaridade:
#O gráfico mostra a frequência dos diferentes níveis de escolaridade. Como existe uma ordem entre os níveis, a variável é classificada como ordinal. 
#O gráfico permite identificar qual nível de escolaridade aparece com maior frequência.