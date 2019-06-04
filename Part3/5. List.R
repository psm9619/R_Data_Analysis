# LIST : list(A= a,B= b,C= c ..) --> A,B,C: key  & a,b,c : value
# Any data type is available
# key & value

list1 <- list(name= "Soomin", address= "Daejeon", phone = "010", age = "24")
list1
list1$name  # list 에서 특정 key 값을 빼내려할때 --> 리스트네임$키네임

list1[1:3]  # list 에서 특정 key 값들만 (항목의 순서에 따라서) 빼낼 때
list1[1]    # 벡터나 등등 처럼 index number 로도 가능

list1$birth <- '1777-02-31' ; list1$birth   #하나의 키에 대한 value로는 벡터 및 여러 값이 올 수 있다
list1$name <- c ('soomin', 'SSomin')
list1

list1$birth <- NULL ; list1$birth #key는 놔두고 value 만 삭제하기 위해 <- NULL

rm(list=ls())












