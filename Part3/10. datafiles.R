#Load and Save Data
#작업용 기본 working directory 를 R Studio Tools->gobal->working direc 에서 data 폴더로 설정

list.files()  # working direc의 저장된 모든 파일 이름들 보여줌
list.files(all.files = T) #숨김 파일까지 보여줌

scan1 <- scan('scan_1.txt') ; scan1 
scan2 <- scan('scan_2.txt') ; scan2 #소수점 데이터 포함하는데 그것이 제대로 읽히질 않음
scan2 <- scan('scan_2.txt', what= "") ; scan2 #소수점 데이터를 제대로 읽는대신 캐릭터/스트링으로 변환시켜 내보냄
scan3 <-scan ('scan_3.txt', what="") ; scan3 #what="" 가 스트링 관련
scan4 <-scan ('scan_4.txt', what="") ; scan4 #스트링들은 그냥 스트링으로 나옴

input<-scan()  #사용자로부터 input 받음
input <- scan(what="")  #사용자로부터 string 형태 인풋
input <- scan(what="")
input

input <-readline()  #문장을 통째로 읽어냄 (단어마다 자르지 않고)
input
input <-readline("Are you ok? : ")  #사용자 인풋 이전에 커서 깜박이랑 메세지 뜨게 하는거

input <-readLines('scan_4.txt')  #중간에 L 이 대문자! --> 문장으로 읽어라는 명령
input

#table 형태로 만들어진 자료 (그러나 정확한 표라기보다는 스페이스 등으로 나눈 자료) 를 읽을 때는 read.table()
fruits <-read.table('fruits.txt') ; fruits  
fruits <- read.table('fruits.txt', header=T) ; fruits   #read.table(파일, headr=T) -->내가 주는 파일 첫 줄이 헤더이다

#이 파일에는 원래 중간에 #으로 쓰인 Non-data 가 포함되어있었음. 그건 자동으로 거름
fruits <- read.table('fruits_2.txt') ; fruits 

fruits <- read.table ('fruits_2.txt', skip=2) ; fruits #위에서부터 몇 줄을 스킵하고 읽어라
fruits <- read.table ('fruits_2.txt', nrows=2) ; fruits  #위에서부터 몇 줄만 읽어라

nrow(read.table('fruits_2.txt'))
f2top <- read.table ('fruits_2.txt', nrows=((nrow(read.table('fruits_2.txt')))/2)) ; f2top
f2middle <- read.table ('fruits_2.txt', skip=2, nrows=2) ; f2middle  #skip 과 nrows 를 함께 사용해서 중간부분 자르기

#csv 파일은 , 로만 구분이 되어있어도 excel, R, Python 등 다 읽을 수 있음
fruits <-read.csv('fruits_3.csv') ; fruits #csv 파일은 헤더를 디폴트로 가지고 있다고 간주 -> headr=T없이도 자동으로 첫 줄을 헤더화화

#본래 csv 파일에 header 로 쓰일 첫 줄이 없을 경우 header=F 를 표시
fruits <- read.csv('fruits_4.csv', header=F); fruits
#이 때 수동으로 header 을 간단히 지정하자면 read.csv('  .csv', header=F, col.names=...) 로 쓴다
label <- c("no", "name", "price", "qty")
fruits <- read.csv('fruits_4.csv', header=F, col.names=label) ; fruits

install.packages("googleVis")
library(googleVis)
install.packages("sqldf")
library(sqldf)
Fruits  #package 를 인스톨 하면서 주어진 테스트 데이터
#어떤 데이터를 csv 파일로 저장하는 것--> write.csv(데이터, "...csv", quote=F, row.names=F)
write.csv(Fruits, "Fruits_sql.csv", quote = F, row.names=F)
read.csv("Fruits_sql.csv")
fruits_2 <-read.csv.sql("Fruits_sql.csv", sql="SELECT * FROM file WHERE Year = 2008")
fruits_2
#fruits_2 는 데이터 프레임인데 여기서 Date 이라는 factor 에서 2008년 것을 subset으로 뽑는 것
ftest<-read.csv("Fruits_sql.csv")
ftest$Profit
subset(ftest, Profit>10)
subset(ftest, (Profit>10 & Profit <16))
ftest$Date
ftest$Date[2]
library(lubridate)
year("2007-01-01") - year("2006-01-01")
year(ftest$Date)

subset(ftest, year(ftest$Date) == 2008)


##############################################
install.packages("XLConnect")
library(XLConnect)
data1<-loadWorkbook("fruits_6.xls", create=T)
data2<-readWorksheet(data1, sheet="sheet1", startRow=1, endRow=8, startCol=1, endCol=5)
data2

fruits6<-read.delim("clipboard", header=T)
fruits6

##############################################
install.packages('readxl')
library(readxl)
cust_profile <-read.excel("fruits_6.xls", #path
                          sheet = "sheet1", #sheet name to read from
                          range="A2:D6", #cell range to read from
                          col_names=TRUE, #TRUE to use the first row as column names
                          col_types="guess", #guess the type of columns
                          na="NA" #
)

      









