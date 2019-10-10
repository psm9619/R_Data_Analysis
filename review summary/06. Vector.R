# Vector

# 1D: vector, 2D: Matrix, 3D Array
# CRUD (Create Retrieve Update Delete)

vec1 <- c(1:5) ; vec1
vec1[3] # index number counts from 1 (JAVA & C counts from 0)

# a sequence can be used for a list of index numbers 
vec1[1:3] ; vec1[seq(1,5,2)] 

length (vec1) # return the length of vector

# to substitute a data in vector (much easier than JAVA or C)
vec1[3] <- 6 ; vec1 

# to add extra data (expanding memory)
vec1 <- c(vec1, 7, 8) ; vec1   # simplest, just c(original vector, added ...)

vec1 [9] <- 9 ; vec1   # vector[expanded index number] <- data
append(vec1, 10 , after=3)   # append(vector, data, after= certain location)
vec1  # important note about append() is that you need to reassign the vector like below. If not, the append is temporary and not saved
vec1 <- append(vec1, c(-1,-2), after = 7)
vec1 <- append(vec1, 100, after =0) ; vec1

# calculation in vectors
c(1,2,3) + c(4,5,6)  # add an element to element, only for same length vectors
c(1,2,3) + 1  # vector + scalar
# for vectors of different lengths 
c(1,1,1,1) + c(2,2)  # returns c(3,3,3,3) -> if the longer length is a multiple of the shorter, repeatedly apply the shorter vector
c(1,1,1) + c(2,2)  # also works and returns (3,3,3) but gives a warning message for not being a multiple

# Other 
var1 <- c(1,2)  ;  var2 <- c('a', 'b')
# var1 + var2  not possible due to non-numeric data

# Sets (집합)
union (c(1,2), c("a"))  # union(A, B): a union (합집합) that may include any data type
union (c("a","b", 3,4), c("a","b",1,2))  # NO duplicated data (removes a duplicated intersection)

setdiff(c("a", 3,4), c("a","b",1))  # returns("3","4")-> setdiff(A,B) 차집합 :difference of sets A-B
setdiff(c("a","b",1), c("a", 3,4))  # returns("b","1")

intersect(c("a", 3,4), c("a","b",1)) # returns "a" -> intersect(A,B) 교집합



fruits <- c(10,20,30) ; fruits
names(fruits) <- c('apple', 'banana', 'grape')
fruits

















