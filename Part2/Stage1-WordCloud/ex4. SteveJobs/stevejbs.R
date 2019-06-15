install.packages("tm")
library(tm)
library(wordcloud)

data1 <- readLines("steve.txt")
data1
class(data1)
corp1 <- Corpus (VectorSource(data1))
corp1
inspect(corp1)
tdm <- TermDocumentMatrix(corp1)
tdm
m <- as.matrix(tdm)
m

corp2 <- tm_map(corp1, stripWhitespace)
corp2 <- tm_map(corp2, tolower)
corp2 <- tm_map(corp2, removeNumbers)
corp2 <- tm_map(corp2, removePunctuation)
#corp2 <- tm_map(corp2, PlainTextDocument) 
#swords <- c(stopwords('en'), 'and', 'but', 'not'); swords
corp2 <- tm_map(corp2, removeWords, stopwords('en')) ; corp2
tdm2 <- TermDocumentMatrix(corp2)
tdm2
m2 <- as.matrix(tdm2) ; m2

colnames(m2) <- seq(10,590,10)
freq1 <- sort(rowSums(m2), decreasing=T)
head(freq1, 20)
freq2 <- sort(colSums(m2), decreasing=T)
head(freq2, 20)
findFreqTerms(tdm2, 2)

palete <- brewer.pal (7,"Set3")
par(bg="black")
wordcloud(names(freq1), freq = freq1, scale = c(5,0.3),
          rot.per=0.25, min.freq=1, 
          random.order=F, random.color=T, colors=palete)












