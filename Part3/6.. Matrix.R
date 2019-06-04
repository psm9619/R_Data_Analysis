# MATRIX :  matrix(값의 그룹, nrow =  ,byrow =  )
mat1 <- matrix(c(1,2,3,4))  
mat1   #4:1 (4 rows , 1 column)
mat2 <- matrix(c(1,2,3,4), nrow=2) ; mat2  # nrow = X --> row 의 개수를 X 개로 지정 (이 때 값들은 세로방향, row 먼저 채우는 방식)
mat3 <- matrix(c(1,2,3,4), nrow=2, byrow=T) ; mat3  # byrow=T --> 값을 1열부터  1->n의 행을 먼저 채운다 (가로방향으로)
mat3[1,1]
mat3[1,]
mat3[,1]
mat4 <- matrix (seq(1,9), nrow=3, byrow=T) ; mat4
mat4 <- rbind(mat4, c(10,11,12)) ; mat4  #새로운 row, 행을 더할 때 --> rbind(기존 매트릭스, 새로운 값)
mat4 <- cbind(mat4, seq(1:4)) ; mat4   #새로운 column, 열을 더할 때 --> cbind
mat4 <- rbind(mat4, seq(13,16)) ; mat4

#매트릭스에 column 들의 이름을 정해주는 것
colnames(mat4) <- c("first", "second", "third", "fourth")
mat4


#연습문제
mat1 <-matrix(c("봄", "여름", "가을", "겨울"), nrow=2) ; mat1
mat1 <-matrix(c("봄", "여름", "가을", "겨울"), nrow=2, byrow=T) ; mat1

mat1[,2]
mat1 <- rbind(mat1, c("초봄", "초가을")) ; mat1

mat1 <- cbind(mat1, c("초여름", "초겨울", "한겨울"))  ; mat1








