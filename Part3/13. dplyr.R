library (googleVis)
sort1 <-Fruits$Sales
sort1
sort1 <- sort(sort1) #ascending order sort
sort2 <- sort(sort1, decreasing=T)  #descending order sort: 내림차순으로 만들기 위해서는 sort(list, decreasing = T)
sort2 

install.packages("plyr")
library(plyr)
fruits <- read.csv("fruits_10.csv", header=T)
fruits

# ddply(data, 기준 컬럼, 적용함수 및 리턴될 결과물)
#fruits 데이터를 name 칼럼에 따라 summarise 함수를 이용하여 리턴하는데, 이 때 sum_qty 와 sum_price를 해서 리턴해라
ddply(fruits, 'name', summarise, sum_qty =sum(qty), sum_price =sum(price)) 
ddply(fruits, c('year', 'name'), summarise, max_qty = max(qty), min_price = min(price)) #그냥 실습 위한 것뿐, 딱히 이 연산은 공통 되어서 그룹핑할만한 것은 없ㄷ


#transform() 데이터 프레임을 입력받아서 특정정보를 지정받은 새로운 형식으로 바꾼다음, 새로운 데이터프레임으로 출력
ddply(fruits, 'name', transform, sum_qty = sum(qty), pct_qty = (100*qty)/sum(qty))


#dplyr 패키지
# filter () 조건을 주어서 필터링
# select () 여러 칼럼이 있는 데이터셋에서 특정 칼럼만 선택 사용
# arrange() 오름차순, 내림차순 정렬
# mutate () 기존 변수 활용, 새로운 변수 생성 (sum, avg, var, sd, n 등이 있다)
# summarise (with group_by) 주어진 데이터 집계 (min, max, mean, count 등 활용)

#dplyr 과 일반적인 데이터 테이블 다루는 것 간의 공통점 (*dplyr 이 더 쉽게, 간단하게 함수들을 정리해놓은 셈임)
#SELECT 칼럼이름, .... (dplyr 의 select 와 같음)
#....FROM 테이블 이름, .... 
#....WEHRE 조건 (filter 역할: group by / order by / limit)

install.packages("dplyr")
library(dplyr)
data1 <- read.csv("2013년_프로야구선수_성적.csv")
data1 
filter(data1, 경기>120)
filter(data1, 경기 > 120 & 득점 > 80)
filter(data1, 포지션 == '1루수' | 포지션 == '3루수')
# %in% -> A==a | B==b 를 다른 방식으로, A 를 a로 나눠서 몫만 나오는, 말 그대로 포함하고 있는 경우만 출력하라는 것과 같다
filter(data1, 포지션 %in% c('1루수', '3루수'))

select (data1, 선수명, 포지션, 팀) #원하는 칼럼만 보여줌
select (data1, 순위: 타수) # : -> 이어지는 여러 칼럼을 한 번에 표시
select (data1, -(홈런:도루))  #원하지 않는 칼럼들 제외

# dplyr 이 인기를 끌게된 가장 큰 이유는 ,여러 문장을 조합해 사용할 수 있기 때문
data1 %>% #데이터 프레임을 쓰고 %>%를 붙인 후에
 #원하는 액션함수를 쓸 떄는 더이상 데이터 이름을 붙이지 않아도 됨
 #여러 함수를 이을 때 끝에 %>%를 붙이고 , 각 함수들은 데이터 이름 밑에 indentation (탭)이 들어가야한다.
  select (선수명, 팀, 경기, 타수) %>%  
  filter (타수 >400) %>%
  arrange(타수) %>%
  arrange (desc(타수)) # dplyr 에서 내림차순 arrange 는 arrange(desc(칼럼)) 으로 넣는다

  
data1 %>% 
  select (선수명, 팀, 경기, 타수) %>%  
  filter (타수 >400) %>%
  arrange (desc(경기), desc(타수)) # 여러 조건을 이용해서 arrange 하기 위해서는 단순히 여러 조건을 넣으면 됨

data1 %>%
  select(선수명,팀, 경기, 타수) %>%
  mutate (경기x타수 = 경기 *타수) %>% #사실상 필요는 없은 ㅏ단순히 모양이랑 가능한 정도를 보이기 위해 한 연산
  arrange (경기x타수) 

data2 <- data1 %>%
  select(선수명, 팀, 출루율, 장타율) %>%
  mutate (OPS = 출루율+장타율) %>%
  arrange(desc(OPS))
   
data1 %>%
  group_by(팀) %>%
  summarise(average = mean(경기, na.rm = T)) 
#mean 등을 계산할 떄, 있을 수 있는 NA 변칙값을 제외하기 위해서는 na.rm = T 를 포함한다 

data1 %>%
  group_by(팀) %>%
 # summarise_each (funs(mean), 경기, 타수, 타율) %>%
  summarise_each (list(mean), 경기, 타수, 타율)
#summarise_each (funs(), 칼럼 a,b,c...) --> 지정해준 칼럼들 a,b,c 에 대해 fun() 를 각각_each 적용해서 summarise 정리출력해라
# 앞으로는 funs() 말고 list(함수) 를 써달라고 R에서 요청하고 있음. 그러나 list 에는 1개 함수밖에 들어가지 않고
#여러 함수를 한 번에 넣으려면 funs (A, B, C..) 로 쓸 것


##############################################################
##############################################################

fruits<-Fruits ; fruits


#1
filter(fruits, Expenses>80)
#2
filter(fruits, Expenses>90 & Sales >90)
#3
filter(fruits, Expenses>90 | Sales >80)
#4
filter(fruits, Expenses %in% c(79,91))
#5
select(fruits, Fruit:Sales, -Location)
#6
fruits %>%
  group_by(Fruit) %>%
  summarise(average=sum(Sales, na.rm=T))
#7
fruits %>%
  group_by(Fruit) %>%
  summarise_each (list(sum), Sales, Profit)





















