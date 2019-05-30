# ARRAY : array(값의 그룹, dim=c(r:c)) --> dim=c(행:열) --> 몇 차원인지, 각 차원의 개수 (행과 열)은 얼마인지 지정
array1 <- array(c(1:12), dim=c(4,3)) ; array1   #matrix 와 동일형태인 2차원 array
array2 <- array(c(1:12), dim=c(2,2,3)) ; array2  #3차원

array2[1,1,2]
array2[1,,]

















