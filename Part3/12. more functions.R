# sweep
mat1 <- matrix (c(1:6), nrow=2, byrow=T) ; mat1
a <- rep(1,3) ; a   # rep (a, b) a 를 b 번 반복하라
sweep (mat1, 2, a)  # sweep(매트릭스, 행/렬 방향, a 값) 매트릭스의 모든 값에서 주어진 방향으로 a 값을 제해라
b <- matrix (c(1,2)) ; b ;mat1  #사실상 매트릭스끼리의 행렬 더하기/빼기 연산임. 행,렬 맞춰봐야함
sweep (mat1, 1 , b)
c <- matrix (c(1:3)) ; c ; mat1
sweep (mat1, 1, c)  # c는 1열3행, 반면 mat1 은 3열2행.따라서 행의 방향으로 전체빼기(sweep) 을 하라고 하면 에러가 나옴
sweep (mat1, 2, c)  # 열의 방향으로는 mat1이 3열, c 가 3행으로 맞기 때문에 가능하다

# R에서 log 는 natural log --> 밑 수가 e 인 것
log(10)
log10(10)
# 삼각함수 존재, 각으로는 pi 사용
# 절대값 abs()
abs(-3)

# ceiling () --> 올림한 정수
ceiling(2.3)
# floor () --> 내림한 정수
floor(1.1)
# round () --> 반올림
round(2.5) #wowow, 반올림 한 것은 의외지만 짝수를 향해 가는 규칙이 있다고 한다.
round(3.5) #같은 0.5 값이어도 짝수가 올림수라면 올리고, 내림수면 내리고
?round()

# choose(n,r) --> nCr = (n!)/(r!(n-r)!) 경우의 수 구하기
choose(5,3) 

# 직접 함수만들기
myfunc <- function() {
  return (10)
}
myfunc()

myfunc2 <- function(x){
  y = x + x;
  return (y)
}

myfunc2(1)



func_test1 <- function( a, b) {
  c = a-b;
  return (c)
}
func_test1(1,2)
func_test2 <-function(a) {
  return (abs(a))
}
func_test2(func_test1(1,2))

func_test1_1 <- function() {
  a <- readline("put in a : ");
  b <- readline("put in b : ");
  c <- as.numeric(a) - as.numeric(b);
  return (c)
}

func_test1_1()







       