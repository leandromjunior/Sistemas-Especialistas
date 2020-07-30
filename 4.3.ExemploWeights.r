install.packages("expert")
library(expert)

x <- list(EXP1 <- list(
                       INT <- c(650,800,850)),
          EXP2 <- list(
                       INT <- c(500,600,700)),
          EXP3 <- list(
                       INT <- c(450,650,800)))

prob <- c(0.1, 0.5, 0.9)


inf <- expert(x, "weights", prob, w=c(.1,.7,.2)) #utilizando o modelo de Weights. / passando por par�metro a vari�vel w(weights) com um vetor de pesos para cada especialista
                                                 # 10,70,20 = 100%
inf
hist(inf, col = "blue")