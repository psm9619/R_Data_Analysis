desc ezen.addr_book;

select * from city where district like 'Taejon' or 
	district like 'chungchongbuk' or
	district like 'chungchongnam'; 
select * from city where district like 'Taejon' or 
	district like 'chungchong%';	 # wild charcter -> 정확한 철자를 모를 때 또는 공통된 캐릭터를 포함하는 단어들을 골라낼 떄 % 사용 

select * from city where countrycode like 'kor' and population > 1000000 and ID%2 = 1;
#SQL 에서는 where 조건 잘 쓰는것이 중요
select * from city where countrycode like 'kor' 
	and population between 1000000 and 2000000 # A between x and y -> x < A <y
	and name like 'Tae%' ; 
	
select * from city where district like 'kyonggi' order by name;  #order by A -> 데이터 A 의 오름차순 (문자도 알아서 배열) 으로 배열

select * from city where district like 'kyonggi' order by population desc; #order by A desc -> 내림차순 배열

select * from city where countrycode = 'kor' order by district, population desc; #order by A, B -> A 로 먼저 배열, 각각의 A 안에서 다시 B 로 배열

select count(*) from city where countrycode like 'kor'; #select count(*) from 데이터 where 조건 -> 데이터중 조건에 맞는 것을 골라서 세어라
select min(population) from city where countrycode like 'kor';
select min(population), max(population), avg(population), sum(population) 
	from city where countrycode like 'kor';










