
library(ggplot2)
data1 <- read.csv("2013년_서울_주요구별_병원현황.csv")
data1
barplot(as.matrix(data1[1:9,2:11]),
        main=paste("서울시 주요구별 과목별 병원현황-2013년", "\n", "출처 "), 
        ylab = "병원수", beside = T, col= rainbow(8))
abline (h=seq(0,350,10), lty=3, lwd=0.2)
name <- data1$표시과목

## to draw in ggplot, you can't use wide table (밑으로 길게 늘어진 형태여야 가능함)
## use melt (data, id=c(새로운 데이터프레임의 칼럼네임이 될 것-기준칼럼))
install.packages("reshape")
library(reshape)
df_long <- melt(data1, id=c('표시과목'))
colnames(df_long) <- c('표시과목','지역명', '의원수')
df_long

p <- ggplot(df_long, aes(x= 지역명, y=의원수, fill=표시과목)) +
  geom_bar
  ######## 쌤 깃허브 보고 할 것















