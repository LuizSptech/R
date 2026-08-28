#Primeiro data frame

df_teste <- data.frame(
  nome = c("bob","mel","luiz","alan","brito"),
  idade = c(50,20,18,67,22),
  salario = c(1000.1,1400.5,1100.2,1800.4,50000.7)
  
)

median(df_teste$salario)
mean(df_teste$salario)
str(df_teste)
head(df_teste)
dim(df_teste)
sumary(df_teste)
0
