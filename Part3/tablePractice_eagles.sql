USE EZEN;

/* create view pitcher as select * from eagles #create view A as select * from B -> B 에서 A 만 뽑아낸 데어터
	where position like '투수';	*/
#select * from infielder; 

# alter table eagles add birthday date after name; #alter 테이블 이름 add 새로운 팩터 
desc eagles;

update eagles set birthday= '1989-05-18' where backNo = 2;
select * from eagles;

update eagles set birthday= '1989-05-18' where backNo = 4 or backNo = 5;

update eagles set birthday= '1949-07-18' where backNo = 4 or backNo = 5;
update eagles set birthday= '1969-07-18' where backNo = 6;
update eagles set birthday= '1979-07-18' where backNo = 7;
update eagles set birthday= '1989-07-18' where backNo = 8;
update eagles set birthday= '1999-07-18' where backNo = 9 or backno = 36;
desc eagles;

select now(), curdate(), curtime(); #date 을 출력하는 함수
select * from eagles order by birthday;
select name, date_format (birthday, "%y%m%d") from eagles ; #date_format (날짜데이터, "%y%m%d") -> 날짜를 960619 식으로 쓴 것








