#DATA FRAME
no <- c(1:4)
name <- c("A", "B","C", "D")
price <- c(500:503)
qty <- c(4:1)
#각각 만들어진 벡터들을 칼럼화 -> data.frame(A=a, B=b...) : A,B=data frame의 칼럼네임, a,b=개별 벡터
sales <- data.frame(NO=no, NAME=name, PRICE=price,QTY=qty)
sales

  # Matrix --> Data Frame
sales2<- matrix(c(1,"A",500,4, 2,"B", 200,2), nrow=2, byrow=T)
sales2 #Matrix는 모양은 데이터프레임과 비슷하지만  모든 숫자까지 다 character로 변환됨 " "
sales2<- data.frame(sales2)
sales2 # data.frame() 함수가 자동으로 메트릭스 내용을 읽고 캐릭터화된 숫자도 다시 원상복귀시킴

df1 <-data.frame(sales2)
names(df1) <- c('NO', 'NAME', 'PRICE', 'QTY')  #dataframe 에게 name 을 주는 것
df1

#List 에서 Key 아래 Value 값들을 부르듯이 data frame 도 동일 방법 사용
#이 때 출력되는 값들은 더이상 "" 캐릭터가 아니라 factor 클래스에 속함
sales$NAME
class(df1$NAME)

sales[1,3]   # vector, matrix, array 와 모두 같은 방법 still available!
sales[,3]
sales[2,]
sales[c(1,2),]    #한 번에 mulitple rows/columns 를 표시하고 싶을 때는 해당 부분에 c(a,b,c..)
sales[,c(1,2),]

#조건식 --> subset(데이터프레임, 조건)
subset(sales, QTY<3)
subset(sales, QTY==3)  # == (이퀄이 두개) -> A 와 b 가 같다
subset(sales, QTY!=3)  # ! = --> != 표시로 자동바뀜
subset(sales, NAME=="B")

no <- c(1,2,3)
name <- c('a', 'b', 'c')
price <- c(100,200,300)
df1 <-data.frame(NO=no, NAME=name, PRICE=price)
df1
no <- c(3,5,6)
name <- c('c', 'e', 'f')
price <- c(300,500,600)
df2 <-data.frame(NO=no, NAME=name, PRICE=price)
df2 

#dataframe 을 rbind(), cbind(), merge() 를 사용하여 합쳐보자
df3 <-cbind(df1, df2) ; df3  #cbind() 사용 (칼럼끼리 합침) --> row 행의 개수는 유지하고 칼럼을 늘리는것 것
df3$NAME  #이 경우 같은 이름의 칼럼 중에 먼저 있는 걸 출력

df4 <-rbind(df1, df2) ; df4  #rbind() 사용 (행끼리 합침)--> 칼럼유지, 행을 늘림
df4$NAME

df1 <- data.frame(NAME=c('a','b','c'), PRICE=c(300,200,100))
df2 <- data.frame(NAME=c('a','d','c'), QTY = c(5,4,3))

## Merge data frame --> SQL 의 Inner / Outer Join 과 비슷. 
#동일 factor (여기선 NAME) 이 있을 때, 그리고 그 중에서 같은 데이터가 있을 때 
#그것들에 해당하는 데이터만 모아서 merge 하는것
df5 <-merge(df1, df2) ; df5  #InnerJoin: 교집합 격인 NAME='a', 'c' 관련 df1-PRICE 값과 df2-QTY 를 합침
df6 <-merge(df1, df2, all =T) ; df6 #OuterJoin: 교집합 제외 나머지 자료까지 모두 추가 (빈 부분은 NA로 채움)

new <-data.frame(NAME= "mango", PRICE=400)
df5 <-rbind(df1,new) ; df5
df5 <-cbind(df1, data.frame(QTY=c(2,3,4))) ; df5

no <- c(1,2,3,4,5)
name <- c("a", "b","c","d","e")
address <- c("AB", "CD", "EF", "GH", "IJ")
tel <- c(1111,22222,3333,444,5555)
hobby <- c("f","g","h","i","j")
member <-data.frame (NO=no, NAME=name, ADDRESS = address, TEL=tel, HOBBY=hobby)
member
# subset(데이터프레임, select=XX): select=낱개의 factor or c(A, B)도 가능, 특정 항목을 선택하는 것 
subset(member, select=c(NAME, TEL))
subset(member, select=-TEL)

#colnames(데이터프레임) <- c(새로운 팩터이름들) : 칼럼의 팩터이름들을 수정 저장
colnames(member) <- c("번호","이름","주소","번호","취미") ;member 

ncol(member)  # ncol(데이터프레임) : 칼럼 개수
nrow(member)  # nrow(데이터프레임) : 행 개수
names(member) # names(데이터프레임) : 칼럼팩터 이름들

rownames(member) # 행들의 이름 --> 본래 1~n으로 그냥 몇 번째 행인지 표시 
rownames(member) <- c("one", "two", "three", "four", "five") #rownames()<-새로운 값그룹 으로 수정저장 가능
rownames(member) 
member  #한번 수정되면 그대로 저장됨









