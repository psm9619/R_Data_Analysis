# 그래픽 기초
setwd ("d:/Workspace/R_data_analysis/Part4")

#data table 에서 필요한 데이터만 뽑아서 plot 을 할 수 있는 형태로 가공하는 것이 R 로 하는 프로그래밍
# plot('y축 데이터', 'x 데이터') -> 만일 한 쪽 값만 주어질 경우 y축으로 사ㅛㅇ하는 것이 default

var1 <- 1:5
plot (var1)

x <- 1: 3
y <- 3: 1
plot (x,y)

plot (x, y, xlim = c(0,5), ylim = c(0,5), xlab = 'x', ylab = 'y', main = 'plot')
v1 <- c(100,130, 120, 160, 150)
plot (v1, type = 'o', col = 'red',
      ylim = c(0,200), axes = FALSE, ann= F)
axis (1, at= 1:5, lab= c ('M', 'T', 'W', 'Th', 'F'))
axis (2, ylim= c(0,200))
title (main = 'FRUIT', col.main='red', font.main=1)
title (xlab = 'Day', col.lab = 'black')
title (ylab = 'price', col.lab= 'blue')

par(mfrow = c(2,3)) # partition -> 한 창에 여러개의 그래프를 넣음 -> 일종의 표처럼, c(행의 개수, 열의 개수)
plot (v1, type = 'o')
plot (v1, type = 'l')
pie(v1)  # pie 그래프
barplot(v1) # 막대그래프

par(mfrow = c(1,1)) #원위치, 1개만 나오도록 하는 것
a <- c(1,2,3)
plot (a, xlab = 'bbb')
par ('mgp')
par(mgp=c(0,1,0)) # mgp = c(제목위치, 지표값 위치, 지표선 위치)
par (mgp = c(5,2,4))

par(oma = c(2,1,0,0))
plot (a, xlab = 'aaa')
par (oma = c (0,2,0,0))

v1 <- c(1,2,3,4,5)
v2 <- c(5,4,3,2,1)
v3 <- c(3,4,5,6,7) #since v3 has data up to 7, our scale ylim should include that max data
plot (v1, type = 's', col='red',ylim = c(1,10))
par(new = T)  #par ( new = T) -> new graph is True and it can overwrap
plot (v2, type = 'o', col='blue', ylim=c(1,10))
par(new = T)
plot (v3, type = 'l', col='green', ylim= c(1,10)) 

#giving legend (범례)
legend(4,10, #위치, 크기 
       c('v1', 'v2', 'v3'), #데이터 종류 
       cex=0.9, #글자크기
       col = c('red','blue', 'green'), #컬러
       lty=1) #선 길이


################# bar graph
x <- 1:5
barplot(x)
barplot(x, horiz=T)
x <- matrix(c(5,4,3,2),2,2) # matrix (c(...), number of rows, number of columns) or (c(..), nrow=b)
x
barplot(x, beside = T, # beside = T 같은 그룹내 자료끼리 붙여서 비교
        names = c('1번','2번'),  # 각 데이터 그룹의 이름름
        col = c('green', 'yellow'))  #그룹내 각 데이터 색깔 지정

barplot(x, beside = T,
        names = c('1번','2번'),  
        col = c('green', 'yellow'), horiz = T)  # horiz = T : 막대그래프를 옆으로 눞임

par (oma = c(1,0.1, 1, 0.5)) # 하, 좌, 상, 우 여백 지정

barplot(x, 
        names = c('1번','2번'),  
        col = c('green', 'yellow'), horiz = T,
        xlim = c(0,10)) 


par (oma = c(0,0,0,0))
v1 <- c(100,120,140,160,180)
v2 <- c(120,130,150,140,170)
v3 <- c(140,170,120,110,160)
qty <- data.frame (BANANA=v1, CHERRY = v2, ORANGE = v3)
qty
barplot (as.matrix(qty), main = "Fruit's Sales Qty", 
        beside = T, col=rainbow(nrow(qty)), ylim = c(0,400))
legend (14,400, c('M','T','W','Th','F'), cex=0.8, fill=rainbow(nrow(qty)))
barplot(t(qty), #transpose matrix -> 전치 행렬, 행과 열의 데이터를 바꿈
        main= 'Frutis Sales Qty', ylim=c(0,900),
        col = rainbow(length(qty)), space=0.1, cex.axis = 0.8, las=1,
        names.arg = c('M','T','W','Th','F'), cex = 0.8)
legend (0.2, 800, names(qty), cex=0.7, fill= rainbow(length(qty)))

peach <- c(180,200,250, 198, 170)
color <- c()
for (i in 1:length(peach)) {
  if (peach[i] >= 200) 
    color <- c(color, 'red')
  else if (peach[i] >= 180) 
    color <- c(color, 'yellow')
  else 
    color <- c(color, 'green')
}
color
barplot(peach, #데이터
        main = 'Peach Sales qty',  #메인 타이틀
        names.arg = c('M','T','W','Th','F'),  # x 축 value 들의 이름 (argument's names) 
        col = color # col = 내가 지정해준 color 벡터 한번에 대입
        )

height <- c(182,175,167,172,163,178,181,166,159,155)
par(mfrow=c(1,2))
height
barplot (height)
hist (height)  #hist -> histogram 일정 구간을 나눠서 각 구간에 해당되는 데이터 개수를 y 삼아서, 각 구간별 크기를 나타냄

par(mfrow=c(1,1))
p1 <- c(10,20,30,40)
pie(p1, radius=1)
pie (p1, radius=1, init.angle= 90, #init.angle -> 시작을 북쪽 90도에서 시작해서 반시계방향으로 돌아감
    col = rainbow(length(p1)),
    label = c('W1', 'W2','W3', 'W4')
    )
pct <- round (p1/sum(p1) * 100,1)
lab <- paste(pct, '%') 
lab
pie (p1, radius=1, init.angle = 90, col= rainbow(length(p1)),
     label = lab)
legend (0.85, 1.08, c('wk1', 'wk2', 'wk3','wk4'),
        cex=0.5, fill = rainbow (length(p1)))

lab1 <- c('wk1', 'wk2','wk3', 'wk4')
lab2 <- paste(lab1, '\n', pct, '%')
pie(p1, radius=1, init.angle=90, col = rainbow(length(p1)), label = lab2)

install.packages('plotrix')
library(plotrix)
p1 <- c(10,20,30,40,50)
f_day <- round (p1/sum(p1) * 100,1)
f_label <- paste(f_day, '%') 
pie3D (p1, main = '3D Pie Chart', col=rainbow(length(p1)), 
       cex = 0.5, labels= f_label, explode = 0.05)
legend (0.78, 1.14, c('M','T', 'W','Th', 'F'), cex = 0.6, fill=rainbow(length(p1)))

#####################################
##   box plot   ####
v1 <- c(10,12,15,11,20)
v2 <- c(5,7,15,8,9)
v3 <- c(11,20,15,18,13)
boxplot(v1, v2, v3)  # boxplot 찾아서 공부
boxplot(v1, v2, v3, col = c('blue', 'yellow','pink'),
        names=c('blue','yellow', 'pink'),
        horizontal = T)

#####################################
# 관계도  #
par (oma = c(0,0,0,0))
install.packages('igraph')
library (igraph)
g1 <- graph (c (1,2, 2, 3, 2, 4, 1,4, 5, 5, 3,6))
plot (g1)
str(g1)

name <- c('a', 'b', 'c' ,' d' ,'e' ,'f','g', 'h','i')
pemp <- c('a','a', 'b' , 'c','a','f','a','f','f','')
emp <- data.frame(이름= name, 상사 = pemp)
emp
str(emp)
g <- graph.data.frame(emp, directed = F) # directed = T/F-> 화살표 머리의 유무
plot (g, layout= layout.fruchterman.reingold, 
      vertex.size=8, edge.arrow = 0.5)
png('graph/network_2.png', width = 600, height= 600)
#dev.off()

install.packages('devtools')
install.packages('d3Network')
library(d3Network)

name <- c('a', 'b', 'c' ,' d' ,'e' ,'f','g', 'h','i')
pemp <- c('a','a', 'b' , 'c','a','f','a','f','f','')
emp <- data.frame(이름= name, 상사 = pemp)
d3SimpleNetwork(emp, width=600, height =600, file = 'graph/d3.html')

g <- read.csv('data/군집분석.csv', head=T)
graph1 <- data.frame (학생= g$학생, 교수=g$교수)
g <- graph.data.frame (graph1, directed=T)
plot(g, layout=layout.fruchterman.reingold, 
     vertex.size=2, edge.arrow.size=0.5, vertex.color='green', vertex.label = NA)
plot(g, layout=layout.kamada.kawai, 
     vertex.size=2, edge.arrow.size=0.5, vertex.color='green', vertex.label = NA)

V(g)$name # Vertex name (value)
gubun1 <- V(g)$name
gubun1
library(stringr)
gubun <- str_sub(gubun1, start=1, end=1)  #str_sub ('...', start=a, end=b) -> '...' 중에 a 부터 b 인덱스까지만 substring 을 뽑아내겠다.
gubun

colors <- c()
sizes <- c()
shapes <- c()
for (i in 1:length(gubun)) {
  if (gubun[i] == 'S') {
    color <- c(colors, 'red')
    sizes <- c(sizes, 2)
    shapes <- c(shapes, 'circle')
   } 
  else {
    color <- c(colors, 'green')
    sizes <- c(sizes, 6) 
    shapes <- c(shapes, 'square')
  }
}

plot(g, layout=layout.fruchterman.reingold, 
     vertex.size= sizes, 
     edge.arrow.size=0, vertex.color=colors
     ,vertex.label = NA)

#교수와 학생 모형 다르게 하고 화살표 없애고 색도 다르게 하기
plot(g, layout=layout.kamada.kawai, 
     vertex.size= sizes, 
     edge.arrow.size=0, vertex.color=colors
     ,vertex.label = NA,
     vertex.shapes = shapes)


###############################




































