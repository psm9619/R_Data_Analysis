# in R, Data Types are not super important -> it's more relaxed than in other languages
# some types are character, string, numerics, Date, logic,

# basic calculations 기본연산자
# + -> can be used only for numeric ('a'+'b' NOT POSSIBLE)
# - -> same
# * -> multiple
# / -> regular division,  %/% -> quotient (몫), %% -> modulo (나머지)

# as.numeric('..') -> translate '..' into Numeric (only for the '1', '-5' kinds)
as.numeric('1')+as.numeric('pi')

# A <- B , B -> A : both return same result. simply different in which step occurs first
a <- 3 ; a ; 3 -> b; b
# & or && 
#     and : & is for one data to another, && is for one group to another
#     ex. c('a','b') & c ('a', 'c'): T, F   vs.  c('a','b') && c('a', 'c'): F
# | -> or : just like any other 'or'
# ******* important!! for numbers, 0 means False, Non-zero means True whether it is 1, 100 or -499. 
1 & 3 ; 0 & 3;  0 | 3 
c(1,4) & c(1,5) ; c(0,3) & c(1,0)

# NA: Not Applicable -> can't be modified or used in calculation or second step process, etc.
# NULL: No answer, empty data -> doesn't get printed but can be ignored for second step processes (doesn't stop the function)
cat (1, NA, 2, ' ')   ; sum (1, NA, 2)
cat (1, NULL, 2, ' ')  ; sum (1, NULL, 2)
# na.rm = T -> Remove data if NA, which may stop or disable the whole process/function
sum (1 ,NA, 2, na.rm = T)
# class (..) -> returns the data type (class) of the given data 
class ('a') ; class (1) ; class (T) ; class (1 & 8)
class (NA) # logical type 
class (NULL) # NULL type

# factor(dataset$name of column heads): 데이터 모음(메트릭스, 데이터 프레임 등) 에서 특정 데이터를 묶어줌
txt1 <- read.csv ('factor_test.txt')
txt1
factor1 <- factor(txt1$no) ; factor1
class (factor1) # factor  is factor class/type
factor2 <- factor(txt1$sex) ; factor2

# summary(factor) : returns non-overlapping list of factors with counts of data under that specific factor
# 말 그대로 summary of factors & 각 factor 로 묶어지는 데이터의 개수 를 return
sum1 <- summary(factor2) ; sum1

































