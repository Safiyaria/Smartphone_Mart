drop table smartphone CASCADE CONSTRAINTS;

create table smartphone(
pid int,
brand varchar2(30),
model varchar2(30),
price number,
shop varchar2(30)
);	

insert into smartphone(pid, brand, model, price, shop) values (1,'ONE PLUS', 'Nord CE 2 5G', 30000, 'Mobile Point');
insert into smartphone(pid, brand, model, price, shop) values (2,'ONE PLUS', 'Nord CE 2 Lite 5G', 22000, 'Gadget Park');
insert into smartphone(pid, brand, model, price, shop) values (3,'ONE PLUS', 'Nord CE 2', 25000, 'KMS mobile shop');
insert into smartphone(pid, brand, model, price, shop) values (4,'ONE PLUS', 'Nord 2', 32000, 'Mobile factory');
insert into smartphone(pid, brand, model, price, shop) values (5,'ONE PLUS', '9R 5G', 40000, 'Mobile Point');
insert into smartphone(pid, brand, model, price, shop) values (6,'ONE PLUS', '9 Pro', 65000, 'Gadget Park');
insert into smartphone(pid, brand, model, price, shop) values (7,'OPPO', 'A 12', 18000, 'Like telecom');
insert into smartphone(pid, brand, model, price, shop) values (8,'OPPO', 'A 54', 16000, 'Gadget Park');
insert into smartphone(pid, brand, model, price, shop) values (9,'OPPO', 'A 32', 20000, 'Mobile Point');
insert into smartphone(pid, brand, model, price, shop) values (10,'VIVO', 'Y 21', 21000, 'Rio international');
insert into smartphone(pid, brand, model, price, shop) values (11,'VIVO', 'U 3X', 22000, 'Mobile factory');
insert into smartphone(pid, brand, model, price, shop) values (12,'VIVO', 'S1', 25000, 'Gadget Park');
insert into smartphone(pid, brand, model, price, shop) values (13,'SAMSUNG', 'A 52', 30000, 'Mobile Point');
insert into smartphone(pid, brand, model, price, shop) values (14,'XIAOMI', 'K20', 25000, 'KMS mobile shop');
insert into smartphone(pid, brand, model, price, shop) values (15,'REALME', '9 Pro', 26000, 'Gadget Park');
insert into smartphone(pid, brand, model, price, shop) values (16,'plus', '8 Pro', 22000, 'Gadget');


commit; 