library(reshape)
library(ggplot2)
library(dplyr)

data1 <- read.csv("연도별요양기관별보험청구건수_2001_2013.csv")
data2 <- read.csv("연도별요양기관별보험청구건수_2001_2013_세로.csv")
data2

row.names(data2) <- data2[,1]
data2
data2[1] <- NULL
func <- function(x) {
  x/100000
}
data3 <- apply(data2, 2, func)

plot (data3[,1], xlab="", ylab="",
      ylim=c(0,6000), axes=F, col="violet", type="o", lwd=2,
      main=paste("연도별 요양 기관별 보험청구 건수 (단위: 십만건)","\n",
                 "출처:건강보험심사평가원"))
axis(1, at = 1:10, label=row.names(data3), las=2)
axis(2, las=1)

col=c("red","orange","yellow","green", "blue", "purple", "brown", "grey","lightblue")
for (i in 1:10){
  lines(data3[,i], col=col[i], type="o", lwd=2)
}

abline(h=seq(0,6000,500), v=seq(1,100,1), lty=3,lwd=0.2)
legend(1,6000, col, cex=0.8, col=col, lty=1, lwd=2, bg='white')  
  
  
  
  
  
  
  




  











