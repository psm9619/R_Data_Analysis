
library(dplyr)
library(KoNLP)
library(wordcloud)
library(stringr)
library(RColorBrewer)




txt <- readLines("test.txt")
test <- sapply(txt, extractNoun, USE.NAMES = F)
test <- unlist(test) ;

# for some reason, the below order does not remove non-alphabet/한글 data compeletely. After this step, dataset still contains some numbers
test
test <- str_replace_all(test, "[^:alpha:]]","")  ; test
t_gsub <- readLines("응답소gsub.txt")
t_gsub

for (i in 1:length(t_gsub)) {
  test2 <- gsub(t_gsub[i], "", test)
}
test2