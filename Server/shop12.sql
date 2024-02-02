drop table shop1 CASCADE CONSTRAINTS;
drop table shop2 CASCADE CONSTRAINTS;

create table shop1(
sid int,
shop_name varchar2(30),
location varchar2(30)
);

insert into shop1(sid ,shop_name,location)values (1,'Mobile Point','Dhaka');
insert into shop1(sid ,shop_name,location)values (2,'Gadget Park','Dhaka');
insert into shop1(sid ,shop_name,location)values (3,'KMS mobile shop','Dhaka');


create table shop2(
sid int,
shop_name varchar2(30),
location varchar2(30)
);

insert into shop2(sid ,shop_name,location)values (6,'Mobile factory','Sylhet');
insert into shop2(sid ,shop_name,location)values (7,'Like telecom','Sylhet');

