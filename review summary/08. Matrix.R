# Matrix : matrix (list of data, nrow = X, byrow = T/F) 
# a matrix with X number of rows & byrow True or False

# IMPORTANT: Matrix is only for a same type of data
# if a set of data in different types is given, either an error or automatical conversion
mat <- matrix(c(1,2,3,4, "a","b"))
mat  # automatically converts 1,2,3,4 to "1","2","3","4"

mat1 <- matrix(c(1,2,3,4)) ; mat1
mat2 <- matrix(c(1,2,3,4), nrow=2) ; mat2
mat3 <- matrix(c(1,2,3,4), nrow=2, byrow=T) ; mat3
mat3[1,] 
mat3[,1]

mat4 <- matrix(seq(1,10), nrow=2, byrow=T) ; mat4
# mat5 <- matrix(seq(1,10), nrow=3) : not possible since data length is not a multiple of numRow

# to extend the matrix by adding extra
mat5 <- rbind(mat4, c(11,12,13,14,15))  # bind data via row (num data should be a multiple of num data in row)
mat5
mat6 <- cbind(mat4, c(1,2)) # bind extra data via column (num data should be a multiple of num data in col)
mat6

# to give names to the column of matrix
colnames(mat4) <- c("a","b","c","d","e") ; mat4
mat4[2,] ; mat4[2,2] 












