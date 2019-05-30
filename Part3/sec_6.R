# R에서 차원별 배열
# 1차원: Vector     2차원: Matrix     3차원: Array
vec1 <- c(1:5)
vec1

# CRUD (Create Retrieve Update Delete)
vec1[3]   # JAVA와 같이 [index #] 사용 
vec1[1:3] 
vec1[-1:-3]  # 벡터배열을 출력할때 주어진 인덱스 넘버의 값만 빼고 보여줌

length(vec1)   #length(배열) 벡터배열의 크기
vec1[1:(length(vec1)-1)]  #length 이용해서 인덱스 a 부터 b까지 출력하라는 명령도 내릴 수 있음 (JAVA 와 비슷)

## 값바꿈/추가 및 배열 추가
vec1[3] <- 6 ; vec1   # <- 이용해서 배열의 특정값 바꾸기, 재대입하기
vec1 <- c(vec1, 7, 8) ; vec1   # c(기존벡터, 더해지는 원소들) --> 배열 추가
vec1[9] <- 9 
vec1   # 단순히 vector[추가적인 배열의 인덱스] 로도 배열 추가 가능. 이 때 값이 주어지지 않은 빈 배열은 NA 로 표시

append (vec1, 10, after=3)  # append(벡터, 값, after=특정 인덱스넘버) --> 함수로도 값 추가, 배열 추가 가능 
vec1  #단순히 append 로 값을 추가하는 것은 일시적. 본래 변수 vec1 <- append() 로 이 변수에 이 값을 저장하겠다는 것이 있어야 함
vec1 <- append (vec1, c(-1, -2), after=7)
vec1
vec1 <- append(vec1, 100, after=0)
vec1  #맨 앞 (인덱스 1 이전)에 새로운 값 추가

# vector 간의 연산
c(1,2,3) + c(4,5,6)   #길이가 같은 배열끼리 더함. 해당 원소끼리 더함
c(1,2,3) + 1    # vector + sclar --> 모든 벡터값에 동일한 scalar 가 더해짐
var1 <- c(1,2,3) ; var2 <- c(4,5,6)
var1+var2
var3 <- c('3', '4')  #character 벡터임 Non numeric
var1 + var3   #이것은 number + character --> 불가능

union(var1, var3) 
#union(배열1, 2: 다른 클래스여도 됨) --> 합집합 만듦. 이 때 말 그대로 교집합, 겹치는 값은 제외, 중복 없는 결과

var4 <- c(1,2,3,4,5)
var1; var4
var1 + var4   #서로 길이가 다른 (그러나 같은 numeric 클래스) 벡터 연산: 우선 가능하다.
#이 때 짧은 벡터를 그것이 끝난 부분부터 다시 1로 돌아와서 연산
#이 때 긴 벡터길이가 만일 작은 벡터의 배수로 떨어지지 않는다면 (ex. 5/3) warning 이 뜸
var5 <- c(1,2,3,4,5,6)
var1 + var5   #여기서는 var5가 더 길지만 길이가 6으로 var1 의 길이는 3, 둘은 배수이므로 warning 없음

var1 <- c(1:3) ; var2 <- c(3:5)
var1 - var2  #단순 벡터간 빼기 연산, 각 해당값끼리 연산

setdiff(var1, var2)  #차집합 계산 (먼저 나온 벡터에서 교집합 제외)
setdiff(var2, var1)  
intersect(var1, var2)  #교집합

fruits <- c(10,20,30) ; fruits
names(fruits) <- c('apple', 'banana', 'grape')  #벡터에 name(벡터)라는 새로운 벡터를 할당, 각 값과 name 들이 매치됨
fruits 

var5 <- seq(1,6); var5   # seq(a, b) -> a 가 시작값, b 가 끝값: 양수 음수 상관없이
var6 <- seq(2,-2) ; var6
odd <- seq (1,10, 2) ; odd  # seq(a,b, c) --> c는 by = c 와 같은 것으로 각 값들간의 간격을 정해주는 것
even <- seq (2,10, 2) ; even

var1 <-rep(1:3, 2) ; var1   # rep(a~b, #) --> a부터 b까지 한번에 값을 #번 반복하는 벡터
var2 <-rep(1:3, each=2) ; var2   #rep(a~b, each = #) --> 각 값을 #번씩 반복하는 벡터

# A %in% b --> A(값 하나일 수도, 어떤 벡터일수도 있음)가 b를 가지고 있는지 확인하여 TRUE FALSE 로 출력
3 %in% 1
3 %in% 3
var1 %in% 2
var1 %in% even















