# Data Frame
# two dimensional data structur in R
# data.frame(A=c(), B=c(), ..)

no <- c(1:4)
name <- c("A", "B","C", "D")
price <- c(500:503)
qty <- c(4:1)
sales <- data.frame(NO=no, NAME=name, PRICE=price,QTY=qty)
sales

class(sales)  # returns "data.frame"
str(sales)  # structure of d.f. with its factor/column: data type & the list of data 
sales$NAME  # as it is described in the structure,  





















