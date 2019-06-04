USE World;
select*from city where countrycode like 'KOR'; #select*from 데이터테이블 where 어떤 코드 = (=대신 스트링의 경우 like) '내가 원하는 조건; -> 특정 조건을 갖춘 데이터만 뽑아냄

select*from city where district like 'kyonggi' and population > 500000; #where 조건 1 이후에 'AND' 조건 2 -> MySQL 은 그냥 단어 그대로 and / or

select distinct district from city where countrycode like 'kor'; #select distinct A from 테이블 where 조건 1 -> 조건 1 을 충족하고 중복되지 않는 A 를 테이블에서 반환하라
 










