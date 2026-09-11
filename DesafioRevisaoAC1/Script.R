notas <- notas.ccob
head(notas)

desvio_entrega01 <- sd(notas$Entrega.01)
desvio_entrega02 <- sd(notas$Entrega.02)
desvio_entrega03 <- sd(notas$Entrega.03)
desvio_integrada <- sd(notas$Integrada)
desvio_pratica <- sd(notas$Pratica)

mean(notas$Entrega.03)



media_notas <-mean(desvio_entrega01,desvio_entrega02,desvio_entrega03,desvio_integrada,desvio_pratica)
media_notas
########  [histograma entrega01] ####################

hist(notas$Entrega.01,
     main = "histograma - entrega01",
     xlab = "notas")


abline(v = median(notas$Entrega.01),
       col = "blue",
       lwd = 5)

########  [histograma entrega02] ####################

hist(notas$Entrega.02,
     main = "histograma - entrega02",
     xlab = "notas")


abline(v = median(notas$Entrega.02),
       col = "blue",
       lwd = 5)

########  [histograma entrega03] ####################

hist(notas$Entrega.03,
     main = "histograma - entrega03",
     xlab = "notas")


abline(v = median(notas$Entrega.03),
       col = "blue",
       lwd = 5)

########  [histograma Integrada] ####################

hist(notas$Integrada,
     main = "histograma - Integrada",
     xlab = "notas")


abline(v = median(notas$Integrada),
       col = "blue",
       lwd = 5)

########  [histograma pratica] ####################

hist(notas$Pratica,
     main = "histograma - Pratica",
     xlab = "notas")


abline(v = mean(notas$Pratica),
       col = "blue",
       lwd = 5)


 
# 1 as notas com execessão da entrega 2 possuem uma variação de 1/1,5 
# 2 a entrega 3 apresenta maior disperção
# 3 as notas parecem assimetricas, estão concentradas do lado direito do grafico]
# 4 depende da entrega 
# 5 não

# 1 a entrega 1 teve a maior media
# 2 a entrega 3 teve o maior desvio 
# 3 a turma teve um melhor desempenho na entrega 2
# 4 a entrega 1 apresenta uma maior desigualdade



notas$final <- round((notas$Entrega.01 +
                        notas$Entrega.02 +
                        notas$Entrega.03 +
                      notas$Integrada +
                        notas$Pratica) / 5, 2)


View(notas$final)
