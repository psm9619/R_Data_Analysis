# 검색어 빈도 결과를 그래프로 표시하기
# 예제 1-3 제주도 추천 여행지
library (KoNLP)
library(wordcloud)
useSejongDic()
library(stringr)
library(ggplot2)
library(dplyr)
install.packages ("extrafont")
library(extrafont)
options(digits = 2)  ### 소수점 이하 두 자리까지만 표기
windowsFonts()



mergeUserDic(data.frame   #mergeUserDic (data.frame(readLines())) 는 deprecated, 앞으로는 가급적 buidDictionary()를 쓰라고 R 에서 요청 
             (readLines("제주도여행지.txt"),"ncn")) # 텍스트 파일에 있는 여행지들을 통째로 딕션에 더한 것

txt <- readLines("jeju.txt") # 1차
place <- sapply(txt, extractNoun, USE.NAMES = F) # 2차
cdata <- unlist(place)  #3차

place2 <- str_replace_all(cdata, "[^:alpha:]]", "") #한글, 영어 제외 다른 데이터를 모두 "" 로 replace 하는 것
place2 <- gsub(" ", "", place2)
place2 <- gsub ("\\d+", "", place2)  #원래는 위에 str_replace_all 에서 [^:alpha:]] 가 잘 되면 숫자도 다 없어지는게 정상인데 안 없어짐
txt_gsub <- readLines("제주도여행코스gsub.txt")

for (i in 1:length(txt_gsub)) {
  place2<- gsub(txt_gsub[i], "", place2)
} ; place2

place2 <- Filter(function(x) {nchar(x) >= 2}, place2)  #2글자 이상만 추출함

write(unlist(place2), "jeju_revised.txt")
revised <- read.table("jeju_revised.txt") 
nrow(revised)
wordcount <- table(revised)
head(sort(wordcount, decreasing=T), 30)
top10 <- head(sort(wordcount, decreasing=T), 10)

pal <- brewer.pal(10, "Blues")
par(bg = "white")

pct <- round(top10/sum(top10) * 100, 1)
lab <- paste(names(top10), "\n", pct, "%", sep='')

pie (top10, col= pal, radius=1, main= "제주도 추천 여행코스 Top 10",
     cex = 0.8, labels = lab)

###  regraphing using ggplot

str(top10) #current top10 is a Table. We need Data frame to use ggplot


# To make the labels with Percentage & right Y position

df_top10 <- as.data.frame(top10)
df_top10 <- df_top10 %>%
  mutate(pct= Freq / sum(Freq) * 100) %>%
  mutate (ylabel = paste(sprintf("%4.1f", pct), '%', sep = '')) %>%
  mutate (ylab2 = paste (pct, '%', sep='')) %>%  # This method is supposed to give non-summarised (2digit 이하가 아닌) percentage
  arrange(desc(revised)) %>%
  mutate(ypos = cumsum(pct)- 0.5*pct)
df_top10

ggplot (df_top10, aes(x='', y=Freq, fill = revised)) + 
  geom_bar(width=1, stat='identity') +  #여기까지는 stacked bar graph
  geom_text(aes(y=ypos, label = ylabel), color = "white") +
  coord_polar("y", start=0) +  #위에서 만들어진 bar graph 를 polar 로 말으면 자동적으로 만들어짐
  ggtitle ("제주도 추천 여행 코스 TOP10") 

################## bar chart
bchart <- head(sort(wordcount, decreasing=T), 10)
bchart
bp <- barplot(bchart, main="제주도 추천 여행코스 TOP 10", 
              col = rainbow(10), cex.names=0.8, las=2, ylim=c(0,25))
pct <- round(bchart/sum(bchart) * 100)
text (x=bp, y= bchart*1.05, labels= paste("(", pct,"%", ")"), col="black", cex=0.7)

### 옆으로 누운 bar graph
bp <- barplot(bchart, main="제주도 추천 여행코스 TOP 10", 
              col = rainbow(10), cex.names=0.8, las=2, 
              horiz=T,  # Horizontal bar graph
              xlim=c(0,25))
pct <- round(bchart/sum(bchart) * 100)
text (y=bp, x= bchart*1.2, labels= paste("(", pct,"%", ")"), col="black", cex=0.7)



######### 3D Pie Chart
library(plotrix)
th_pct <- round(bchart/sum(bchart) * 100, 1) 
th_names <- names(bchart) 
th_labels <- paste(th_names,"\n", "(", th_pct, ")")

th_bp <- pie3D (bchart, col=rainbow(10), cex=0.3, labels = th_labels, explode = 0.2)




