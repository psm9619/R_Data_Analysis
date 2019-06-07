# 반복문
number <- 0
while (number <5){
  if (number==2) {
    break
  } 
  else  number <- number +1
  print (number)
}


# java 등에서는 for (i = 초기값 ; i<= 끝값; i+2) 식으로 for 반복문 사용
# R 에서는 for (i in a:b) -> a 초기값부터 b 끝값까지 1씩 증가/감소 (만일 a 가 더 큰 값이면 알아서 감소함) 해라
for (i in 1:10) {
  print (i)
}
### i in seq (a, b, c) -> a 에서부터 b까지 c씩 뛰어라
for (i in seq(3,100,3)){
  sum <- sum + i
}
print(sum)
### i in c(a,b,c,d,e...) -> c() 벡터안의 데이터들을 하나씩 대입 (순차 순 아니어도 됨)
for (i in c(5,3,2, 4)) {
  print (i)
}


sum <- 0
for (i in 1:100){
  sum <- sum + i
}
print (sum)

#1:100 3의 배수 sum
sum <- 0
for (i in 1:100) {
  if (i%%3 == 0) 
    sum <- sum + i
}
print (sum) 

multiple <- function (limit, number) {
  sum <- 0
  for (i in 1:limit) {
    if (i%%number == 0)
      sum <- sum+i
  }
  return (sum)
}
multiple (100, 3)

for (i in 1:10)
{ cat(i)}

for (i in 1:5) {
  for (k in 1:i){
    cat ('#')
  }
  print (' \n ')
}

for (i in 1:5) {
  line <- ''
  for (k in 1:i) {
    line <- str_c(line, '#')
  }
  print (line)
}


for (i in 5:1) {
  line <- ''
  if (i != 5){
    for (k in (5-i):1){
      line <- str_c(line, '.')
    }
  }
  for (x in 1:i) {
    line <- str_c (line , '#')
  }
  print (line)
}


###########################################################################
for (i in 1:10){
  line <- ''
  if (i <= 4 ){
    for (a in 1:i) {
      line <- str_c (line, '#')
    }
    for (b in 1:(5-i)) {
      line <- str_c(line, '.')
    }}
  
  else {
    # 5<= i <= 10
    if (i!=5) {
      for (c in (i-1):5) {
      line <- str_c(line, '.')
    }}
    for (d in 10:i) {
      line<-str_c(line, '#')
    }}
    print (line) 
}

######################################################
for (i in 1:7) {
  line <- ''
  if (i == 4) {
    for (d in 1:7) {
      line <- str_c(line, '#')}
  }
  else if (i < 4) {
    for (a in i:3) {
      line <- str_c(line, '.')
    } 
    for (b in 2:(2*i)) {
      line <- str_c(line, '#')
    } 
    for (c in i:3) {
      line <- str_c(line, '.')
    }
  }  else {
    for (e in 5:i) {
      line <- str_c(line, '.')
    } 
    for (f in 1:(2*(7-i)+1)) {
      line <- str_c(line, '#')
    } 
    for (g in 5:i) {
      line <- str_c(line , '.')
    }
  }
  print(line)
}
#########################################################

a <- 100
x <- 0
while (x >= 0 && x <= a) {
  x<-x+1
  if (a%%x == 0) 
    cat (x, '')
}

### or ###

a <- 100
for (i in 1:a) {
  if (a%%i ==0) 
    cat(i, '')
}

### to return as a vector 
den <- c(1)
den <- c(den, i) #이렇게 하면 단순히 cat(i, '')로 프린트하는 것을 넘어서 vector 로, 다른 계산 등에 쓰이게 반환 가능



############################################################3
a <- 10
for (i in 1:a) {
  for (k in 1:a) {
    ans <- i * k
    cat( i, 'x' , k, '=', ans, '\n')
  }
}
  
















