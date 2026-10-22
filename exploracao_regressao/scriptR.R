library(ggplot2)
library(corrplot)

#EXTRACT
jogos_E <- games

#TRANSFORM
jogos_T <- jogos_E
jogos_T <- jogos_T[, -1]                       
jogos_T <- jogos_T[!duplicated(jogos_T), ]     
jogos_T[jogos_T == ""] <- NA
jogos_T <- na.omit(jogos_T)
nrow(jogos_T)
# transforma "3.9K" em 3900
converte_k <- function(x) {
  x <- trimws(as.character(x))
  numeros <- as.numeric(gsub("[Kk]", "", x))
  multiplicador <- ifelse(grepl("[Kk]", x), 1000, 1)
  return(round(numeros * multiplicador))
}

colunas_k <- c("Times.Listed", "Number.of.Reviews", "Plays",
               "Playing", "Backlogs", "Wishlist")

jogos_T[colunas_k] <- lapply(jogos_T[colunas_k], converte_k)

str(jogos_T[colunas_k])   # todas devem aparecer como num


jogos_T$Razao <- jogos_T$Wishlist / jogos_T$Plays
alvo <- jogos_T[jogos_T$Plays >= 1000, ]
alvo <- alvo[order(-alvo$Razao), c("Title", "Rating", "Plays", "Wishlist")]
head(alvo, 5)


#LOADING
jogos_L <- data.frame(jogos_T)

str(jogos_L[, c("Plays", "Backlogs", "Wishlist", "Number.of.Reviews")])



# 1) Distribuição das notas
ggplot(jogos_L, aes(x = Rating)) +
  geom_histogram(binwidth = 0.2, fill = "steelblue", color = "white") +
  labs(title = "Distribuição das notas", x = "Nota", y = "Quantidade de jogos")

# 2) Distribuição de plays (escala log)
ggplot(jogos_L, aes(x = Plays)) +
  geom_histogram(bins = 20, fill = "steelblue", color = "white") +
  scale_x_log10() +
  labs(title = "Distribuição de plays (escala log)", x = "Plays", y = "Quantidade de jogos")

# 3) Nota x nº de reviews
ggplot(jogos_L, aes(x = Number.of.Reviews, y = Rating)) +
  geom_point(alpha = 0.25, size = 1, color = "steelblue") +
  geom_smooth(method = "lm", color = "red") +
  scale_x_log10() +
  labs(title = "Nota x Nº de reviews (eixo X em log)", x = "Nº de reviews", y = "Nota")

# 4) Plays x nº de reviews
ggplot(jogos_L, aes(x = Number.of.Reviews, y = Plays)) +
  geom_point(alpha = 0.25, size = 1, color = "steelblue") +
  geom_smooth(method = "lm", color = "red") +
  scale_x_log10() + scale_y_log10() +
  labs(title = "Plays x Nº de reviews (eixos em log)", x = "Nº de reviews", y = "Plays")

# 5) Backlogs x wishlist
ggplot(jogos_L, aes(x = Wishlist, y = Backlogs)) +
  geom_point(alpha = 0.25, size = 1, color = "steelblue") +
  geom_smooth(method = "lm", color = "red") +
  scale_x_log10() + scale_y_log10() +
  labs(title = "Backlogs x Wishlist (eixos em log)", x = "Wishlist", y = "Backlogs")



# INSIGHTS e ANÁLISES

m1 <- lm(Plays ~ Number.of.Reviews, data = jogos_L)
m2 <- lm(Backlogs ~ Wishlist, data = jogos_L)
m3 <- lm(Rating ~ Plays, data = jogos_L)
summary(m1)
summary(m2)
summary(m3)



#usar as reviews como um termômetro, não como garantia 
#Passar de 1.000 reviews é um bom sinal de qualidade. Abaixo disso, o volume diz pouco, e vale olhar também o gênero e o conteúdo dos reviews.


#Estimar demanda pela wishlist. Como a wishlist explica bem os backlogs 
#ela serve para prever a fila de jogos a serem jogados. Quem lança jogos pode usá-la para planejar divulgação e capacidade.

#Priorizar os desejados e ainda pouco jogados. 
#Jogos como Dead Space e Metroid Prime Remastered têm nota alta e muita wishlist em relação aos plays. 
#São boas apostas para promoções ou campanhas.

#Não tomar plays como medida de qualidade.
#Com R² de 0,02, ser muito jogado não significa ser bem avaliado.

#////////////////////////////////////////////////////////////////////////////////////////////////////

# MATRIZ DE CORRELAÇÃO
colunas_num <- c("Rating", "Number.of.Reviews", "Plays", "Backlogs", "Wishlist")
matriz_cor <- cor(jogos_L[, colunas_num])
corrplot(matriz_cor, method = "color", addCoef.col = "black")

# R² DOS MODELOS
summary(m1)$r.squared
summary(m2)$r.squared
summary(m3)$r.squared

# EXPLICAÇÃO
# Reviews e Plays têm correlação forte (0.81) e o R² de m1 é 0.66:
# o nº de reviews explica cerca de 66% da variação dos plays.
# Wishlist e Backlogs também têm correlação forte (0.81) e o R² de m2 é 0.65.
# Já Rating e Plays têm correlação fraca (≈0.15) e R² de m3 de só ≈0.02:
# ser muito jogado quase não explica a nota do jogo.

# CONCLUSÃO
# A popularidade (reviews e wishlist) explica bem a demanda (plays e backlogs),
# mas não explica a qualidade (nota). Correlação não prova causa e efeito.


