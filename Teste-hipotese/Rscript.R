# Luiz Fernando Silva Correia | 04261130 | 1CCOB


set.seed(123)
alpha    <- 0.05
n_sexta  <- 8
n_segqui <- 32

# H0: mu_sexta = mu_segqui | H1: mu_sexta < mu_segqui
testar_cenario <- function(nome, mu_segqui, mu_sexta, sigma) {
  segqui <- rnorm(n_segqui, mu_segqui, sigma)
  sexta  <- rnorm(n_sexta,  mu_sexta,  sigma)
  
  v1 <- var(sexta) / n_sexta
  v2 <- var(segqui) / n_segqui
  gl <- (v1 + v2)^2 / (v1^2 / (n_sexta - 1) + v2^2 / (n_segqui - 1))
  
  t_crit <- qt(alpha, gl)
  t_obs  <- (mean(sexta) - mean(segqui)) / sqrt(v1 + v2)
  p_valor <- pt(t_obs, gl, lower.tail = TRUE)
  
  inicio <- min(-6, t_obs - 1)
  curve(dt(x, gl), from = inicio, to = 4,
        main = paste(nome, "- região crítica (laranja) e estatística t"),
        cex.main = 0.9, ylab = "Densidade", xlab = "t")
  x_rc <- seq(inicio, t_crit, length.out = 200)
  polygon(c(x_rc, t_crit, inicio), c(dt(x_rc, gl), 0, 0),
          col = rgb(1, 0.65, 0, 0.4), border = NA)
  abline(v = t_crit, col = "orange", lwd = 2)
  abline(v = t_obs, col = "blue", lwd = 2)
  
  cat("\n====", nome, "====\n")
  cat("gl =", round(gl, 2), "| t crítico =", round(t_crit, 3),
      "| t observado =", round(t_obs, 3), "| p-valor =", round(p_valor, 4), "\n")
  if (t_obs < t_crit) {
    cat("t observado está na RC -> rejeita H0: sexta é mais vazia.\n")
  } else {
    cat("t observado fora da RC -> não rejeita H0: sem evidência de que sexta seja mais vazia.\n")
  }
  
  print(t.test(sexta, segqui, alternative = "less"))
}

par(mfrow = c(3, 1))
testar_cenario("A (diferença grande)",  5000, 4000, 600)
testar_cenario("B (H0 verdadeira)",     5000, 5000, 600)
testar_cenario("C (diferença pequena)", 5000, 4750, 600)
par(mfrow = c(1, 1))
