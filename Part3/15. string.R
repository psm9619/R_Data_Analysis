install.packages ("reshape2")
library("reshape2")

#옆으로 긴, wide 형식의 데이터 프레임을 세로로 길게 변형시켜 줌
fruits <- read.csv("fruits_10.csv")
fruits

melt (fruits, id='year')
melt (fruits, id = c ('year', 'name'))
melt (fruits, id = c('year', 'name'), variable.name = 'table',
      value.name ='변수값')
      
dcast (mtest, name~변수값, sum)
#dcast (mtest, name~var_name, sum) -> dcast(data, 기준칼럼, 함수)

install.packages("stringr")
library (stringr)
fruits <- c( "apple", "Apple", "banana", "pineapple")
str_detect(fruits, "A")  # string 열에서 특정 문자를 포함한 것이 몇 번째, 어느 스트링데이터에 있는지 출력
str_detect(fruits, 'a')
str_detect(fruits, '^a') # ^X 단어의 맨 앞에 X 가 들어가는 경우 의미 / X$ 단어의 마지막
str_detect(fruits, 'e$')
str_detect (fruits, '^[aA]')  #[a A] -> a 또는 A -> or 의 의미
str_detect(fruits, '[aA]')
# regex(찾으려는 패턴, ignore_case =T) --> 대소문자 구별 없앰
str_detect(fruits, regex('a', ignore_case=T))

fruits
str_count(fruits, 'a') #주어진 스트링 열안에 지정된 알파벳이 몇 번이나 들어있는지 카운트를 출력

str_c ("apple", "banana") #string 단어 두개를 더하는 것(중간에 space 없음)

str_c (fruits, " name is ") #string 열이 주어지면 반복적으로 하나씩 붙여준다다 
str_c (fruits, collapse=", ") #주어진 string 열의 모든 데이터를, 주어진 (", " 등) 것을 사이에 두고 붙임
#맨 마지막 단어 뒤에는 추가 스트링을 붙이지 않음 (A", "B", "C", "D)

str_dup (fruits, 3) #duplicate -> 스트링 열의 각각 데이터를 주어진 개수만큼 반복

str_length ('apple')
str_length(fruits)
str_length('과일') # UTF 로 저장된다면 6byte (한 글자가 3byte)

str_locate(fruits, 'a')  #인덱스 넘버를 주는데, 이 때 start-end 는 내가 주어준 'a'가 시작하고 끝나는 위치를 말함
#banana 같은 경우는 원래 2,4,6 번에서 나오나 맨 첫번째 발견된 넘  버만 리턴함

str_replace('apple', 'p', 'a') #str_replace(원래 스트링 데이터, 바꿀 스트링, 새 스트링)
str_replace('apple', 'p', '+++')
str_replace_all('apple', 'p','a') #str_replace_all -> 반복되는 모든 특정 스트링을 새로운 것으로 바꿈

fruits <- str_c('apple','/','orange','/','banana')
fruits
str_split(fruits, '/') #str_split(스트링 데이터, 'X') 스트링데이터를 주어진 표식 'X'에서 split 함

str_sub(fruits, start=1, end=3) #return sub-string 
str_sub(fruits, start=6) #end 를 주지 않으면 start 포지션부터 끝까지 간다.

#str_trim(스트링 데이터) -> space, tab 등 화이트 스페이스는 알아서 없애줌
str_trim ("  apple banana berry  ")
str_trim ('\t  apple banana')
str_trim ('( )apple banana \n')


























