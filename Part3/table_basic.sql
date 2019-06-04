USE ezen;
#Table 을 만드는 것으 DDL, Table 내에서 무언가를 하는 것은 DML
#CreateReadUpdateDelete

#기본 데이터 타입
#캐릭터 -> varchar 이 맥스도 크고, 작은 데이터는 그 나름대로 작은 메모리를 할당 하기 때문에 많이 씀
#숫자 -> int 그냥 가장 흔하게 쓰임
#날짜 -> DATETIME 날짜 시간 형태의 기간 표현 데이터 타입


create table if not exists address_book ( #if not exist 이미 만들어져있지 않다면 create table 해라 
no int unsigned not null auto_increment, # int unsigned: 양수만   #auto_increment: 자동적으로 순서대로 하나씩 증가 -> 덮어쓰기 및 중복 방지
name varchar(10) not null, #not null -> null data 는 허용안함 
tel varchar(14),
nickname varchar(20) default '별명', #뭐가 들어와도 default 로 이름을 붙임  #Oracle/MySQL 등에서 스트링은 only '' 작은따옴표처리
primary key(no) # 데이터에서 key -> unique
) auto_increment = 10001 default charset=utf8;  #숫자를 auto_increment 할 때 10001부터 해라  #캐릭터셋 charset 은 한글처리를 위한 utf8로 하라 (프로그램내에서 한글처리를 하려면 utf8을 사용해야한다 / 국제 표준은 EUC-KR)

show tables; #table 이름들 출력
# drop table (테이블 이름); -> 해당 테이블 없앰









