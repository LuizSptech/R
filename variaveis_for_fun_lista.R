a <- 60;
b <- 40;
22 -> c;

if(
  a > b
){
  "teste1"
}else{
  "teste2"
}


somar <- function(num1,num2 = 10){
  cat(num1 + num2 );
}

somar(10)

#Comentar

rm(c)

nomes <- c("Tom","Bob","Ana","Luiz")
nomes[1]

#quase não usaremos, mas tem
for (nomes in nomes){
  cat(nomes, "\n")
}
