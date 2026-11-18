
# Dataset: Marketing A/B Testing (Kaggle, faviovaz/marketing-ab-testing)
# https://www.kaggle.com/datasets/faviovaz/marketing-ab-testing?resource=download
# Controle = psa (anúncio de utilidade pública) | Variante = ad (anúncio)
# Variável: converted (comprou ou não) -> Bernoulli/Binomial
# H0: p_ad = p_psa | H1: p_ad > p_psa (teste unilateral à direita)

alpha <- 0.05

d <- read.csv("marketing_AB.csv")
d$converted <- tolower(as.character(d$converted)) == "true"
n_ad  <- sum(d$test.group == "ad");  x_ad  <- sum(d$converted[d$test.group == "ad"])
n_psa <- sum(d$test.group == "psa"); x_psa <- sum(d$converted[d$test.group == "psa"])

p_ad  <- x_ad / n_ad
p_psa <- x_psa / n_psa
cat("Taxa de conversão ad:", round(100 * p_ad, 2), "% | psa:", round(100 * p_psa, 2), "%\n")
cat("Grupo com mais sucesso:", ifelse(p_ad > p_psa, "variante (ad)", "controle (psa)"), "\n")

# Teste z para duas proporções (aproximação normal da binomial)
p_pool <- (x_ad + x_psa) / (n_ad + n_psa)
ep     <- sqrt(p_pool * (1 - p_pool) * (1 / n_ad + 1 / n_psa))
z_obs  <- (p_ad - p_psa) / ep
z_crit <- qnorm(1 - alpha)
p_valor <- pnorm(z_obs, lower.tail = FALSE)
cat("z crítico =", round(z_crit, 3), "| z observado =", round(z_obs, 3),
    "| p-valor =", format(p_valor, scientific = TRUE, digits = 3), "\n")

# Distribuição normal padrão sob H0 com a região crítica
curve(dnorm(x), from = -4, to = max(4, z_obs + 1),
      main = "Normal padrão sob H0: região crítica (laranja) e z observado",
      xlab = "z", ylab = "Densidade", cex.main = 0.9)
x_rc <- seq(z_crit, max(4, z_obs + 1), length.out = 200)
polygon(c(z_crit, x_rc, max(4, z_obs + 1)), c(0, dnorm(x_rc), 0),
        col = rgb(1, 0.65, 0, 0.4), border = NA)
abline(v = z_crit, col = "orange", lwd = 2)
abline(v = z_obs, col = "blue", lwd = 2)
legend("topleft", bty = "n", lwd = 2, col = c("orange", "blue"),
       legend = c(paste("z crítico =", round(z_crit, 3)),
                  paste("z observado =", round(z_obs, 2))))

if (z_obs > z_crit) {
  cat("z observado está na RC -> rejeita H0: a diferença é estatisticamente significante.\n")
} else {
  cat("z observado fora da RC -> não rejeita H0: sem evidência de que ad converta mais.\n")
}

# Confirmação com a função pronta (X-squared = z^2 com correct = FALSE)
prop.test(x = c(x_ad, x_psa), n = c(n_ad, n_psa),
          alternative = "greater", correct = FALSE)

