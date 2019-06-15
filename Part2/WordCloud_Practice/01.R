
library(dplyr)
library(KoNLP)
library(wordcloud)
library(stringr)
library(RColorBrewer)

useSejongDic()

txt <- readLines("응답소_2015_01.txt")
jan <- sapply(txt, extractNoun, USE.NAMES = F)
jan <- unlist(jan) ; jan[1500:2000]

# for some reason, the below order does not remove non-alphabet/한글 data compeletely. After this step, dataset still contains some numbers
jan <- str_replace_all(jan, "[^:alpha:]]","")  
t_gsub <- readLines("응답소gsub.txt")


# 전처리 과정
for (i in 1:length(t_gsub)) {
  jan <- gsub(t_gsub[i], "", jan)
}  # for loops doesn't work very well.. so did some more hands-on work
jan <- gsub("\\W", "", jan)
jan <- gsub("\\d+", "", jan) 
jan <- gsub("[:punct:]", "", jan) 
jan <- gsub('[ㄱ-ㅎ]', "", jan)
jan <- gsub("(ㅜ|ㅠ)", "", jan)
jan <- gsub("을\\S*", "", jan)
jan <- gsub("까\\S*", "", jan)
jan <- gsub("기부\\S*", "기부", jan)
jan <- gsub("되되\\S*", "", jan)
jan <- gsub("당시\\S*", "", jan)
jan <- gsub("담배값\\S*", "담배값", jan)
jan <- gsub("깍\\S*", "깍이다", jan)
jan <- gsub("관련\\S*", "", jan)
jan <- gsub("감동\\S*", "감동함", jan)
jan <- gsub("감사\\S*", "감사함", jan)
jan <- gsub("갖\\S*", "", jan)
jan <- gsub("건의\\S*", "건의", jan)
jan <- gsub("것\\S*", "", jan)
jan <- gsub("그래서\\S*", "", jan)
jan <- gsub("그런\\S*", "", jan)
jan <- gsub("년\\S*", "", jan)
jan <- gsub("를\\S*", "", jan)
jan <- gsub("에\\S*", "", jan)

jan <- Filter(function(x) {nchar(x) >=2 && nchar(x) <=5}, jan )
jan[400:600]

write(unlist(jan), "Jan15_rev.txt")
rev <- read.table("Jan15_rev.txt")
nrow(rev)
count <- table(rev) ; count
palete <- brewer.pal(9, "Set1")

par(bg="black")
wordcloud(names(count), freq = count, scale = c(4,0.4),
          rot.per=0.35, min.freq=2, max.words=100, 
          random.order=F, random.color=T, colors=palete)



test_sub <- readLines("test_sub.txt")
test_sub

testtest <- c("234", "2019-04-30", "ㅋㅋ", "zz", "안녕하세요", "시장님", "시장", "ㅠㅠ", "시장아저씨", "...", "...안녕녕")
testtest <- gsub("...안녕녕", "", testtest)
testtest
for (i in 1: length(test_sub)) {
  test_sub[i]
  testtest <- gsub(test_sub[i], "", testtest)
  testtest
} ; testtest

tes <- c( "\\W", "[ㄱ-ㅎ]", "시장\\S*", "(ㅜ|ㅠ)")
testtest<- c("234", "2019-04-30", "ㅋㅋ", "zz", "안녕하세요", "시장님", "시장", "ㅠㅠ", "시장아저씨", "...", "...안녕녕")

for (i in 1:length(tes)) {
  st <-c("")
  testtest <- gsub(tes[i], "", testtest)
  st <- c(st, tes[i], "&&", testtest)
  print(st)
} 
testtest





















