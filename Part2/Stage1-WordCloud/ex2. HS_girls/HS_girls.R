library(KoNLP)
library(wordcloud)
useSejongDic()

data1 <- readLines("remake.txt")    # 원시데이터
data2 <- sapply(data1, extractNoun, USE.NAMES = F)   #list 형태로 명사 및 몇몇 기타 데이터 추출
data3 <- unlist(data2)    # unlist 시킨 추출 데이터
data3 <- Filter(function(x) {nchar(x) <= 10}, data3)  #단어들중 10글자 이상으로 넘어가는 것들을 걸러냄
head(data3, 50)

data3 <- gsub ("\\d+","", data3)
data3 <- gsub ("쌍수","쌍꺼풀", data3)
data3 <- gsub ("네이버","", data3)
data3 <- gsub ("메부리코","매부리코", data3)
data3 <- gsub ("\\.","", data3)
data3 <- gsub (" ","", data3)
data3 <- gsub ("\\ '","", data3)
data3 <- gsub("수", "", data3)
data3 <- gsub("ㅠㅠㅠㅠ", "", data3)

write(data3, "data4.txt")
data4 <- read.table("data4.txt")

data4


##---------------method to remove a list of words at once

txt <- readLines("성형gsub.txt")  #this is an already prepared list of words that need to be removed 
txt
for (i in 1:length(txt)) {
  data3 <- gsub((txt[i]), "", data3)
}

data3
write(data3, "data4.txt")
data4 <- read.table("data4.txt")
data4

nrow(data4)
wordcount  <- table(data4)
head(sort(wordcount, decreasing=T), 10)

set.seed(1212)
palete <- brewer.pal(9, 'Set3')
wordcloud (names(wordcount), freq=wordcount, scale=c(5,1),
           rot.per=0.25, min.freq=2, 
           random.order = F, random.color=T, colors=palete,
           bg = "black")
legend(0.2, 1, "여고생들이 선호하는 수술 부위",
       cex = 0.8, fill=NA, border=NA, bg="white", 
       text.col = "red", text.font=1, box.col="red")





