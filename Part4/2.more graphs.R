install.packages("treemap")
library (treemap)
total <- read.csv("data/학생시험결과_전체점수.csv", header=T, sep=",")
total

treemap(total, vSize='점수', index = c('점수', '이름'))
treemap(total, vSize='점수', index = c('조', '이름'))
treemap(total, vSize='점수', index = c('점수', '조', '이름'))
total <- read.table('data/학생별전체성적_new.txt', header=T, sep=',')
total
row.names (total) <- total$이름 # data 에서 1열인 이름 정보를 각 행의 factor 이름으로 추가대입/사용
total <- total[, 2:7]
total #1열의 이름을 각 행의 factor 로 카피대입 한 후에는 더이상 data 로서 가치가 없으므로 지운 것
stars(total, flip.labels = FALSE, draw.segments = F, frame.plot=T, full = T, main = '학생별 과목별 성적분석 - STAR Chart')
lab <- names (total)
value <- table (lab)
value
pie (value, labels = lab, radius = 0.1, cex =0.6, col = NA) #pie 차트 for legend! 

# 나이팅게일 차트
stars(total, flip.labels = F, draw.segment = T, frame.plot= T, full = T, main = '학생별 과목별 성적분석-나이팅게일')
pie (value, labels = lab, radius = 0.1, cex =0.6, col = NA) #pie 차트 for legend! 

#반원 차트
stars(total, flip.labels = F, draw.segment = T, frame.plot= T, full = F, #full=F -> 반원 180도 
      main = '학생별 과목별 성적분석-나이팅게일')


# 레이더 차트
install.packages('fmsb')
library(fmsb)
layout <- data.frame(분석력 = c(5,1), 창의력 = c(15,3), 판단력 = c(3,0), 리더쉽 = c(5,1), 사교성=c(5,1))

set.seed(123) #랜덤한 임의의 데이터가 생성되고 나면 그것을 유지 (한 번 랜덤하게 나온 값을 아예 저장시키는 것)
data1 <- data.frame (
  분석력 = runif (3,1,5),  #uniform 한 공평한 확률로 1~5까지의 수중 3개의 랜덤데이터를 뽑아냄
  창의력 = rnorm (3,10,2), #normal 표준 정규분포 (종모양) 에서 10이 평균이고 2가 standard dist 일때 랜덤한 3개를 뽑아라
  판단력 = c(0.5,NA,3),
  리더쉽 = runif(3,1,5),
  사교성 = c(5,2.5,4)
)

runif(10,2,5)
rnorm(10,5,2)

data2 <- rbind(layout, data1)
op <- par(mar= c(1,0.5,3,1), mfrow=c(2,2)) 
radarchart(data2, axistype=1, seg=5, plty=1, title='첫번째 타입')
radarchart(data2, axistype=2, pcol=topo.colors(3), plty=1, title='두번째 타입')

radarchart(data2, axistype=3, pty=32, plty=1, axislabcol = 'grey', na.itp=F, title = '세번째 타입')
radarchart(data2, axistype=0, plwd=1:5, pcol=1, title='네네번째 타입')

savePlot('spider.png', type='png')
















