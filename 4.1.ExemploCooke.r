install.packages("expert")
library(expert)

x <- list( EXP1 <- list(SEM1 <- c(75,80,85), #Opinião de valores da semente 1
                        SEM2 <- c(10,15,20), # opinião sobre os valores da semente 2
                        INT <- c(650,800,850)), #Variável de interesse
           EXP2 <- list(SEM1 <- c(80,90,95),
                        SEM2 <- c(25,30,35),
                        INT <- c(500,600,700)),
           EXP3 <- list(SEM1 <- c(65,70,80),
                        SEM2 <- c(20,25,30),
                        INT <- c(450,650,800)))

prob <- c (0.1, 0.5, 0.9) #QUantis opinados por cada especialista(EXP)

semverd <- c(80, 25) #Valores reais das sementes, valores estes que os especialistas desconhecem. O primeiro vaor diz respeito a semente 1 e o segundo sobre a semente 2

inf <- expert(x, "cooke", prob, semverd) # variável de inferência utilizando o modelo clássico de Cooke

inf

hist(inf,col = "blue") #gera um histograma com a combinação dos especialistas

par(bg = "white") # limpa a área de plotagem
split.screen(c(2,2)) # divide a área de plotagem em 4 partes
screen(1) # imprime na primeira parte
hist(inf, col = "gray", main = "Distribuição Agregada") # histograma com o resultado da inferência(distribuição agregada)
screen(2) # gera um gráfico de densidade com a opinião do especialista em relação com a variável de interesse
s = density(c(650,800,850))
plot(s,main = "Especialista 1")
polygon(s,col = "blue")
screen(3) # gera um gráfico de densidade com a opinião do especialista em relação com a variável de interesse
s = density(c(500,600,700))
plot(s,main = "Especialista 2")
polygon(s,col = "blue")
screen(4) # gera um gráfico de densidade com a opinião do especialista em relação com a variável de interesse
s = density(c(450,650,800))
plot(s,main = "Especialista 3")
polygon(s,col = "blue")
close.screen(all = TRUE)

summary(inf)

quantile(inf) # mostra s quantis com os resultados mais simples (0, 25, 50, 75 ,100)

mean(inf) # Faz uma média sobre os quantis

dc = cdf(inf)
plot(dc) # gera uma gráfico da distribuição cumulativa, que é referente à distribuição de probabilidade agregada da opinião dos especialistas

og = ogive(inf) 
plot(og) # gera um gráfico referente à frequência acumulada da opinião dos especialistas
