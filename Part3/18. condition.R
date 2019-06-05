#조건문, 반복문

#비교 
#조건
if () {
} else {
}

myAbs <- function (a) {
  if (a>0){
  return (a) }
  else {
    return (-a) 
  }
}
myAbs(-3.4)

myAbs2 <- function (a) {
  if (a>0){
    return (a) }
  return (-a) 
}  # else {} 없이 바로 써도 됨 -> if () {...} else {xxx} == if () {...} xxx
myAbs2 (-3.4)

fn1 <- function (a) {
  if (a>0){
    return (a*a)
  } 
  return (0)
}
fn1 (3)
fn1 (-4)

fn2 <- function (a) {
  if (a>0){
    a <- a*2
  } 
  else if ( a==0) {
    a <- 0
  } 
  else {
    a <- -a
  } 
  return (a)
}
fn2 (-3)

number <- scan()
res <- ifelse (number %%2 == 0, '짝수', '홀수')  #ifelse (조건, A, B) -> 조건이 참일떄 A, 거짓일 때 B
res

##############
myf1 <- function (a) {
  if (a>5) {return (1)  }
  return (0)  
}
myf1 (5) ; myf1(4); myf1(6)

myf2 <- function (a) {
  if (a>0) {return (1)}
  else if (a <0) { return (0)  }
  else {
    return ('0')}
}
myf2 (1); myf2(0); myf2(-1)

myf3 <- function (a, b) {
  if (a>b) {return (a-b)}
  else if (b >a ) { return (b-a)  }
  else {
    return ('0')}
}
myf3 (1,2) ; myf3(2,1) ; myf3(1,1)


myf4 <- function (a) {
  if (a <0) {
    return (0)}
  else if (a>= 1 && a<= 5 ) { 
    return (1)}
  else if (a > 5) {return (10)}
  return ('beep') 
}

myf4 (-4) ; myf4(1.3) ; myf4(6); myf4(0.2)

library (stringr)

ans <- scan(what= "") # scan() 은 기본적으로 정수 int 만 받음. string 을 받기 위해서는 scan (what = "")
myf5 <- function (a) {
  if (a == regex('Y', ignore_case = T)) {return ('Yes')}
  else {
    if (a== 'y') {return ('yYES')}
    else if (a== 'Y') {return ('YYES')}
    return ('Not Yes')}
}

myf5 ('y') ; myf5('Y'); myf5('no') ; myf5(3)

myIntD <- function (a, b, c) {
  d <- b*b - 4*a*c;
  cat ('D is',d,'\n');
  if (d > 0) {
    return (2)
  } else if (d == 0) {
    return (1)
  } else {
    return (0)
  }
}

myIntD (1, 2, 1)

myRealD <- function (a, b, c) {
  d <- b*b - 4*a*c;
  cat ('D is',d,'\n');
  if (d < 10^(-5)) {
    return (0)
  } else if (d > 0) {
    return (2)
  } else {
    return (0)
  }
}
myRealD (1.00000000001, 2.0000000001, 1.00000000001)
#실수의 근의 공식 비교시에는 d<0 -> 0 대신 0.00001 정도 (1e-5 또는 10^(-5)) 로 놓는다. -> 오차 범위 설정
#같은 맥락에서 x 와 y 중 하나 또는 둘 다 실수 일 떄 시수의 가수부분 (소수점 이하) 때문에 x == y 로 동일함을 비교하는 것은 불가능
#따라서 abs(x-y) < 1e-10 정도로 놓는다.












