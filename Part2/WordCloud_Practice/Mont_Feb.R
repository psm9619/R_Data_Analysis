library(dplyr)
library(KoNLP)
library(wordcloud)
library(stringr)
library(RColorBrewer)

useSejongDic()

#--------------------------------------------------------------------------------

txt2 <- readLines("응답소_2015_02.txt")
feb <- sapply(txt2, extractNoun, USE.NAMES = F)
feb <- unlist(feb) 

# for some reason, the below order does not remove non-alphabet/한글 data compeletely. After this step, dataset still contains some numbers
feb <- str_replace_all(feb, "[^:alpha:]]","")

#------------------------------------------------------------------------

### 전처리 과정은 데이터 셋의 표본으로 100~+ 여개의 데이터를 3 번 정도 랜덤한 부분에서 뽑아낸 후 눈에 띄는 데이터들을 골라 알맞은 데이터로 gsub 하는 방식으로 이루어졌음

# t_gsub 데이터 셋은 12개의 데이터 셋을 합하여 만들어짐. 
# t_gsub 자체를 읽어 forloop 에 바로 넣어 사용시, 큰 표본은 물론 작은 표본으로 테스팅을 해봐도 만족스러운 결과가 나오지 않아서
# 우선적인 해결방법으로 새로운 c() 벡터를 현 script 에서 다시 만들어 사용

t_gsub <- readLines("응답소gsub.txt")  

re_subtxt <- c(t_gsub, "\\W", "\\d+","[:punct:]",'[ㄱ-ㅎ]',"(ㅜ|ㅠ)","제목","답변","씨\\S*","서울시\\S*","시장\\S*","을\\S*",
               "까\\S*","되\\S*","당시\\S*","관련\\S*","에\\S*" ,"를\\S*","년\\S*","그런\\S*","그래서\\S*","것\\S*","갖\\S*",
               "아니\\S*", "랑\\S*", "안녕\\S*", "입니다", "생각", "는\\S*")

write (re_subtxt, "resub.txt")
resub <- readLines("resub.txt")

for (i in 1:length(resub)) {
  feb <- gsub(re_subtxt[i], "", feb)
}  # for loops doesn't work very well.. so did some more hands-on work  


feb <- Filter(function(x) {nchar(x) >=2 && nchar(x) <=5}, feb)


#------------------------------------------------------------------------


write(unlist(feb), "feb15_rev.txt")
rev2 <- read.table("feb15_rev.txt")
nrow(rev2)
count2 <- table(rev2)
palete <- brewer.pal(9, "Set1")

par(bg="black")
wordcloud(names(count2), freq = count2, scale = c(7,0.5),
          rot.per=0.85, min.freq=2, max.words=100, 
          random.order=F, random.color=T, colors=palete)





















