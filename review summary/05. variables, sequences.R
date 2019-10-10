# Intro to data

var <- c() # simplest way to create a group of data = vector 

111 -> var1 -> var2 ; var1 ; var2  # either way ->   
var3 <- var4 <- 222 ; var3 ; var4  # or <- works

str1 <- "v easy R programming"
str2 <- 'v easy R programming'
str1 == str2  # "" == '' in R string


#str3 <- 'He said "I ate breakfast"'  ; str3  # "He said \"I ate breakfast\""
str4 <- "He said 'I ate breakfst' "  ; str4  # "He said 'I ate breakfst'"

#str5 <- 'He said \"I ate breeakfast\"' ; str5  # "He said \"I ate breeakfast\""
str6 <- "He said \'I ate breakfast\'"  ; str6  # "He said 'I ate breakfast'"

num1 <- 1 ; num2 <- 2
num1  + num2
char1 <- "a"
# num1 + char1   # can't add non-numeric argument

1:5  # sequence from 1 to 5
# "a":"f" can't be done between non-numeric data
c(2:10) ; c(10:2) # simple sequence that increases or decreases only by integer 1
c(1.25 : 4)

# seq (A, B, C) -> from A, to B, by C
# both (A,B,C) and (from = A, to = B, by = C) works
seq(Sys.Date(), as.Date("2019-06-30"), 2)
seq(Sys.Date(), Sys.Date()+years(5), by= 'year')
seq(Sys.Date(), Sys.Date()+years(5), by= 'month')
seq(1,4,1)
seq(from = 1, to = 10, by =2) 
# instead of by=C, can give length=D which returns a real number sequence (실수->소수 포함함) of length D 
my_seq <- seq(5,20,length=10) 
my_seq 

# To Print out all the variables created so far
objects()
ls() 
# To create a hidden variable -> .변수이름
.a <- 3
objects()  # hidden variable not printed
.a
# To remove a variable or all 
rm (d)  # rm (변수이름)
rm (list = ls()) # remove all the variables created so far
.a  # excaept the hidden variable























