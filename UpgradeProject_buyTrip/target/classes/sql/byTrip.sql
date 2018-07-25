alter session set nls_date_format='rrrr/mm/dd hh24:mi:ss';
alter session set nls_date_format='rrrr-mm-dd';

select table_name from user_tables;

select * from member;
desc member;
show user;
select * from V$NLS_PARAMETERS;

select * from travel;

select * from product where arrival_nation='미국'

select * from product;
select * from offer;
drop
DROP TABLE AUTHORITIES;

select product_code, proposer_id, product_name, product_img, product_url, product_qty, product_price, product_desc, requirement, requested_date, deadline_date, depart_nation, arrival_nation, trade_state, exchange_rate ,
ceil(decode(nation_currency, 'IDR(100)', product_qty*product_price/to_number(exchange_rate)*10, 'JPY(100)', product_qty*product_price/to_number(exchange_rate)*10, product_qty*product_price/to_number(exchange_rate)))||' '||nation_currency "calc"
from v123, product
where v123.nation_name = product.arrival_nation;


select * from currency;

select nation_currency from currency;
select exchange_rate from currency where nation_name like '미국%'

select * from product;

select * from AUTHORITIES;
CREATE TABLE AUTHORITIES(
	USERNAME VARCHAR2(100) NOT NULL, /* ID*/
	ROLE VARCHAR(30) NOT NULL,    /**/
	CONSTRAINT MEMBER_AUTHORITIES_FK FOREIGN KEY(USERNAME) REFERENCES MEMBER(member_id),
	CONSTRAINT AUTHORITIES_PK PRIMARY KEY(USERNAME,ROLE)
);

insert into authorities values('admin@buytrip.com', 'ROLE_ADMIN');
insert into authorities values('nini@buytrip.com', 'ROLE_MEMBER');

commit


select * from travel;
delete travel where travel_no='t0048'

select * from offer;

select * from nation;
drop table travel;
drop table message;
drop table chat;
drop table offer;
drop table travel;
drop table product cascade constraint;
drop table member cascade constraint;
drop table nation;

select * from nation;
create table member(
member_id varchar2(100) primary key,
member_name varchar2(50) not null,
member_password varchar2(100),
member_img varchar2(2000),
mobile varchar2(13) not null
);
 O6825687510 NULL               test@naver.com     p0000000002  2018-06-26 02:43:48.0 yet

update offer set offer_state='accepted' where offer_code='O8454274262';
create table currency(

insert into member values('yd@yd', '조용덕', 'yd', 'http://cfs2.tistory.com/upload_control/download.blog?fhandle=YmxvZzIwNzUxQGZzMi50aXN0b3J5LmNvbTovYXR0YWNoLzEvMTcxLmpwZw==','01087058999');
insert into member values('dy@gmail.com', '임다영', 'ldy', 'http://cfs2.tistory.com','01011112222');
.
select * from member;

select * from offer;
select * from travel;
select * from product;
commit;
 p0000000091  leeha456@naver.com 설리                                                                                                                             NULL                                                                                                                   kkk                                                                                                                                                                                       1       1111111 11                         11          2018-06-26 03:57:36.0 2018-06-28 00:00:00.0 한국            미국             no offer

 p0000000091  leeha456@naver.com 설리      
 
  O8454274262 test@naver.com     test@naver.com     p0000000090  2018-06-26 04:11:04.0 yet

 
 NULL                                                                                                                   kkk               
 1       1111111 11                         11          2018-06-26 03:57:36.0 2018-06-28 00:00:00.0 한국            미국             no offer

 select * from product
 
 update product set trade_state='complete' where product_code=(select product_code from offer 
 where offer_code='O8454274262')

 commit
 
 
 update (select p.product_code from product p,(select product_code from offer where offer_code='O6825687510')o where p.product_code=o.product_code) set p.trade_state='complete'
create table nation(
nation_code char(4) primary key,
nation_name varchar2(50) unique not null,
nation_pcode char(4) references nation(nation_code) on delete cascade,
nation_img varchar2(1000)
);

drop table nation;
drop sequence nation_seq;

create sequence nation_seq
increment by 1
start with 1;

select * from nation;

select * from currency

insert into nation values('n'||lpad(nation_seq.nextval,3,'0'), '한국', null, null);
insert into nation values('n'||lpad(nation_seq.nextval,3,'0'), '일본', null, null);
insert into nation values('n'||lpad(nation_seq.nextval,3,'0'), '중국', null, null);
insert into nation values('n'||lpad(nation_seq.nextval,3,'0'), '미국', null, null);
insert into nation values('n'||lpad(nation_seq.nextval,3,'0'), '이탈리아', null, null);
insert into nation values('n'||lpad(nation_seq.nextval,3,'0'), '스페인', null, null);
insert into nation values('n'||lpad(nation_seq.nextval,3,'0'), '티베트', null, null);
insert into nation values('n'||lpad(nation_seq.nextval,3,'0'), '브라질', null, null);
insert into nation values('n'||lpad(nation_seq.nextval,3,'0'), '영국', null, null);
insert into nation values('n'||lpad(nation_seq.nextval,3,'0'), '모로코', null, null);
insert into nation values('n'||lpad(nation_seq.nextval,3,'0'), '요르단', null, null);
insert into nation values('n'||lpad(nation_seq.nextval,3,'0'), '인도', null, null);
insert into nation values('n'||lpad(nation_seq.nextval,3,'0'), '쿠바', null, null);
insert into nation values('n'||lpad(nation_seq.nextval,3,'0'), '이스라엘', null, null);
insert into nation values('n'||lpad(nation_seq.nextval,3,'0'), '프랑스', null, null);
insert into nation values('n'||lpad(nation_seq.nextval,3,'0'), '에티오피아', null, null);
insert into nation values('n'||lpad(nation_seq.nextval,3,'0'), '이집트', null, null);
insert into nation values('n'||lpad(nation_seq.nextval,3,'0'), '그리스', null, null);
insert into nation values('n'||lpad(nation_seq.nextval,3,'0'), '미얀마', null, null);
insert into nation values('n'||lpad(nation_seq.nextval,3,'0'), '네팔', null, null);
insert into nation values('n'||lpad(nation_seq.nextval,3,'0'), '태국', null, null);
insert into nation values('n'||lpad(nation_seq.nextval,3,'0'), '필리핀', null, null);
insert into nation values('n'||lpad(nation_seq.nextval,3,'0'), '베트남', null, null);
insert into nation values('n'||lpad(nation_seq.nextval,3,'0'), '포르투갈', null, null);
insert into nation values('n'||lpad(nation_seq.nextval,3,'0'), '터키', null, null);
insert into nation values('n'||lpad(nation_seq.nextval,3,'0'), '네덜란드', null, null);
insert into nation values('n'||lpad(nation_seq.nextval,3,'0'), '독일', null, null);
insert into nation values('n'||lpad(nation_seq.nextval,3,'0'), '캄보디아', null, null);
insert into nation values('n'||lpad(nation_seq.nextval,3,'0'), '오스트리아', null, null);
insert into nation values('n'||lpad(nation_seq.nextval,3,'0'), '호주', null, null);
insert into nation values('n'||lpad(nation_seq.nextval,3,'0'), '캐나다', null, null);
insert into nation values('n'||lpad(nation_seq.nextval,3,'0'), '콜롬비아', null, null);
insert into nation values('n'||lpad(nation_seq.nextval,3,'0'), '페루', null, null);
insert into nation values('n'||lpad(nation_seq.nextval,3,'0'), '탄자니아', null, null);
insert into nation values('n'||lpad(nation_seq.nextval,3,'0'), '멕시코', null, null);
insert into nation values('n'||lpad(nation_seq.nextval,3,'0'), '싱가폴', null, null);
insert into nation values('n'||lpad(nation_seq.nextval,3,'0'), '우주베키스탄', null, null);
insert into nation values('n'||lpad(nation_seq.nextval,3,'0'), '러시아', null, null);
insert into nation values('n'||lpad(nation_seq.nextval,3,'0'), '크로아티아', null, null);
insert into nation values('n'||lpad(nation_seq.nextval,3,'0'), '아르헨티나', null, null);
insert into nation values('n'||lpad(nation_seq.nextval,3,'0'), '과테말라', null, null);
insert into nation values('n'||lpad(nation_seq.nextval,3,'0'), '체코', null, null);
insert into nation values('n'||lpad(nation_seq.nextval,3,'0'), '헝가리', null, null);
insert into nation values('n'||lpad(nation_seq.nextval,3,'0'), '말레이시아', null, null);
insert into nation values('n'||lpad(nation_seq.nextval,3,'0'), '콩고', null, null);
insert into nation values('n'||lpad(nation_seq.nextval,3,'0'), '모르코', null, null);
insert into nation values('n'||lpad(nation_seq.nextval,3,'0'), '파프하뉴기니', null, null);
insert into nation values('n'||lpad(nation_seq.nextval,3,'0'), '홍콩', null, null);
insert into nation values('n'||lpad(nation_seq.nextval,3,'0'), '아일랜드', null, null);
insert into nation values('n'||lpad(nation_seq.nextval,3,'0'), '라오스', null, null);
insert into nation values('n'||lpad(nation_seq.nextval,3,'0'), '대만', null, null);
insert into nation values('n'||lpad(nation_seq.nextval,3,'0'), '우간다', null, null);
insert into nation values('n'||lpad(nation_seq.nextval,3,'0'), '에콰도르', null, null);
insert into nation values('n'||lpad(nation_seq.nextval,3,'0'), '북한', null, null);
insert into nation values('n'||lpad(nation_seq.nextval,3,'0'), '이란', null, null);
insert into nation values('n'||lpad(nation_seq.nextval,3,'0'), '스위스', null, null);
insert into nation values('n'||lpad(nation_seq.nextval,3,'0'), '노르웨이', null, null);
insert into nation values('n'||lpad(nation_seq.nextval,3,'0'), '덴마크', null, null);
insert into nation values('n'||lpad(nation_seq.nextval,3,'0'), '뉴질랜드', null, null);
insert into nation values('n'||lpad(nation_seq.nextval,3,'0'), '파라과이', null, null);
insert into nation values('n'||lpad(nation_seq.nextval,3,'0'), '우루과이', null, null);
insert into nation values('n'||lpad(nation_seq.nextval,3,'0'), '칠레', null, null);
insert into nation values('n'||lpad(nation_seq.nextval,3,'0'), '알제리', null, null);

commit;
drop table product cascade constraint;

create table product(
product_code char(11) primary key,
proposer_id varchar2(100) references member(member_id) on delete cascade,
product_name varchar2(200) not null,
product_img varchar2(1000),
product_url varchar2(1000),
product_qty number default 1 check(product_qty>0) not null,
product_price number check(product_price>0) not null,
product_desc varchar2(2000),
requirement varchar2(2000),
requested_date date default sysdate,
deadline_date date not null,
depart_nation varchar2(50) references nation(nation_name) on delete cascade,
arrival_nation varchar2(50) references nation(nation_name) on delete cascade,
trade_state varchar2(8) default 'no offer' check(trade_state in('no offer', 'in deal', 'complete'))
);

drop sequence product_seq;

create sequence product_seq
increment by 1
start with 1;

select * from product;
insert into product values('p'||lpad(product_seq.nextval,10,'0'), 'yd@yd', '헤르메스', 'http://cfile202.uf.daum.net/image/1367D9474EFC9B11336946','http://blog.daum.net/znzngld/20', 
1, 2000000, '에르메스 가방 주황색', '상처없이 가져다주세요', sysdate, '2018/07/01', '한국', '미국', 'complete');

insert into product values('p'||lpad(product_seq.nextval,10,'0'), 'yd@yd', '구찌 벨트', null,null, 
1, 300000, '구찌 로고 벨트', 'tag이랑 정품보증서 있어야 합니다.', '2018/04/19', '2018/05/27', '한국', '이탈리아', 'complete');

insert into product values('p'||lpad(product_seq.nextval,10,'0'), 'yd@yd', 'paw paw 연고', null,null, 
5, 20000, '호주산 자외선 차단제 pawpaw', '감사합니다~', '2018/05/10', '2018/06/20', '한국', '호주', 'complete');

commit;


create table offer(
offer_code char(11) primary key,
proposer_id varchar2(100) references member(member_id) on delete cascade,
offer_id varchar2(100) references member(member_id) on delete cascade,
product_code char(11) references product(product_code) on delete cascade,
offer_date date default sysdate
);

select * from offer;

create table chat(
chat_id char(11) primary key,
proposer_id varchar2(100) references member(member_id) on delete cascade,
offer_id varchar2(100) references member(member_id) on delete cascade,
product_code char(11) references product(product_code) on delete cascade
);

create table message(
message_id char(15) primary key,
chat_id char(11) references chat(chat_id) on delete cascade,
sender_id varchar2(100) references member(member_id) on delete cascade,
receiver_id varchar2(100) references member(member_id) on delete cascade,
message_content varchar2(2000) not null,
send_time date default sysdate,
read_time date
);

drop table travel;

create table travel(
travel_no char(5) primary key,
member_id varchar2(100) references member(member_id) on delete cascade,
depart_nation varchar2(50) references nation(nation_name) on delete cascade,
arrival_nation varchar2(50) references nation(nation_name) on delete cascade,
arrival_date date not null,
input_date date default sysdate,
notification varchar2(10) default 'yes' check(notification in('yes','no'))
);

create sequence travel_seq
increment by 1
start with 1;

drop sequence travel_seq;

select sysdate from dual;
select * from travel;

insert into travel values('t'||lpad(travel_seq.nextval,4,'0'),'yd@yd', '한국', '일본', '2018/06/16',sysdate, 'yes');
insert into travel values('t'||lpad(travel_seq.nextval,4,'0'),'yd@yd', '한국', '일본', '2018/06/06',sysdate, 'no');
insert into travel values('t'||lpad(travel_seq.nextval,4,'0'),'yd@yd', '한국', '중국', '2018/06/09',sysdate, 'yes');
insert into travel values('t'||lpad(travel_seq.nextval,4,'0'),'yd@yd', '한국', '미국', '2018/06/20',sysdate, 'yes');
insert into travel values('t'||lpad(travel_seq.nextval,4,'0'),'yd@yd', '한국', '미국', '2018/06/21',sysdate, 'yes');

delete from travel
where notification=0;
commit;

select * from travel;
order by input_date desc;


select member_id, depart_nation_code, arrival_nation_code, arrival_date, notification
		from travel
		where arrival_date < sysdate
		order by arrival_date desc;
        
select * from nation;

select * from travel;

delete from travel where travel_no = 't0006';

commit;

select * from product;
select * from nation;
select * from travel;



select member_id, depart_nation, arrival_nation, arrival_date, notification
		from travel
		order by input_date desc;
        
        select member_id, depart_nation, arrival_nation, arrival_date, notification
		from travel
		where arrival_date < sysdate
		order by arrival_date desc;


select travel_no, member_id, depart_nation, arrival_nation, arrival_date, notification
		from travel
		where arrival_date > sysdate
		order by input_date desc;
        
        
select table_name from user_tables;

select *
from member, travel
where member.member_id = travel.member_id;

select * from member_travel;
select * from travel;
select * from product;
commit;

select distinct *
from product, travel
where product.arrival_nation = travel.arrival_nation;

select count(*)
from product, travel
where product.arrival_nation = travel.arrival_nation;

select * from product;

create view product_travel
as
select distinct *
from product, travel
where product.arrival_nation = travel.arrival_nation;

select * from product;




select * from currency


select product_code, proposer_id, product_name, product_img, product_url, product_qty, product_price, product_desc, requirement, requested_date, deadline_date, depart_nation, arrival_nation, trade_state, nation_currency,
ceil(decode(nation_currency, 'IDR(100)', product_qty*product_price/to_number(exchange_rate)*10, 'JPY(100)', product_qty*product_price/to_number(exchange_rate)*10, product_qty*product_price/to_number(exchange_rate)))||' '||nation_currency "calc"
from v123, product
where v123.nation_name = product.arrival_nation 


update currency set exchange_rate=replace(304.91,',','') where nation_currency='AED';
update currency set exchange_rate=replace(833.21,',','') where nation_currency='AUD';
update currency set exchange_rate=replace(2970.39,',','') where nation_currency='BHD';
update currency set exchange_rate=replace(843.9,',','') where nation_currency='CAD';
update currency set exchange_rate=replace(1133.93,',','') where nation_currency='CHF';
update currency set exchange_rate=replace(172.13,',','') where nation_currency='CNH';

update currency set exchange_rate=replace(175.33,',','') where nation_currency='DKK';
update currency set exchange_rate=replace(1306.91,',','') where nation_currency='EUR';
update currency set exchange_rate=replace(1486.16,',','') where nation_currency='GBP';
update currency set exchange_rate=replace(142.72,',','') where nation_currency='HKD';
update currency set exchange_rate=replace(7.95,',','') where nation_currency='IDR(100)';
update currency set exchange_rate=replace(1019.33,',','') where nation_currency='JPY(100)';

update currency set exchange_rate=replace(3702.69,',','') where nation_currency='KWD';

update currency set exchange_rate=replace(279.82,',','') where nation_currency='MYR';
update currency set exchange_rate=replace(138.43,',','') where nation_currency='NOK';
update currency set exchange_rate=replace(775.14,',','') where nation_currency='NZD';
update currency set exchange_rate=replace(298.63,',','') where nation_currency='SAR';
update currency set exchange_rate=replace(126.47,',','') where nation_currency='SEK';
update currency set exchange_rate=replace(824.67,',','') where nation_currency='SGD';
update currency set exchange_rate=replace(34.04,',','') where nation_currency='THB';
update currency set exchange_rate=replace(1119.98,',','') where nation_currency='USD';


commit