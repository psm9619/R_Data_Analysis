#3-2
library(reshape2)
library (ggplot2)
youth1 <- read.csv("주요고민c.csv", header=T)
youth1
youth2 <- read.csv("흡연음주c.csv", header=T)
youth2
youth3 <- read.csv("학교생활만족도c.csv")
youth3
youth4 <- read.csv("학교폭력사유c.csv")
youth4
youth5 <- read.csv("직업선택요인c.csv", header=T)
youth5
youth6 <- read.csv("직장선호도c.csv")
youth6

# ------------------------------------------------------
rownames(youth1) <- c("남자", "여자")
성별 <- c("남자", "여자")
youth1 <- cbind(성별, youth1)
youth1_1 <- melt (youth1, id = c('성별'))
youth1_1

ggplot(youth1_1, aes(x=variable, 
                     y=value, 
                     group=성별, fill = 성별)) +
  geom_bar (stat="identity", position = 'dodge') +
  theme (axis.text.x = element_text(angle = 90, hjust = 1))  +
  labs(x="", y='비율(%)', title = '주요고민거리')
# ------------------------------------------------------
rownames(youth2) <- c("흡연", "음주")
흡연_음주 <- c("흡연", "음주")
youth2 <- cbind(흡연_음주, youth2)
youth2_1 <- melt (youth2, id = c('흡연_음주'))
youth2_1

ggplot(youth2_1, aes(x=variable, 
                     y=value, 
                     group=흡연_음주, fill = 흡연_음주)) +
  geom_bar (stat="identity", position = 'dodge') +
  theme (axis.text.x = element_text(angle = 90, hjust = 1))  +
  labs(x="연도(년)", y='비율(%)', title = '흡연율/음주율')
# ------------------------------------------------------
rownames(youth5) <- c("남자", "여자", "중학생", "고등학생", "대학생")
factor <- c("남자", "여자", "중학생", "고등학생", "대학생")

youth5 <- cbind(factor, youth5)
youth5_1 <- melt (youth5, id = c('factor'))
youth5_1 <- youth5_1 %>%
  group_by (variable) %>%
  group_by (factor) %>%
  mutate (비율 = value/sum(value) *100) %>%
  arrange(desc(비율)) %>%
  mutate (ylabel = paste(factor, '\n', sprintf("%4.1f", 비율), '%', sep = '')) %>%
  mutate(ypos = cumsum(비율)- 0.5*비율)
  


cols <- c('green', 'blue', 'yellow', 'orange', 'red')
# 
# ggplot(youth5_1, aes(x=variable, 
#                      y=value, 
#                      group=factor, fill = factor)) +
#   geom_bar (stat="identity", position = 'dodge') +
#   theme (axis.text.x = element_text(angle = 90, hjust = 1))  +
#   labs(x="항목", y='비율(%)', title = '직업 선택 요인', fill="") 

youth5_1_1 <- youth5_1[1:5,]
youth5_1_1

ggplot(youth5_1_1, aes(x='', y= value, fill=factor)) +
  geom_bar(width=1, stat='identity') + 
  geom_text(aes(y=ypos, label=ylabel)) 
 # coord_polar("y", start=0) 




ggplot (top10_2, aes(x=variable, y=value, fill = rev)) + 
  geom_bar(width=1, stat='identity') +
  geom_text(aes(y=ypos, label = paste(row.names(top10_2), "\n",ylabel)), color='white') +
#  coord_polar("y", start=0) +
  labs(title="Top 10 words in K-HipHop songs")






















