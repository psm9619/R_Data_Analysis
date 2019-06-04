# rename table address_book TO addr_book;  rename table A to B
show tables;

# alter table addr_book add gender char(2) not null;  테이블에 새로운 데이터를 더하는 것 -> alter table A add B 데이터타입 not null;
desc addr_book;
#alter table addr_book add email varchar(20) not null after tel;  # alter...B 데이터타입 not null after C -> C 다음에 B를 넣어라
desc addr_book;

#alter table addr_book drop nickname ;  # alter... drop B -> B 데이터를 없애라
desc addr_book;

#alter table addr_book change no adID int(8) ; #alter ... change A B 데이터타입 -> A 를 특정 데이터타입의 B 로 바꿔치기해라
desc addr_book;
#alter table addr_book change adID adID int unsigned not null auto_increment; -> 새로운 데이터의 타입 에 int unsigned, not null, auto_increment 추가
desc addr_book;


#alter table addr_book modify gender char(2) after name; #alter ... modify A 데이터타입 after B -> 특정타입의 데이터 A 를 B 다음으로 옮겨라
desc addr_book;












