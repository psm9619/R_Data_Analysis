# Array : multidimensional set of data
# array (data, dim = c(R, C, D)) 
# -> R= num row for each dimension, C=num col for each dimension, D=num dimension

arr1 <- array(c(1:12), dim=c(4,3))
arr1 # 1 dimension, 4 rows, 3 cols
arr2 <- array(c(1:12), dim=c(2,2,3))
arr2 # 3 dimension, 2 rows, 2 cols
arr3 <- array(c(1:12), dim=c(1,1,1)) 
arr3 # if size of array is not enough for the given dataset, dataset is cropped. No automatic extension, etc.

arr2[1,1,2]
arr2[1,1,]
arr2[1,,]
arr2[,,2]













