library (ggplot2)
library(RColorBrewer)
data1 <-read.csv( "야구성적.csv")
class(data1)

data2 <- data1 %>%
  mutate(Ops = 출루율 + 장타율) %>%
  mutate(연봉대비Ops = Ops/연봉*100)

nrow(data2)

cols <- c(brewer.pal(11,"Spectral"))
cols <- c(cols, cols, brewer.pal(3,"Spectral")) ; cols

avg <- mean(data2$연봉대비Ops)
avg
g <- ggplot (data2, aes(x=선수명, y=연봉대비Ops)) +
  geom_bar(width=0.8, stat="identity", fill=cols, color=cols) +
  geom_hline(yintercept=avg,lty=1, color='grey')+
  annotate("text", x=1.5, y=avg+1, label="29% (평균값)", size=2.5)+
  theme (axis.text.x = element_text(angle = 90, hjust = 1)) +
  theme_classic() +
  labs(x="", y='연봉 대비 OPS (%)')+
  ggtitle("야구 선수별 연봉 대비 OPS 분석") 
g









