library(ggplot2)
library(dplyr)
iris 

par(mfrow=c(3,2))

#--------------------------------------------------------------------------------------
iris_1 <- iris %>%
  select (Sepal.Length, Sepal.Width, Petal.Length, Petal.Width, Species) %>%
  filter(Species %in% 'setosa')
iris_1

#Setosa Sepal
Set_Sep <- as.matrix(iris_1[,1:2])
Set_Sep
plot(Set_Sep, type='p', xlab = 'Length', ylab='Width', col = 'red')
title(main = "Sepal Width vs. Legnth _ Setosa", font.main=6 )

#Setosa Petal
Set_Pet <- as.matrix(iris_1[,3:4])
Set_Pet
plot(Set_Pet, type='p', xlab = 'Length', ylab='Width', col = 'blue')
title(main = "Petal Width vs. Legnth _ Setosa", font.main=6 )

#---------------------------------------------------------------------------------------
iris_2 <- iris %>%
  select (Sepal.Length, Sepal.Width, Petal.Length, Petal.Width, Species) %>%
  filter(Species %in% 'versicolor')
iris_2

#Veriscolor Sepal
vers_sep <- as.matrix(iris_2[,1:2])
vers_sep
plot(vers_sep, type='p', xlab = 'Length', ylab='Width',col = 'red')
title(main = "Sepal Width vs. Legnth _ Versicolor", font.main=6 )

#Versicolor Petal
vers_pet <- as.matrix(iris_2[,3:4])
vers_pet
plot(vers_pet, type='p', xlab = 'Length', ylab='Width',col = 'blue')
title(main = "Petal Width vs. Legnth _ Versicolor", font.main=6 )

#------------------------------------------------------------------------------
iris_3 <- iris %>%
  select (Sepal.Length, Sepal.Width, Petal.Length, Petal.Width, Species) %>%
  filter(Species %in% 'virginica')
iris_3

#Veriscolor Sepal
virg_sep <- as.matrix(iris_3[,1:2])
virg_sep
plot(virg_sep, type='p', xlab = 'Length', ylab='Width',col = 'red')
title(main = "Sepal Width vs. Legnth _ Virginica", font.main=6 )

#Versicolor Petal
virg_pet <- as.matrix(iris_3[,3:4])
virg_pet
plot(virg_pet, type='p', xlab = 'Length', ylab='Width',col = 'blue')
title(main = "Petal Width vs. Legnth _ Virginica", font.main=6 )















