<<<<<<< HEAD
#Data Type
#R에서는 data type 을 별로 따지지 않음
5/2
3/4

#나눗셈의 몫 %/%
3%/%4
#나눗셈의 나머지 %%
5%%4

1000000000000+10000000
1/100000000000

# ''에 쌓인 숫자는 더이상 numeric variable 이 아닌 문자로 취급
#'1'+'2'
#as.numeric() 을 이용하면 문자형식을 숫자로 치환할 수 있음.
as.numeric('1') + as.numeric('2')

#변수 설정 및 대입 : 대입은 <-
first <- 1
first

#class() 입력값의 data type 출력
class(1)      #numeric
class('1')    #character

#and &, or | 
#-> 그냥 숫자끼리 비교할 때 0만 아니면 낱개들은 다 TRUE 임. 0 은 이진수로도 0이라서 FALSE 값
#T & T -> T, T & F -> F, F & F -> F
#T | T -> T, T | F -> T, F | F -> F
3 & 9
3 & 0
1 | 4
1 | 0
class(3 & 9)    #TRUE, FALSE 는 logical 클래스

#NA: 잘못된 값 들어옴 (Not Applicable), NULL: 값이 안 나옴.
cat(1,NA,2) #단순 출력이므로 NA 는 상관없음
cat(1,NULL,2) #NULL 은 아예 값이 없으므로 출력이 안됨
sum(1,NA,2) #덧셈연산에 NA는 해당이 안 되므로 계산자체가 불가능
sum(1,NULL,2) #덧셈에서 NULL = 0 과 같으므로 상관 없음
#na.rm = T, NA 값 = True 라면 remove 해라
sum(1, NA, 2, na.rm = T)

class(NA)     #NA 는 logical 클래스
class(NULL)   #NULL 은 자체로 NULL 클래스

#작업용 기본 디렉토리 설정은 setwd (디렉토리 주소)
setwd ("D:/Workspace/R_data_analysis/Part3/data")
txt1 <- read.csv("factor_test.txt") #read.csv(~.csv) 주어진 csv 파일을 읽어서 변수에 대입
txt1

factor1 <- factor(txt1$no) #factor(csv대입변수이름$데이터를 구분하는 열의 이름) 
#                           특정데이터의 자료들을 출력 (그 열의 행자료들을 출력)  
factor1
factor2 <- factor(txt1$sex)
factor2

class(factor(txt1$sex))     #factor 은 자체로 factor 클래스
class(factor2)

summary1 <- summary(factor2) #summary() 특정데이터 자료들을 빈도에 따라 정리, 출력
summary1

#date 및 시간 출력
Sys.Date()   #R의 기본형식은 2019-05-30
Sys.time()   #2019-05-30 09:15:51 KST --> 기본형식 date + time 기본 + time zone
date()       #미국 식 시간표기 : Thu May 30 09:16:47 2019 
class(Sys.Date())   #date 은 자체로 date 클래스

#"2019-05-30"을 그냥 type하면 character 클래스. 이것을 date 타입으로 바꾸기위해 as.Date(" ")을 사용
class("2019-05-30")
d <- as.Date("2019-05-30")  
class(d)
as.Date("19-05-30")   #R의 표준 형식으로 쓰이지 않으면 제대로 읽지를 못한다.
as.Date("30-05-2019") #미국식도 마찬가지로 읽지못함
#따라서 내가 입력한 charcter dates 의 형식은 이러이러하다 라고 format=""을 사용해야 함
as.Date("30-05-2019", format="%d-%m-%Y")  
as.Date("190530", format="%y%m%d")
as.Date("2019년 05월 30일", format="%Y년 %m월 %d일")
as.Date("05-30", format="%m-%d")

#특정 origin 부터 특정 일수만큼 지나간 것 계산
as.Date(10, origin="2019-05-30")
as.Date(10, origin=Sys.Date())

#날짜 연산
"2019-05-30" - "2019-05-27"   #현재 직접연산은 character 타입이라서 가능하지 않음
as.Date("2019-11-14") - Sys.Date()   #as.Date("캐릭터열") 으로 변환 후에는 가능함

as.Date("2019-05-30 20:00:00") - as.Date("2019-05-30 12:00:00")  #POSIXlt 하루 단위 계산
as.POSIXct("2019-05-30 20:00:00") - as.POSIXct("2019-05-30 12:10:04")  #POSIXct 초 단위로 계산한 시간차를 출력 (초 말고 보기 쉬운 더 큰 단위로 출력됨)
 
install.packages("lubridate")   #추가 package install
library(lubridate)    #앞으로 이 package를 사용할 때는 그냥 library() 로 부르면 됨
d <- now() #lubridate 설치 후 더 빠르게 바뀐, 새로운 함수
year(d)
month(d)
month(date, label=T)  #label = T, 어떻게 카운트 매기는지, 그리고 현재는 그 기준으로 몇 번쨰인지
day(date)  #달의 1일부터 절대적인 day 카운트
wday(date) #해당 주의 일요일부터 카운트: 목-->5번째 day
wday(date, label = T)
d <- d - days(2)  #변수에 값 재입력, days(2) 이틀을 빼거나 더하는 등의 연산 가능
d  #원래 d 값의 날짜부터 이틀이 제해진 새로운 값

d + years(1) #years(1) --> 1년을 더함 

d <- now()
d+months(-2)   # + months( - 2) 를 하던, 
d-months(2)    # - months(2) 를 하던 결과는 같음

d <- hm("22:30")  #hm --> hours, minutes 시간 및 분을 대입시킬 때 사용
d  
d <- hms("22:30:14")   #hms --> hours, minutes, seconds 시간,분,초 대입
d

















=======
#Data Type
#R에서는 data type 을 별로 따지지 않음
5/2
3/4

#나눗셈의 몫 %/%
3%/%4
#나눗셈의 나머지 %%
5%%4

1000000000000+10000000
1/100000000000

# ''에 쌓인 숫자는 더이상 numeric variable 이 아닌 문자로 취급
#'1'+'2'
#as.numeric() 을 이용하면 문자형식을 숫자로 치환할 수 있음.
as.numeric('1') + as.numeric('2')

#변수 설정 및 대입 : 대입은 <-
first <- 1
first

#class() 입력값의 data type 출력
class(1)      #numeric
class('1')    #character

#and &, or | 
#-> 그냥 숫자끼리 비교할 때 0만 아니면 낱개들은 다 TRUE 임. 0 은 이진수로도 0이라서 FALSE 값
#T & T -> T, T & F -> F, F & F -> F
#T | T -> T, T | F -> T, F | F -> F
3 & 9
3 & 0
1 | 4
1 | 0
class(3 & 9)    #TRUE, FALSE 는 logical 클래스

#NA: 잘못된 값 들어옴 (Not Applicable), NULL: 값이 안 나옴.
cat(1,NA,2) #단순 출력이므로 NA 는 상관없음
cat(1,NULL,2) #NULL 은 아예 값이 없으므로 출력이 안됨
sum(1,NA,2) #덧셈연산에 NA는 해당이 안 되므로 계산자체가 불가능
sum(1,NULL,2) #덧셈에서 NULL = 0 과 같으므로 상관 없음
#na.rm = T, NA 값 = True 라면 remove 해라
sum(1, NA, 2, na.rm = T)

class(NA)     #NA 는 logical 클래스
class(NULL)   #NULL 은 자체로 NULL 클래스

#작업용 기본 디렉토리 설정은 setwd (디렉토리 주소)
setwd ("D:/Workspace/R_data_analysis/Part3/data")
txt1 <- read.csv("factor_test.txt") #read.csv(~.csv) 주어진 csv 파일을 읽어서 변수에 대입
txt1

factor1 <- factor(txt1$no) #factor(csv대입변수이름$데이터를 구분하는 열의 이름) 
#                           특정데이터의 자료들을 출력 (그 열의 행자료들을 출력)  
factor1
factor2 <- factor(txt1$sex)
factor2

class(factor(txt1$sex))     #factor 은 자체로 factor 클래스
class(factor2)

summary1 <- summary(factor2) #summary() 특정데이터 자료들을 빈도에 따라 정리, 출력
summary1

#date 및 시간 출력
Sys.Date()   #R의 기본형식은 2019-05-30
Sys.time()   #2019-05-30 09:15:51 KST --> 기본형식 date + time 기본 + time zone
date()       #미국 식 시간표기 : Thu May 30 09:16:47 2019 
class(Sys.Date())   #date 은 자체로 date 클래스

#"2019-05-30"을 그냥 type하면 character 클래스. 이것을 date 타입으로 바꾸기위해 as.Date(" ")을 사용
class("2019-05-30")
d <- as.Date("2019-05-30")  
class(d)
as.Date("19-05-30")   #R의 표준 형식으로 쓰이지 않으면 제대로 읽지를 못한다.
as.Date("30-05-2019") #미국식도 마찬가지로 읽지못함
#따라서 내가 입력한 charcter dates 의 형식은 이러이러하다 라고 format=""을 사용해야 함
as.Date("30-05-2019", format="%d-%m-%Y")  
as.Date("190530", format="%y%m%d")
as.Date("2019년 05월 30일", format="%Y년 %m월 %d일")
as.Date("05-30", format="%m-%d")

#특정 origin 부터 특정 일수만큼 지나간 것 계산
as.Date(10, origin="2019-05-30")
as.Date(10, origin=Sys.Date())

#날짜 연산
"2019-05-30" - "2019-05-27"   #현재 직접연산은 character 타입이라서 가능하지 않음
as.Date("2019-11-14") - Sys.Date()   #as.Date("캐릭터열") 으로 변환 후에는 가능함

as.Date("2019-05-30 20:00:00") - as.Date("2019-05-30 12:00:00")  #POSIXlt 하루 단위 계산
as.POSIXct("2019-05-30 20:00:00") - as.POSIXct("2019-05-30 12:10:04")  #POSIXct 초 단위로 계산한 시간차를 출력 (초 말고 보기 쉬운 더 큰 단위로 출력됨)
 
install.packages("lubridate")   #추가 package install
library(lubridate)    #앞으로 이 package를 사용할 때는 그냥 library() 로 부르면 됨
d <- now() #lubridate 설치 후 더 빠르게 바뀐, 새로운 함수
year(d)
month(d)
month(date, label=T)  #label = T, 어떻게 카운트 매기는지, 그리고 현재는 그 기준으로 몇 번쨰인지
day(date)  #달의 1일부터 절대적인 day 카운트
wday(date) #해당 주의 일요일부터 카운트: 목-->5번째 day
wday(date, label = T)
d <- d - days(2)  #변수에 값 재입력, days(2) 이틀을 빼거나 더하는 등의 연산 가능
d  #원래 d 값의 날짜부터 이틀이 제해진 새로운 값

d + years(1) #years(1) --> 1년을 더함 

d <- now()
d+months(-2)   # + months( - 2) 를 하던, 
d-months(2)    # - months(2) 를 하던 결과는 같음

d <- hm("22:30")  #hm --> hours, minutes 시간 및 분을 대입시킬 때 사용
d  
d <- hms("22:30:14")   #hms --> hours, minutes, seconds 시간,분,초 대입
d

















>>>>>>> cebd11c0f89d3fa369dd13ce1639fb47fe6e1cd9
