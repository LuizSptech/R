#-1 Criação do Data Frame
hist(df_grupo$cpu1)





# -2 Análise Exploratoria dos Dados
#Média
medias <- aggregate(ram_uso ~ usuario, data = df_grupo, FUN = mean)
print(medias)
medias_cpus <- aggregate(cpu_uso_geral ~ usuario, data = df_grupo, FUN = mean)
print(medias_cpus)

# -3 Visualização de dados

barplot(medias$ram_uso)
plot(medias$ram_uso,medias_cpus$cpu_uso_geral,
     main = "Relação Ram e CPU",
     xlab = "CPU%",
     ylab = "Ram",
     col = "#f11")
