set.seed(123)
quantidade <- 200


#Simulação de idade dos jogadores
idade <- round(rnorm(quantidade, mean = 25, sd = 6), digits = 0)


hist(idade,
     main = "idade dos jogadores",
     ylab = "Frequencia da idade",
     xlab = "Idade")

# Simulação de jogadores visitando a loja

visitas <- rpois(8, lambda = 30)

plot(visitas,
     main = "Visitas por hora",
     ylab = "Frequencia de visita",
     xlab = "horarios",
     col = "blue",
     type = "h",
     lwd = 10
     )


#Simulaçao do uso de cupons virtuais
com <- c("Com","Sem")
cupom <- rbinom(500,1, 0.45)

barplot(table(cupom), names.arg = c("Cupom usado", "Cupom não usado"), 
        ylab = "Quantidade de cupons",
        col = c("green","red")
        )



