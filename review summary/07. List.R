# List: list (A=a, B=b, ...) -> A,B,..: key & a,b,... : value

# key & value -> Key must be Unique
# can consist of any data type
list1 <- list (name='Soomin',   # similar to factors and group of data under each. 
               address='Daejeon',  # but different in that the length of data for each group can be different
               phone=c(111, 222),  # while in matrix or other data frame the num of rows for each column is always same
               age=24)  
# to extract certain group of values
list1$name  # list $ key
list1[1] ; list1[1:3]  # list[index]

# to add new key&value
list1$birth <- '1999'  # simple as list$new_key <- new_value 
list1$birth; list1

# to add new value to existing key
list1$name <- c( list1$name , 'S')
list1  # returns $name [1] "Soomin"  "S"
list1$name <- c('SS')  # if don't include the original value inside the newly inserted value group
list1$name  # returns only the newly added value

# to delete data
list1$birth <- NULL # delete cirtain key&value by making them NULL 
rm(list = ls()) # simply removes entire list of objects created so far














