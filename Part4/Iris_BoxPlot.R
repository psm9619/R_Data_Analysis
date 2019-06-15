library(ggplot2)
library(dplyr)
iris 
par(mfrow=c(1,1))
#--------------------------------------------------------------------------------------
iris_1 <- iris %>%
  select (Sepal.Length, Sepal.Width, Petal.Length, Petal.Width, Species) %>%
  filter(Species %in% 'setosa')
iris_1

SET_sepL <- iris_1[,1]  ; SET_sepW <- iris_1[,2]
SET_petL <- iris_1[,3]  ; SET_petW <- iris_1[,4]

#--------------------------------------------------------------------------------------
iris_2 <- iris %>%
  select (Sepal.Length, Sepal.Width, Petal.Length, Petal.Width, Species) %>%
  filter(Species %in% 'versicolor')
iris_2

VER_sepL <- iris_2[,1]  ; VER_sepW <- iris_2[,2]
VER_petL <- iris_2[,3]  ; VER_petW <- iris_2[,4]

#--------------------------------------------------------------------------------------
iris_3 <- iris %>%
  select (Sepal.Length, Sepal.Width, Petal.Length, Petal.Width, Species) %>%
  filter(Species %in% 'virginica')
iris_3

VIR_sepL <- iris_3[,1]  ; VIR_sepW <- iris_3[,2]
VIR_petL <- iris_3[,3]  ; VIR_petW <- iris_3[,4]

#--------------------------------------------------------------------------------------

boxplot (  SET_sepL, SET_sepW, SET_petL, SET_petW ,
           VER_sepL, VER_sepW, VER_petL, VER_petW ,
           VIR_sepL, VIR_sepW, VIR_petL, VIR_petW ,
           main = 'Sepal L & W, Petal L & W for Three species', font.main = 10,
           names = c('SET_sepL', 'SET_sepW', 'SET_petL', 'SET_petW' ,
                                   'VER_sepL', 'VER_sepW', 'VER_petL', 'VER_petW' ,
                                   'VIR_sepL', 'VIR_sepW', 'VIR_petL', 'VIR_petW' ),
           col = c('mediumorchid1', 'mediumorchid3', 'darkviolet', 'purple3',
                   'lightpink','deeppink','lightcoral','hotpink',
                   'lightblue','lightblue4','deepskyblue2','darkblue')
          )

                   

















