#3-7
library(ggplot2)
library(gridExtra)
library(dplyr)

mapo <- read.csv("마포09번이용현황.csv")
mapo
# ggplot (mapo, aes(y="승객수")) +
#   geom_line(aes(x=정류소명, y=승차인원)) +
#   geom_point(aes(x=정류소명, y=승차인원))+
#   geom_line(aes(x=정류소명, y=하차인원),color='blue')+
#   geom_point(aes(x=정류소명, y=승차인원)) +
#   theme_classic() + scale_colour_discrete(labels=c("승차인원", "하차인원"))+
#   theme (axis.text.x = element_text(angle = 90, hjust = 1)) 
# mapo
mapo
c <- c(1:32)
정 <- mapo1$정류소명
정
mapo1 <- cbind(mapo, c)
mapo1
a <- ggplot (mapo1) +
  geom_line (aes(x=c, y=승차인원),lty=1) 
  # theme (axis.text.x = element_blank()) 
a
a + scale_x_discrete(breaks=c(0,10,20,30), labels= c("a", "b", "c", "D"))
         
#  geom_point(color='blue', aes(x=정류소명, y=승차인원)) +
  # scale_x_discrete(breaks=c, labels = 정)
  












