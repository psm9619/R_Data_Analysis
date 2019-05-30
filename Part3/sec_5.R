var <- c("a","b","c")   #a, b, c 라는 각각의 문자 데이터를 한번에 담음 --> Array 형태
var
var <- c(1, 2, 3)
var

111->var1->var2     #값을 연속적으로 할당 
var1 ; var2
var3 <- var4<-222   #rotation 할당 화살표 방향은 아무쪽이나 상관없다
var3 ; var4 
 
string1 <- "V Easy R Programming" ; string1
string2 <- 'V Easy R' ; string2     #작은 따옴표로 묶어도 문자열은 무조건 "  " 로 출력됨
string3 <- 'he said "I ate breakfast"' ;
string3  # " " 를 ' ' 안에 넣으면 큰따옴표 앞뒤로 백슬래쉬 사이에 대화체로 묶는다
string4 <- "he said \"I ate breakfast\""
string4

num1 <- 1
num2 <- 2
num1 + num2
char1 <- "a"
num1 + char1  #불가능

seq1 <- 1:5 ; seq1    # a:b --> a 부터 b 까지의 연속적인 수를 대입 
#이러한 기능은 Python 에도 적용. 이러한 점이 엄청난 양의 데이터를 분석할 때 도움이 된다  
seq1 <- "a":"f"    # : 는 numeric 에만 가능. 문자는 NA 에러

#date 의 연속적인 sequence 는 seq(from=   , to=   , by=(데이터 간 간격 ex. 하루, 격주, 매달 등))
date1 <- seq(from=Sys.Date(), to=(Sys.Date() + months(1)) , by=1) 
date1
date2 <- seq(from=Sys.Date(), to=(Sys.Date() + years(1)) , by='month')  
#오늘부터 1년 후까지의 날 중 1개월 단위로 연속적인 데이터 시퀀스를 저장함
date2 
date3 <- seq(from=as.Date('2014-04-29'), to=Sys.Date(), by='year')
date3

#지금까지 생성한 모든 변수들 출력 (사실상 R Studio에서 Environmental values 우측에 보여주는 것과 같음)
objects()
.hidden <-3  # .AA 점을 찍고 변수 이름을 적으면 숨김변수 --> 우측 밑 objects() 에도 안 나옴. 다만 그 변수를 부르면 출력 그대로 됨
.hidden

#변수 완전삭제 --> rm(변수이름)
rm(date1)
objects()
ls()  #list of objects 
rm(list = ls())   #list 라는 변수에 ls() 모든 변수 리스트를 대입한 후 remove 한 것
objects() #이제 모든 visible 변수들은 지워짐
.hidden   #다만 히든변수 (.AA) 는 지워지지 않음




