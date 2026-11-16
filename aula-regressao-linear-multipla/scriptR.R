library(corrplot)
library(ggplot2)
dados <- cor(advertising, method = "pearson")
corrplot(dados, method = "number", order = "hclust")
regressaoLinear <- lm(advertising$Sales ~ advertising$TV + advertising$Newspaper
                      
                      advertising$Radio)

ggplot(advertising, aes(x = TV, y = Sales, size = Radio, colour = Newspaper)) +
  geom_point() +
  geom_smooth(method = "lm",
              se = FALSE,
              colour = "red") +
  theme_minimal()




# ANÁLISE DO DATASET ADVERTISING

# ANÁLISE DA CORRELAÇÃO DE PEARSON:
# A televisão apresenta a maior correlação com as vendas (0.90),
# indicando uma relação positiva muito forte. O rádio apresenta uma
# correlação moderada (0.35), enquanto os jornais apresentam uma
# correlação fraca (0.16).

# ANÁLISE DO GRÁFICO DE DISPERSÃO:
# O gráfico demonstra uma tendência crescente entre os investimentos
# em televisão e o volume de vendas. A linha de regressão reforça essa
# relação positiva. O tamanho e a cor dos pontos representam os
# investimentos em rádio e jornais.

# CONCLUSÃO:
# Os resultados indicam que a televisão é o meio publicitário com maior
# associação ao volume de vendas, seguida pelo rádio. Já os jornais
# apresentam pouca relação com os resultados. Portanto, os dados sugerem
# que os investimentos em televisão e rádio são os mais relevantes para
# explicar as variações nas vendas.
