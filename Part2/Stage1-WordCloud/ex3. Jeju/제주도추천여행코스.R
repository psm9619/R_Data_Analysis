# 예제 1-3 제주도 추천 여행지
library (KoNLP)
library(wordcloud)
useSejongDic()
library(stringr)

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
palete <- brewer.pal(9, "Set1")

wordcloud(names(wordcount), freq = wordcount, scale=c(3.5,0.2), 
          rot.per=0.15, min.freq=2, 
          random.order=F, random.color=T, colors= palete)
legend (0.3,1, "제주도 추천 여행코스 분석", cex=0.8, 
        fill=NA, border=NA, bg="white",
        text.col="black", text.font=4, box.col = "red")





