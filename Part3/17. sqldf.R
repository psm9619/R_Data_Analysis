#MySQL 을 사용하기 위해 sqldf 패키지 다운, library
install.packages("sqldf")
library(sqldf)
library(googleVis)
Fruits

#sqldf ('sql 함수')
sqldf('select*from Fruits')

sqldf(#""큰따옴표로 로 함수를 감싼 후에 속 내용에 string 이 있을 경우 그냥 ''
  "select * from Fruits 
    where fruit like 'Apples'")
sqldf(#''작은따옴표로 함수를 감싼 경우에 속에 string 이 있으면 스트링을 \'AAA\' 로 표시
  'select * from Fruits 
    where fruit like \'Apples\'')
sqldf("select * from Fruits 
      limit 3") # limit 3 == limit 0, 3
sqldf("select * from Fruits 
      limit 3, 5") # 3rd data 부터 총 5개씩 보여라
sqldf("select * from Fruits
      order by year")a
sqldf("select * from Fruits order by year desc")

#과일별로 판매 합계
sqldf ("select Fruit, sum(sales) from Fruits
       group by Fruit")
#과일별 판매합계 & expense, profit 합계
sqldf ("select Fruit, sum(sales), sum(expenses), sum (profit) from Fruits
       group by Fruit")
#연도별 평균 매출, 평균이익
sqldf ("select year, avg(sales), avg(expenses), avg (profit) from Fruits
          group by year
          order by avg(profit) desc")
#sales 최대, 최소
sqldf ("select fruit, max(Sales), min(sales) from Fruits
       group by fruit")
# 위 데이터 분석에서 나온 일부 값으로 그것에 해당하는 나머지를 출력할 때 임시 방법
sqldf ('select * from Fruits where Sales = 81')
# 실제 sub query
sqldf ("select * from Fruits 
       where Sales = (select min (Sales) from Fruits)")
sqldf ("select * from Fruits
       where expenses = (select max (expenses) from Fruits)")

song <- read.csv("song.csv", header=F, fileEncoding = 'utf-8') 
#csv 파일을 읽을 때 header 가 포함되지 않았다면 header=F 조건 넣고
#한글 utf-8로 쓰여있을 때는 fileEncoding = 'utf-8'로 조건 넣음 (R 의 default 를 utf-8로 했어도 읽는 디폴트는 여전히 euc-kr 이기 때문)
names(song) <- c('_id', 'title', 'lyrics', 'gg_id')  # names(데이터프레임) <- 새로운 헤더 이름들
song

girl_group <- read.csv("girl_group.csv", header=F, fileEncoding = 'utf-8') 
names(girl_group) <- c('gg_id', 'name', 'debut')
girl_group

sqldf("select gg.gg_id, gg.name , gg.debut , s.title 
      from girl_group as gg          #from girl_grou gg -> R에서는 from A B 도 가능하다 (as 생략)
      inner join song as s
      on gg.gg_id = s.gg_id
      ")
## R의 sqldf package 는 outer join 은 불가능. only inner join 만 사용가능하다 












                    






