select min(population), max(population), avg(population), sum(population) 
	from city where countrycode like 'kor';  # 한 번에 표로 정리
	
#select group_concat (distinct district) from city where countrycode like 'kor'; 
select district, count(*) from city where countrycode = 'kor'; #통째로 모든 데이터를 합쳐서 센 것을 리턴

select district, count(*) from city where countrycode = 'kor' group by district; #각 디스트릭트별로 묶어서 개별적 데이터 리턴
select district, count(*) from city where countrycode = 'kor'
	 group by district having count(*)>=6 # 6 이상을 가진 디스트릭트들만 한정해서 각각 세어 리턴 (조건을 추가하는 것)
	 order by count(*) desc;
	 
select countrycode, count(*) from city
	group by countrycode having count(*) >=50 
	order by count(*) desc;	

select city.Name, city.Population, country.Name from city
	inner join country on city.CountryCode = country.Code;  
#select .... inner join C on A.X = B.Y -> 데이터테이블 A의 X 와 B 의 Y가 같을 떄 (이런 조건을 충족할때) C 를 앞에서 나온 ...과 join 하라

select city.Name, city.Population, country.Name from city
	inner join country on city.CountryCode = country.Code
	where city.Population > 7000000
	order by city.Population desc 
	limit 5; # R의 dplyr 에서 head(n) 과 같은 역할, 위에서부터 n개만 출력
	

	
	
	
	
	
	
	
	
	
	












