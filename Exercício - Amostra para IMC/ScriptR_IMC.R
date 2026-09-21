n <- 50

# EXPLICAÇÃO PERSONA:
# A persona representa atletas de diferentes esportes e níveis,
# com características variadas como idade, altura, peso e salário.


Atletas <- data.frame(
  
  idade = sample(17:41, n, replace = TRUE),
  altura = sample(seq(1.50, 2.10, by = 0.01), n, replace = TRUE),
  peso = sample(60:90, n, replace = TRUE),
  sexo = sample(c("Masculino","Feminino"), n, replace = TRUE),
  nivel = sample(
    c("Varzea","amador","Baixa Categoria","Profissional","Elite"),
    n,
    replace = TRUE,
    prob = c(0.3, 0.2, 0.2, 0.2, 0.1)
  ), 
  Esporte = sample(
    c("Futebol","Volei", "Basquete", "Futsal"),
    n,
    replace = TRUE,
    prob = c(0.1, 0.3, 0.4, 0.2)
  ), 
  salario = sample(1200:30000, n, replace = TRUE),
  carros = sample(
    c("Nenhum", "Um", "Dois", "Três ou mais"),
    n,
    replace = TRUE,
    prob = c(0.4, 0.2, 0.3, 0.1)
  ),
  filhos = sample(
    c("Nenhum", "Um", "Dois", "Três ou mais"),
    n,
    replace = TRUE,
    prob = c(0.4, 0.2, 0.3, 0.1)
  )
)



# CONTINUA:


hist(Atletas$altura,
     main = "Distribuição da Altura dos Atletas",
     xlab = "Altura (m)",
     ylab ="Frequência")



hist(Atletas$salario,
     main = "Distribuição do Salário dos Atletas",
     xlab = "Salário (R$)",
     ylab = "Frequência")




# DISCRETA

hist(Atletas$idade,
     main = "Distribuição da Idade dos Atletas",
     xlab = "Idade",
     ylab = "Frequência")


# NOMINAIS



barplot(table(Atletas$Esporte),
        main = "Distribuição dos Atletas por Esporte",
        xlab = "Esporte",
        ylab = "Quantidade")

#ORDINAIS

barplot(table(Atletas$nivel),
        main = "Distribuição dos Atletas por Nível",
        xlab = "Nível",
        ylab = "Quantidade")

#RELAÇÕES

plot(Atletas$altura, Atletas$peso,
     main = "Relação entre Altura e Peso",
     xlab = "Altura (m)",
     ylab = "Peso (kg)")


#O gráfico relaciona a altura e o peso dos atletas. Cada ponto representa um atleta,
#permitindo observar se existe alguma relação entre essas duas variáveis.


plot(Atletas$idade, Atletas$salario,
     main = "Relação entre Idade e Salário",
     xlab = "Idade",
     ylab = "Salário (R$)")

#O gráfico relaciona a idade e o salário dos atletas. Cada ponto representa um atleta,
#permitindo observar como os salários estão distribuídos de acordo com a idade.


cores <- c("red", "blue", "green", "orange")

plot(
  as.numeric(factor(Atletas$Esporte)),
  Atletas$salario,
  col = cores[as.numeric(factor(Atletas$Esporte))],
  pch = 19,
  xaxt = "n",
  main = "Relação entre Esporte e Salário",
  xlab = "Esporte",
  ylab = "Salário (R$)"
)

axis(
  1,
  at = 1:4,
  labels = levels(factor(Atletas$Esporte))
)


#CONCLUSÃO 
# - Trouxe um grafico com pelo menos 1 tipo de cada variavel, e nos graficos de relação eu trouxe 
# relações que fariam sentido com dados reais, mas com dados que são criados de forma "aleatoria"
# nem sempre essas relações faziam sentido.

