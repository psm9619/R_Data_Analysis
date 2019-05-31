## 기본 함수들
vec1 <- c(1:5)
vec2 <- c('a','b','c','d','e')
max(vec1)
max(vec2)   # character 이라도 자동적으로 알파벳 순 등 이용해서 max 비교 가능
mean(vec1)
mean(vec2)  # character 은 숫자가 아니라서 mean, 평균값은 구할 수 없다
min(vec1)
min(vec2)   # min 은 캐릭터와도 가능 
sd(vec1)
sum(vec1)
var(vec1)   # variation (N-1 : R 은 모집단위로 편차 계산)

library(googleVis)
Fruits

#aggregate (게산될 칼럼~기준 칼럼, 데이터파일, 함수) 
aggregate(Sales~Year, Fruits, sum) #기준 열: 고정하고 비교하는 것 -> 2008, 2009, 2010 년 기준 각 해마다 판매량sales의 sum 을 구하라
aggregate(Sales~Year, Fruits, mean)
aggregate(Sales~Fruit, Fruits, sum)
aggregate(Sales~Fruit+Year, Fruits, max)  #기준을 두개 이상 둘 때는 + 를 써서 추가조건을 지정

#apply (매트릭스, 행 1 또는 열 2, 함수)
mat1 <- matrix(c(1:6), nrow=2, byrow=T) ; mat1
apply (mat1, 1, sum)  # 1: 행 단위 계산
apply (mat1, 2, sum)  # 2: 열 단위 계산
apply (mat1, 1, prod) # prod() 곱셈 연산
apply (mat1[, c(2,3)],1, sum) # mat1에 [, x]를 넣어서 행단위 계산시 특정 열만 쓰도록 (여기서는 2&3번째 열) 지정

Fruits
list1 <-list(Fruits$Sales) ; list1
list2 <-list(Fruits$Profit) ; list2
# lapply(리스트, 리스트, 함수) --> 두 리스트에 공통적인 함수 적용, 각자 해당값 뽑아내서 list 형식으로 반환
lapply(c(list1,list2), max) 
sapply(c(list1, list2), max)  #sapply(리스트, 리스트, 함수) --> 리스트 형식이 아닌 일반 벡터 형식으로 반환
lapply(Fruits[, c(4,6)], max) #한 번에 데이터 파일에서 해당 열만 뽑아서도 가능 (따로 변수 리스트를 만들지 않고도)
lapply(Fruits[, c(4,6)], min)

Fruits
attach(Fruits)  #tapply (비교칼럼, 기준칼럼, 함수)--> 해당 함수에 대해 비교칼럼을 계산하고 결과를 가로 방향으로, 기준칼럼을 새 헤드삼아서 출력
tapply(Sales, Fruit, sum)
tapply (Sales, Year, sum)

vec1<-c(1:5) ; vec1
vec2<-seq(10,50,10) ; vec2  #seq(a, b, c) --> a 부터 b 까지 c 의 간격으로 
vec3<-seq(100,500,100) ; vec3
# mapply (함수, vec 1, 2, 3... )
mapply(sum, vec1, vec2,vec3)  #둘 이상의 벡터에 한 번에 주어진 함수 적용


data1 <- read.csv('data1.csv') ; data1
list1 <- list(data1$X2000년) ; list1
data1
factor(data1)
sum(data1$X2000년)



#1.
apply(data1[c(2:15)], 2, sum)
apply(data1[,c(2:15)],2, sum)

apply(data1[,c(2:15)], 1, sum)
apply(data1[,-1],1,sum)

#2.
data2 <-read.csv('1-4호선승하차승객수.csv')
data2$노선번호
sum(data2[,1])
aggregate(data2[,3]~data2[,1], data2, sum)
attach(data2)

노선번호 <- data2[c(2:81),1] ; 노선번호
승차 <- data2[c(2:81), 3] ; 승차
하차 <- data2[c(2:81), 4] ; 하차

tapply(data2[,3], data2[,1], sum)
tapply(data2[,4], data2[,1],sum)
sapply(data2[,3:4], sum)
aggregate(승차+하차~노선번호, data2, sum)
aggregate(승차~노선번호, data2, sum)
aggregate(하차~노선번호, data2, sum)


















