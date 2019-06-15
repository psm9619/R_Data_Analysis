library(googleVis)

data <- read.csv("2013년_서울_구별_주요과목별병원현황_구글용.csv")
data

hos <- gvisColumnChart(data,options=list(
  title="지역별 병원현황", height=400, weight=500))
header<-hos$html$header  # to change the charset utf-8 to euc-Kr (한글이 깨짐)
header
header <- str_replace(header, "utf-8", "euc-kr")   #utf=8 부분을 euc-kr 로 변형
hos$html$header <- header  #변형시킨 header을 다시 집어넣음
plot(hos)






