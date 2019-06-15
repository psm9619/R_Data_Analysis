library(KoNLP)
library(wordcloud)

# 불필요한 단어를 자연어 처리하는 방법에는 
# 한글 -> KoNLP : gsub
# 영어 -tm : tm_map(), stopwords()
# 


alert <- readLines ("oracle_alert_testdb.log")
head(alert,10)
error_1 <- gsub(" ", "_", alert)
head(unlist(error_1), 20)
error_2 <- unlist(error_1)
error_2 <- Filter(function(x) {nchar(x) >= 5}, error_2)
head(error_2, 10)

error_3 <- grep ("^ORA-+", error_2, value=T)
head(unlist(error_3), 20)

write(unlist(error_3), "alert_testdb2.log")
rev <- read.table("alert_testdb2.log")
nrow(rev)
errorcount <- table (rev)
head(sort(errorcount, decreasing=T), 20)

palete <- brewer.pal(10, "Set3")

par(bg="black")
wordcloud(names(errorcount), freq = errorcount, scale = c(4,0.5),
          rot.per=0.15, min.freq=1, 
          random.order=F, random.color=T, colors=palete)
legend(0.3,1, "Oracle Alert Log File 분석", cex=0.8, fill=NA, text.col="red", bg="transparent", text.font=2, box.col="grey")
















