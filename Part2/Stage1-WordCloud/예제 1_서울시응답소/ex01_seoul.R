setwd('D:/Workspace/R_data_analysis/Part2/Stage1-WordCloud/예제 1_서울시응답소')
install.packages('rJava')
library(rJava)
install.packages("KoNLP")
library(KoNLP)
install.packages("wordcloud")
library(wordcloud)
useSejongDic()
#mergeUserDic(data.frame("")) -> 내가 필요로 하는 단어가 사전에 없을 시 추가하는 것 (ex. 지명)
library(RColorBrewer)


data1 <- readLines("seoul_new.txt")
data1
extractNoun ("서울시 버스정책을 역행하는 행위를 고발합니다") #extracts nouns from korean sentence
extractNoun ("I ate breakfast and happily died") # doesn't work properly w Engilsh!!

data2 <- sapply(data1, extractNoun, #sapply(데이터, 함수, use.names = F) 
                USE.NAMES = F) # 주어진 데이터에 주어진 함수를 적용하여 리스트 형태로 반환함. 이 때 use.names = F 로 놓아서 팩터를 안 만들음?
data2  #명사들만 모인 리스트 형태
head(unlist(data2), 30) # unlist -> list 형태를 벡터처럼 그냥 늘어지게 만드는 것
data3 <- unlist(data2) ; data3 #너무 길기 때문에 일부만 프린트 후 생략함함


# gsub ("변경전 글자", "변경후 글자", 데이터)
data3 <- gsub ("\\d+", '',data3)  #"\\d" is a regular experssion for numbers. "\\d+" means more than one digit number
data3 <- gsub ("서울시", "", data3)
data3 <- gsub ("서울", "", data3)
data3 <- gsub ("요첨", "", data3)
data3 <- gsub ("제안", "", data3)
data3 <- gsub ("시장", "", data3)
data3 <- gsub (" ", "", data3)
data3 <- gsub ("-", "", data3)
data3

write(unlist(data3), "seoul_2.txt")  #saves the current new data into a give type file (I gave ".txt")
data4 <- read.table("seoul_2.txt")
head(data4)
nrow(data4)
wordcount <- table(data4)
wordcount  # returns the counts of each word in the data set 

head (sort(wordcount, decreasing = T), 20) 

data4 <- gsub ("개선", "", data4)
data4 <- gsub ("00", "", data4)
data4 <- gsub ("문제", "", data4)
data4 <- gsub ("민원", "", data4)
data4 <- gsub ("이용", "", data4)
data4 <- gsub ("관리", "", data4)

# library(RColorBrewer) 사용했음
palete <- brewer.pal(9, "Set3") 
wordcloud(names(wordcount), freq = wordcount, scale = c(5,5), 
         rot.per=0.25, min.freq=1,
         random.order=F, random.color=T, colors=palete)

legend(0.3,1,"서울시 응답소 요청사항분석", cex=0.8,
       fill = NA, border = NA, bg="white", 
       text.col = "red", text.font=2, box.col="red")


###########################
#  주요함수 다시 사용해보기

v3 <- c("봄이 지나면 여름이고 여름이 지나면 가을입니다.","그리고 겨울이죠")
v3 
extractNoun(v3)

v4 <- sapply(v3, extractNoun, USE.NAMES = F) ; v4

# wordcloud (단어 데이터, freq 빈도수, scale = c(a, b), 
              # min.freq = x  #  최소언급횟수지정
              # max.words = Inf,  # 최대언급횟수  = INF -> infinite
              # random.order=F,   # 출력순서 정해져 있음 (한 번 프린트 후에 또 바뀌지 않음)
              # random.color = F, # random 한 컬러보다 color brewer 에서 팔렛을 가져오는 것이 더 예쁨
              # rot.per= 0.1, 
              # colors = "black",
              # ordered.colors = T #use
     #         ...
              # )

letters
LETTERS
wordcloud(c(letters, LETTERS, 0:9), seq(1,1000, len=62))

warnings(33)
















