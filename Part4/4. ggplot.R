install.packages('ggplot2')
library(ggplot2)

korean <- read.table ("data/학생별국어성적_new.txt", header=T, sep=",")
korean

# ggplot(data =..., mapping 그래프 스케일/골격 = aes(x=.., y=..) )  +
#   geom_그래프 종류() +
#   title, x/y label, color, legend, etc.

ggplot(korean, aes(x=이름, y=점수)) +
  geom_point()
  
ggplot(data=korean, mapping = aes(x=이름, y=점수)) +
  geom_point()
ggplot(mapping=aes(x=이름, y=점수), data=korean) +
  geom_point()

#------------------------------------------------------------------

ggplot(korean, aes(x=이름, y=점수 )) +
  geom_bar(stat="identity", 
           fill='green',   # fills the bars in given color 
           colour='red')  + # the Line can be in different color 
  theme(                              # theme() defines axis name, values, etc. 
    axis.text.x=element_text (        # axis.text.x = ...(**) 
      angle = 45, hjust=1, vjust=1,   #   -> x 축의 text 를 (**) 특징을 가진 ... 로 하겠다
      color = 'blue',size = 8))

#------------------------------------------------------------------

score_kem <- read.csv("학생별과목별성적_국영수_new.csv")
score_kem

library(dplyr)
sort_kem <- arrange(score_kem, 이름, 과목)  
sort_kem

#sort_kem2 <- ddply(sort_kem, '이름', transform, 누적합계 = cumsum(점수)) # ddply -> only from plyr package
sort_kem2 <- sort_kem %>%
#  group_by (이름) %>%
  mutate (누적합계 = cumsum(점수)) # same result with using ddply
sort_kem2 

sort_kem3 <- sort_kem2 %>%
  mutate(label = cumsum(점수) - 0.5*점수) #그냥 과목명이 각 그래프의 y축 중간포지션에 달릴 수 있도록, 중간값을 구하는 것 뿐. 미적요소를 위한 y 축 위치 label  
sort_kem3

# all in one
sort_kem5 <- score_kem %>%
  arrange(이름) %>%
  group_by(이름) %>%
  mutate(누적합계=cumsum(점수),
         label = 누적합계 - 0.5*점수)
  
sort_kem5

ggplot(sort_kem5, aes(x = 이름, y = 점수, fill = 과목)) +
  geom_bar(stat='identity') + 
  geom_text(aes(y=label, label=paste(점수, '점')), colour='black', size=4) +
  theme(axis.text.x = element_text(angle=45, hjust=1, vjust=1,
                                   color='blue', size=5))


#---------------------------------------------------------------------------


score <- read.table('학생별전체성적_new.txt', header=T, sep=',')
score
score_eng <- score[, c('이름', '영어')]
score_eng

ggplot(score_eng, aes(x=영어, y=reorder(이름, 영어))) +
  geom_point(size=3) + #for scatterplot, geom_point(size= ..) -> size of points
  theme_bw() + #colors/themes of background 
  theme(panel.grid.major.x = element_blank(), #element_blank -> 격자 gridline 을 없앰
        panel.grid.minor.x = element_blank(),
        panel.grid.major.y = element_line(color='red', linetype='dashed'))

ggplot(score_eng, aes(x=영어, y=reorder(이름, 영어))) +
  geom_segment(aes(yend=이름), xend=0, color='blue') +
  geom_point(size=5, color='green') +   #can use two types of plots together
  theme_bw() + #colors/themes of background 
  theme(panel.grid.major.y = element_blank())

install.packages('gridExtra')
library(gridExtra)
mtcars 
str(mtcars)  #returns kind of summaries??
ggplot(mtcars,aes(x=hp, y=mpg)) + 
  geom_point()

ggplot(mtcars,aes(x=hp, y=mpg)) +      # x를 hp, y 를 mpg 로 그래프를 그리는데 이 때,
  geom_point(aes(colour = factor(am),  # aesthetic 미적인 값으로는 'am'을 factor로 colour 를 구분하고
             size = wt))  # wt 를 factor로는 size를 다르게 해라

ggplot(mtcars,aes(x=hp, y=mpg)) +      
  geom_point(aes(shape = factor(am), # am 을 factor 으로 shape 을 구분해라 
                 size = wt)) 

ggplot(mtcars,aes(x=hp, y=mpg)) +      
  geom_point(aes(shape = factor(am), colour = factor(am),  #같은 am factor를 가지고 shape, colour 둘다 사용할 수 있음
                 size = wt)) +
  scale_color_manual(values= c('red', 'green'))

ggplot(mtcars, aes(x=hp, y=mpg)) +
  geom_point(colour='red') + 
  geom_line(colour='blue') + #scattered points 를 다 line 으로 이어줌 (딱히 상관관계선은 아님 그냥 점끼리 잇기)
  labs (x='마력', y='연비(mile/gallon)')  # x, y 축 이름을 바꿔줌

#-------------------------------------------------------------------------------------

three <- read.csv("학생별과목별성적_3기_3명.csv")
three
sort_score <- arrange(three, 이름, 과목)

ggplot(sort_score, aes(x=과목, y=점수, 
                       color=이름, group=이름, fill = 이름)) + #aesthetic 한 면에서 color&group을 이름 이라는 팩터로 정리해라
  geom_line() + 
  geom_point(size = 2, 
             shape=14 ) + # shape 은 숫자에 따라 모양이 다름
  ggtitle("학생별 과목별 성적")

#---------------------------------------------------------------------------------------

dis <- read.csv('1군전염병발병현황_년도별.csv'
                , stringsAsFactors=F)  #년도별의 2002년, 2003년 등이 하나하나 별개 factor로 쳐져서 총 11개의 추가 factor가 생기지않게ㅔ 하기 위해, stringsAsFactors= False 로 놓는 것 
str(dis) #위의 것이 F 가 되면, 년도별에서 각각 다른 스트링이라고 해도 그것 하나하나를 factor로 놓지 않게 됨

ggplot(dis, aes(x=년도별, y=장티푸스, group=1)) +
  geom_area(fill='cyan', 
            alpha = 0.3) +  # alpha -> 투명도: 0이 제일 투명 < 1은 불투명
  geom_line(colour='blue')

















































