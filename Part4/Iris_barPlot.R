library(ggplot2)
library(dplyr)
iris 

par(mfrow=c(1,2))

#--------------------------------------------------------------------------------------

iris_avg <- iris %>%
  group_by(Species) %>%
  summarise(m_SepLength = mean(Sepal.Length), m_SepWidth = mean(Sepal.Width),
            m_PetLength = mean(Petal.Length), m_PetWidth = mean(Petal.Width))
iris_avg
irisM_avg <- as.matrix(iris_avg[2:5])

#--------------------------------------------------------------------------------------

barplot (irisM_avg, beside = T, main = 'Avg of Sep.Length, Sep.Width, Pet.Length, Pet.Width vs. Species',
         col=c('purple', 'pink', 'blue'), ylim=c(0,8))
legend (6, 8, c('Setosa', 'Versicolor', 'Viginica'), cex = 0.5, pch=3,fill = c('purple', 'pink','blue'))

#--------------------------------------------------------------------------------------
# t_IrisAvg <- t(irisM_avg)
# 
# barplot (t_IrisAvg, main = 'Species vs. Avg of Sep.Length &.Width, Pet.Length & .Width',
#          ylim = c(0,20), space =0.5, cex.axis=0.8, las=1,
#          col = c('green', 'yellow', 'red', 'violet'),
#          names.arg=c('Setosa', 'Versicolor', 'Virginica'), cex = 0.8) 
# legend (0.5, 20, c('m_SepLength', 'm_SepWidth', 'm_PetLength', 'm_PetWidth'), cex=0., fill=c('green', 'yellow', 'red', 'violet'))
# 



barplot (irisM_avg, main = 'Avg of Sep.Length &.Width, Pet.Length & .Width vs. Species',
         ylim = c(0,20), space =0.5, cex.axis=0.8, las=1,
         col = c('purple', 'pink', 'blue'),
         names.arg=c('avg_SepLeng', 'avg_SepWid', 'avg_PetLeng', 'avg_PetWid'), cex = 0.8) 
legend (2.5, 20, c('Setosa', 'Versicolor', 'Viginica'), cex = 0.5, pch=3,fill = c('purple', 'pink', 'blue'))














