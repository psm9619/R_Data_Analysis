use ezen;
select * from girl_group where debut between '2009-01-01' and '2009-12-31';
select  gg._id, ss.title, gg.name, gg.debut
	from girl_group as gg
	inner join song as ss
	on ss._id = gg.hit_song_id where debut between '2009-01-01' and '2009-12-31';
	
use world;
select * from country;
select * from city order by population desc;
select * from countrylanguage;
select count(*), sum(gnp), avg(gnp)
	from country group by continent;
	
/* 아시아 대륙에서 인구가 가장 많은 도시 10개를 내림차순으로 보여줄 것	(대륙명, 국가명, 도시명, 인구수)
Country -> Continent Asia, 'country code'
City -> City name, population in city, 'country code'
*/
select ctry.Continent, ctry.Name, cty.name, cty.population
	from country as ctry
	inner join city as cty
	on cty.CountryCode = ctry.Code where ctry.continent like 'Asia'
	order by cty.population desc
	limit 10;

/*전 세계에서 인구가 가장 많은 10개 도시에서 사용하는 공식언어는?	(도시명, 인구수, 언어명)
city -> population 10, city name, 'countrycode'
countrylanguague->language, 'countrycode' */
select cty.population, cty. name, clang.language, clang.IsOfficial
	from city as cty
	inner join countrylanguage as clang
	on cty.CountryCode = clang.CountryCode
	where clang.IsOfficial like 'T'
	group by cty.Name
	order by cty.population desc
	limit 10;
	








