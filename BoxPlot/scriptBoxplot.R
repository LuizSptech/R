library(ggplot2)
arquivos <- data.frame(ftech)

round(mean(arquivos$cpu_uso_pct), digits = 2 )


  

  
ggplot(arquivos, aes(x = endereco_mac, y = cpu_uso_pct, fill = endereco_mac)) + 
    geom_boxplot() +
    labs(title = "Uso de CPU por Computador", x = "Computadores", y = "Uso de CPU (%)") +
    theme_minimal()
  

# Com esse gráfico, podemos analisar o nível de uso de CPU por computador. O computador com o endereço MAC 00E00710DA36 apresenta uma amplitude maior, o que mostra que o seu uso de CPU varia mais. Por outro lado, o computador DC1BA1FEBB04 possui uma amplitude menor, demonstrando maior estabilidade.


ggplot(arquivos, aes(x = download_mbps, y = upload_mbps, color = endereco_mac)) +
  geom_point(size = 3, alpha = 0.7) +
  labs(title = "Desempenho de Rede: Download vs Upload",
       x = "Velocidade de Download (Mbps)",
       y = "Velocidade de Upload (Mbps)",
       color = "Computador") +
  theme_minimal()

