entregas <- entregas.ccoa
head(entregas)

#media
round(mean(entregas$Entrega.01), digits = 1)
round(mean(entregas$Entrega.02), digits = 1)
round(mean(entregas$Entrega.03), digits = 1)
#mediana

median(entregas$Entrega.01)
median(entregas$Entrega.02)
median(entregas$Entrega.03)

#desvio

desvio01 <- round(sd(entregas$Entrega.01), digits = 1)

desvio02 <- round(sd(entregas$Entrega.02), digits = 1)
desvio03 <- round(sd(entregas$Entrega.03), digits = 1)
print(desvio01)
print(desvio02)
print(desvio03)



#histograma

#=========================================================
# ENTREGA 1
hist(entregas$Entrega.01,
     main = "Historiagrama - Entrega -01",
     xlab = "Nota")

abline(v = mean(entregas$Entrega.01),
       col = "blue",
       lwd = 5)

abline(v = median(entregas$Entrega.01),
       col = "red",
       lwd = 5)
#=========================================================
# ENTREGA2


hist(entregas$Entrega.02,
     main = "Historiagrama - Entrega -02",
     xlab = "Nota")

abline(v = mean(entregas$Entrega.02),
       col = "blue",
       lwd = 5)

abline(v = median(entregas$Entrega.02),
       col = "red",
       lwd = 5)

#=========================================================
#ENTREGA3


hist(entregas$Entrega.03,
     main = "Historiagrama - Entrega -03",
     xlab = "Nota")

abline(v = mean(entregas$Entrega.03),
       col = "blue",
       lwd = 5)

abline(v = median(entregas$Entrega.03),
       col = "red",
       lwd = 5)



#ANALISE POR ALUNO

entregas$final <- round((entregas$Entrega.01 +
                     entregas$Entrega.02 +
                     entregas$Entrega.03 ) / 3, 2)


#Maior/Menor media

maior <- entregas[which.max(entregas$final),]
menor <- entregas[which.min(entregas$final),]


hist(entregas$final,
     main = "Média final dos alunos",
     xlab = "Média final",
     ylab = "Quantidade de alunos")


#01 - As notas da primeira entregas são semelhantes, agora o restante tem diversos numeros pós virgula
#02 - A terceira entrega tem uma maior variedade de notas abaixo da media
#03 - Sim
#04 - Ajuda sim, e possivel tirar observações como um bom nivelamento da sala por conta de um baixo desvio
#05 - O unico histrograma que que talvez tivesse alguma evidencia seria o da entrega 3, o restante não
#06 - Os histogramas com execeção do terceiro não apresentam simétrica
#07 - Sim para o lado direito do grafico
#08 - Os alunos tiveram um melhor desempenho na entrega 2 com uma media de 8,7 e desvio de 1 entre as notas
#09 - A terceira entrega teve uma maior dificuldade e desigualdade com 6.5 de media e um desvio de 1.9 entre as notas
