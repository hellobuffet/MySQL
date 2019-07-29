INSERT INTO food VALUES ('CK001', '曲奇餅乾', '2018/01/10', 'TL', 250, '點心');
INSERT INTO food VALUES ('CK002', '蘇打餅乾', '2017/10/12', 'TW', 80, '點心');
INSERT INTO food VALUES ('DK001', '高山茶', '2018/05/23', 'TW', 780, '飲料');
INSERT INTO food VALUES ('DK002', '綠茶', '2017/06/11', 'JP', 530, '飲料');
INSERT INTO food VALUES ('OL001', '苦茶油', '2019/03/16', 'TW', 360, '調味品');
INSERT INTO food VALUES ('OL002', '橄欖油', '2018/07/25', 'TL', 420, '調味品');
INSERT INTO food VALUES ('CK003', '仙貝', '2017/11/01', 'JP', 270, '點心');
INSERT INTO food VALUES ('SG001', '醬油', '2019/05/05', 'JP', 260, '調味品');
INSERT INTO food VALUES ('OL003', '葡萄子油', '2019/05/05', 'JP', 550, '調味品');
INSERT INTO food VALUES ('CK004', '鳳梨酥', '2017/10/12', 'TW', 340, '點心');
INSERT INTO food VALUES ('CK005', '太陽餅', '2017/08/27', 'TW', 150, '點心');
INSERT INTO food VALUES ('DK003', '紅茶', '2019/11/12', 'TL', 260, '飲料');
INSERT INTO food VALUES ('SG002', '醋', '2018/09/18', 'TW', 60, '調味品');

INSERT INTO place VALUES ('TW', '台灣');
INSERT INTO place VALUES ('JP', '日本');
INSERT INTO place VALUES ('TL', '泰國');
INSERT INTO place VALUES ('US', '美國');

select @@sql_safe_updates;
SET SQL_SAFE_UPDATES = 0;
-- 解除SQL修改資料的鎖定

select expiredate from food;
-- UPDATE food SET expiredate = DATE_ADD(expiredate, INTERVAL 2 YEAR);
-- 更新資料，所有保存日期增加兩年

select expiredate,date_add(expiredate, interval 2 year) from food;

 
--  1.	查詢所有食物表格中所有欄位的資料
select * from food;
-- 2.	查詢所有食物名稱、到期日和價格
select f.name,f.expiredate, f.price from food f  ;
-- 3.	查詢所有食物名稱、到期日和價格，並將表頭重新命為'名稱'、'到期日'和'價格'
select f.name as '名稱',f.expiredate as '到期日', f.price as '價格' from food f  ;
-- 4.	查詢所有食物的種類有哪些？(重覆的資料只顯示一次)
select distinct catalog from food;

-- 5查詢所有食物名稱和種類，並串接成一個字串，中間以空白隔開，並將表頭重新命為'Food name & catalog' WHERE子句
select name, catalog , concat(name,' ',catalog) as 'food name & catlog' from food;

-- 6.	查詢所有食物價格超過400的食物名稱和價格
select name, price from food where price > 400;
-- 7.	查詢所有食物價格介於250~530之間的食物名稱和價格
select name, price from food where price >=250 and price <= 530 order by price;
select name, price from food where price between 250 and 530 order by price;
-- 8.	查詢所有食物價格不介於250~530之間的食物名稱和價格
select name, price from food where price < 250 or price > 530;
-- 9.	查詢所有食物種類為'點心'的食物名稱和價格
select name, price from food where catalog = '點心';
-- 10.	查詢所有食物種類為'點心'和'飲料'的食物名稱、價格和種類
select name,price,catalog from food where catalog = '點心' or catalog='飲料';
-- 11.	查詢所有食物產地為'TW'和'JP'的食物名稱和價格
select food.name, food.price from food where placeid='TW' or placeid='JP';
-- 12.	查詢所有食物名稱有'油'字的食物名稱、到期日和價格
select name, expiredate,price from food where name like '%油%';
-- 13.	查詢所有食物到期日在今年底以前到期的食物名稱和價格
select name ,price from food where year(expiredate) <= year(now());
-- 14.	查詢所有食物到期日在明年6月底以前到期的食物名稱和價格
select name, price from food where year(expiredate) <= year(now()+interval 1 year) and month(expiredate) < 6;
-- 15.	查詢所有食物6個月內到期的食物名稱和價格
select name, price from food where  to_days(expiredate) <  to_days(now()+ interval 180 day);


-- --- ORDER BY子句
-- 16.	查詢所有食物名稱、到期日和價格，並以價格做降冪排序
select name, expiredate,price from food order by price desc;
-- 17.	查詢前三個價格最高的食物名稱、到期日和價格，並以價格做降冪排序
select name, expiredate,price  from food order by price desc limit 3;
-- 18.	查詢種類為'點心'且價格低於等於250的食物名稱和價格，並以價格做升冪排序
select name, expiredate,price  from food where price < 250 order by price  ;
-- 19.	顯示所有食物名稱、價格和增加5%且四捨五入為整數後的價格，新價格並將表頭命名為'New Price'
select name,price,round(price+price*0.05) as 'New Price'  from food;
-- 20.	接續上題，再增加一個表頭命名為'Increase'，顯示New price減去price的值
select name,price,round(price+price*0.05) as 'New Price' ,(round(price+price*0.05)-price) as Increase from food;
-- 21.	顯示所有食物名稱、價格和整數後的價格，新價格並將表頭命名為'New Price'；按價格分250以下、251~500和501以上三種分別增加8%,5%和3%且價格無條件捨去成整數
select name,expiredate,price,case when price > 501 then price+price*0.08 when price between 500 and 251 then price+price*0.05 else price+price*0.03 end 'NewPrice' from food;
-- 22.	查詢所有食物名稱、種類、距離今天尚有幾天到期(正數表示)或已過期幾天(負數表示)和註記(有'已過期'或'未過期'兩種)，並將後兩者表頭分別命名為'Days of expired'和'expired or not'
select name, catalog,to_days(expiredate)-to_days(now()) as 'Days of expired', if(to_days(expiredate)-to_days(now()) > 0,'未過期','過期') as 'expired or not' from food;
-- 23.	接續上題，並以過期天數做升冪排序
select name, catalog,to_days(expiredate)-to_days(now()) as 'Days of expired', if(to_days(expiredate)-to_days(now()) > 0,'未過期','過期') as 'expired or not' from food order by (to_days(expiredate)-to_days(now()));
-- --- GROUP BY & HAVING子句
-- 24.	查詢所有食物最高、最低、加總和平均價格，表頭分別命名為'Max'、'Min'、'Sum'和'Avg'，結果皆以四捨五入的整數來顯示
select max(price) as 'Max',min(price) as 'Min',sum(price) as 'Sum',round(avg(price)) as 'Avg' from food ;
-- 25.	接續上題，查詢每個種類
select max(price) as 'Max',min(price) as 'Min',sum(price) as 'Sum',round(avg(price)) as 'Avg',catalog from food group by catalog ;
-- 26.	接續上題，查詢每個種類且平均價格超過300，並以平均價格做降冪排序
select max(price) as 'Max',min(price) as 'Min',sum(price) as 'Sum',round(avg(price)) as 'Avg',catalog from food group by catalog having avg(price > 300) order by round(avg(price)) desc ;
-- 27.	顯示查詢每個種類的食物數量
select count(catalog),catalog from food group by catalog ;
-- 28.	查詢不同產地和每個種類的食物數量
select count(catalog),f.catalog,p.id from food f join place p on f.placeid = p.id group by f.catalog,p.id ;

-- 1.	查詢所有食物名稱、產地編號、產地名稱和價格
select f.name, f.placeid,p.name,f.price from food f join place p on f.placeid = p.id;
-- 2.	查詢所有食物名稱和產地名稱，並串接成一個字串，中間以空白隔開，並將表頭重新命為'Food name & place'
select f.name, f.placeid,p.name,f.price,concat(f.name,' ',p.name) as 'Food name & place' from food f join place p on f.placeid = p.id;
-- 3.	查詢所有'台灣'生產的食物名稱和價格
select f.name,p.name,f.price from food f join place p on f.placeid = p.id having p.name='台灣';
-- 4.	查詢所有'台灣'和'日本'生產的食物名稱和價格，並以價格做降冪排序
select f.name,p.name,f.price from food f join place p on f.placeid = p.id having p.name='台灣'or p.name='日本' order by f.price;
-- 5.	查詢前三個價格最高且'台灣'生產的食物名稱、到期日和價格，並以價格做降冪排序
select f.name,f.expiredate, f.price from food f where placeid='tw' order by f.price limit 3 ;
-- 6.	查詢每個產地(顯示產地名稱)最高、最低、加總和平均價格，表頭分別命名為'Max'、'Min'、'Sum'和'Avg'，結果皆以四捨五入的整數來顯示
select p.name, max(f.price)as 'Max' ,min(f.price)as 'Min',sum(f.price)as 'Sum',round(avg(f.price))as 'Avg' from food f join place p on f.placeid=p.id group by p.name ;
-- 7.	查詢不同產地(顯示產地名稱)和每個種類的食物數量
select count(catalog),f.catalog,p.name from food f join place p on f.placeid = p.id group by f.catalog,p.name ;

select * from food order by price;
-- 1.	查詢所有比'鳳梨酥'貴的食物名稱、到期日和價格
select name, expiredate, price from food where price > (select price from food where name='鳳梨酥');
-- 2.	查詢所有比'曲奇餅乾'便宜且種類是'點心'的食物名稱、到期日和價格
select name, expiredate, price from food where catalog='點心' and  price>(select price from food where name='曲奇餅乾');
-- 3.	查詢所有和'鳳梨酥'同一年到期的食物名稱、到期日和價格
select * from food where year(expiredate)=(select year(expiredate) from food where name='鳳梨酥');
-- 4.	查詢所有比平均價格高的食物名稱、到期日和價格
select name, expiredate, price from food where price > (select avg(price) from food);
-- 5.	查詢所有比平均價格低的'台灣'食物名稱、到期日和價格
select name, expiredate, price from food where price < (select avg(price) from food) and placeid='TW';
-- 6.	查詢所有種類和'仙貝'相同且價格比'仙貝'便宜的食物名稱、到期日和價格
select name, expiredate, price from food where price <= (select price from food where name='仙貝');
-- 7.	查詢所有產地和'仙貝'相同且過期超過6個月以上的食物名稱、到期日和價格
select * from food where placeid= (select placeid from food where name = '仙貝') and to_days(now());
-- 8.	查詢每個產地價格最低的食物名稱、到期日和價格
	select name, expiredate, price from food f where price =(select min(price) from food where placeid=f.placeid);
-- 9.	查詢每個種類的食物價格最高者的食物名稱和價格
select name, price from food f where price = (select MAX(price) from food where catalog=f.catalog);
-- 10.	查詢所有種類不是'點心'但比種類是'點心'貴的食物名稱、種類和價格，並以價格做降冪排序
select * from food where catalog != '點心' and price > (select max(price) from food where catalog='點心') order by price DESC;
-- 11.	查詢每個產地(顯示產地名稱)的食物價格最高者的食物名稱和價格
select f.name, f.price, p.name from food f, place p where f.placeid=p.id and price=(select max(price) from food where placeid = f.placeid);

select * from food;
-- 1.	以不列舉欄位的方式新增一筆食物資料
insert into food value ('DK004','奶茶','2020-01-21 00:00:00','TW',50,'飲料');
-- 2.	以列舉欄位的方式新增一筆食物資料
insert into food (id,name,expiredate,placeid,price,catalog) value ('DK005','鮮奶茶','2020-01-21 00:00:00','TW','80','飲料');
-- 3.	以不列舉欄位的方式新增多產地資料
insert into food value ('DK006','早餐店大冰奶','2021-01-21 00:00:00','TW',30,'飲料'),('DK007','早餐店中冰奶','2021-01-21 00:00:00','TW',20,'飲料');
-- 4.	修改一筆食物資料的價格
update food set name='超級大冰奶' where id='DK006';
-- 5.	按價格分250以下、251~500和501以上三種分別增加8%,5%和3%且價格無條件捨去成整數
set sql_safe_updates=1;
update food set price = case when price > 501 then floor(price+price*0.03) when price between 501 and 250 then floor(price+price*0.05) else floor(price+price*0.05) end ;

-- 6.	刪除一筆食物資料
delete from food where id='DK005';
