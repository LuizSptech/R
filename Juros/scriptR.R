
# Valor objetivo
O <- 10000

# Quanto já tenho / valor mensal
C <- as.numeric(readline(prompt = "Quanto ja tenho "))

# Taxa de juros mensal (0,5%)
i <- 0.10

# Tempo em meses
t <- 54

# Cálculo do montante
simples <- C * (1 + i*t)

composto <-  C * (1+i)^t


# Valor que falta para atingir o objetivo
faltanteSimples <- max(0, O - simples)
faltanteComposto <- max(0,O - composto)

# Resultados
cat("\n--- RESULTADO ---\n")
cat("Montante acumulado: R$", round(simples, 2), "\n")
cat("Valor faltante: R$", round(faltanteSimples, 2), "\n")
cat("Montante acumulado: R$", round(composto, 2), "\n")
cat("Valor faltante: R$", round(faltanteComposto, 2), "\n")

if (faltanteSimples == 0) {
  cat("Parabéns! Você atingiu seu objetivo!\n")
} else {
  cat("Ainda falta para atingir seu objetivo.\n")
}



if (faltanteComposto == 0) {
  cat("Parabéns! Você atingiu seu objetivo!\n")
} else {
  cat("Ainda falta para atingir seu objetivo.\n")
}





library(ggplot2)

meses <- 0:t

dados <- data.frame(
  Mes = rep(meses, 2),
  Montante = c(
    C * (1 + i * meses),
    C * (1 + i)^meses
  ),
  Tipo = rep(c("Juros Simples", "Juros Compostos"), each = length(meses))
)

ggplot(dados, aes(x = Mes, y = Montante, color = Tipo)) +
  geom_line(linewidth = 1.2) +
  geom_hline(yintercept = O, linetype = "dashed", color = "red") +
  scale_y_continuous(
    breaks = seq(0, O * 1.5, by = O/3),
    limits = c(0, O * 1.5)
  ) +
  labs(
    title = "Juros Simples x Juros Compostos",
    x = "Meses",
    y = "Montante (R$)",
    color = "Investimento"
  ) +
  theme_minimal()
