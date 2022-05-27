CREATE database IF NOT EXISTS E_Commerce;
use e_commerce;

CREATE TABLE IF NOT EXISTS supplier(
supp_ID int NOT NULL,
supp_Name varchar(50) not null,
supp_CITY varchar (50) not null,
supp_PHONE varchar(10) not null,
 PRIMARY  KEY (supp_ID)
);
CREATE TABLE IF NOT EXISTS customer(
cus_ID int NOT NULL,
cus_NAME varchar(20) not null,
cus_PHONE VARCHAR(10) NOT NULL,
cus_CITY varchar(30),
cus_GENDER CHAR,
  primary key (cus_ID)
);

CREATE TABLE IF NOT EXISTS category(
CAT_ID int NOT NULL,
CAT_NAME VARCHAR(20),
PRIMARY KEY (CAT_ID)
);
CREATE TABLE IF NOT EXISTS product(
PRO_ID INT NOT NULL,
PRO_NAME VARCHAR (20) NOT NULL DEFAULT "DUMMY",
PRO_DESC VARCHAR (60),
CAT_ID INT NOT NULL,
primary key (PRO_ID),
FOREIGN KEY (CAT_ID) REFERENCES CATEGORY (CAT_ID)
);
CREATE TABLE IF NOT EXISTS SUPPLIER_PRICING(
PRICING_ID INT NOT NULL,
PRO_ID INT NOT NULL,
SUPP_ID INT NOT NULL,
SUPP_PRICE INT DEFAULT 0,
PRIMARY KEY (PRICING_ID),
FOREIGN KEY (PRO_ID) REFERENCES PRODUCT (PRO_ID),
FOREIGN KEY (SUPP_ID) REFERENCES SUPPLIER (SUPP_ID)
);
CREATE TABLE IF NOT EXISTS `order` (
ORD_ID INT NOT NULL,
ORD_AMOUNT INT NOT NULL,
ORD_DATE Date,
CUT_ID INT NOT NULL,
PRICING_ID INT NOT NULL,
PRIMARY KEY (ORD_ID),
FOREIGN KEY (CUT_ID) REFERENCES CUSTOMER (CUS_ID),
foreign key (PRICING_ID) REFERENCES SUPPLIER_PRICING (PRICING_ID)
);
CREATE TABLE IF NOT EXISTS rating (
RAT_ID INT NOT NULL,
ORD_ID INT NOT NULL,
RAT_RATSTARS INT NOT NULL,
PRIMARY KEY (RAT_ID),
FOREIGN KEY (ORD_ID) REFERENCES  `order` (ORD_ID)
);
 
 /* SUPPLIER TABLE */
 INSERT INTO SUPPLIER VALUES (1, "RAJESH, RETAIL", "DELHI",'1234567890');
 INSERT INTO SUPPLIER VALUES (2, "Appario ,Ltd", "Mumbai", '2589631470');
 INSERT INTO SUPPLIER VALUES (3, "Knome, products","Banglore", '9785462315');
 INSERT INTO SUPPLIER VALUES (4, "Bansal Retails",  "Kochi", '8975463285');
 INSERT INTO SUPPLIER VALUES (5, "Mittal", Ltd, "Lucknow", '7898456532');
 
 
 
 /* CUSTOMER TABLE */
 INSERT INTO CUSTOMER VALUES (1, "AAKASH",  '9999999999',  "DELHI", 'M');
 INSERT INTO CUSTOMER VALUES (1, "AMAN", '9785463215', "NOIDA", 'M');
 INSERT INTO CUSTOMER VALUES (1, "NEHA", '9999999999', "MUMBAI", 'F');
 INSERT INTO CUSTOMER VALUES (1, "MEGHA", '9994562399', "KOLKATA" ,'F');
 INSERT INTO CUSTOMER VALUES (1, "PULKIT", '7895999999', "LUCKNOW", 'M');
 
 /* product table*/
 INSERT INTO PRODUCT VALUES (1," GTA V Windows 7 and above with i5 processor and 8GB RAM", '2'); 
 INSERT INTO PRODUCT VALUES (2,"TSHIRT SIZE-L with Black", "Blue and White variations", '5'); 
 INSERT INTO PRODUCT VALUES (3," ROG LAPTOP Windows 10 with 15inch screen, i7 processor, 1TB SSD", '4'); 
 INSERT INTO PRODUCT VALUES (4," OATS Highly Nutritious from Nestle", '3'); 
 INSERT INTO PRODUCT VALUES (5," HARRY POTTER Best Collection of all time by J.K Rowling", '1');
 INSERT INTO PRODUCT VALUES	(6," MILK 1L Toned MIlk", 3);
 INSERT INTO PRODUCT VALUES (7," Boat Earphones 1.5Meter long Dolby Atmos", '4');
 INSERT INTO PRODUCT VALUES (8,"Jeans Stretchable Denim Jeans with various sizes and color", '5');
 INSERT INTO PRODUCT VALUES (9, "Project IGI compatible with windows 7 and above", '2');
 INSERT INTO PRODUCT VALUES (10, "Hoodie Black GUCCI for 13 yrs and above", '5');
 INSERT INTO PRODUCT VALUES (11, "Rich Dad Poor Dad Written by RObert Kiyosaki", '1');
 INSERT INTO PRODUCT VALUES (12, "Train Your Brain By Shireen Stephen", '1');

 /* CATAGEROY TABLE */
 INSERT INTO CATAGEROY VALUES (1, "BOOKS");
 INSERT INTO CATAGEROY VALUES (2, "GAMES");
 INSERT INTO CATAGEROY VALUES (3, "GROCERIES");
 INSERT INTO CATAGEROY VALUES (4, "ELECTRONICS");
 INSERT INTO CATAGEROY VALUES (5, "CLOTHES");
 
 /* supplier_pricing table*/
 INSERT INTO SUPPLIER_PRICING VALUES (5,4,1,1000);
 INSERT INTO SUPPLIER_PRICING VALUES (6,12,2,780);
 INSERT INTO SUPPLIER_PRICING VALUES (7,12,4,789);
 INSERT INTO SUPPLIER_PRICING VALUES (8,3,1,31000);
 INSERT INTO SUPPLIER_PRICING VALUES (9,1,5,1450);
 INSERT INTO SUPPLIER_PRICING VALUES (10,4,2,999);
 INSERT INTO SUPPLIER_PRICING VALUES (11,7,3,549);

/* ORDER TABLE */
INSERT INTO  `order` VALUES (101, 1500, '2021-10-06', 2, 1);
INSERT INTO  `order` VALUES (102, 1000, '2021-10-12', 3, 5);
INSERT INTO  `order` VALUES (103,30000 ,'2021-09-16', 5, 2);
INSERT INTO  `order` VALUES (104, 1500, '2021-10-05', 1, 1);
INSERT INTO  `order` VALUES (105, 3000, '2021-08-16', 4, 3);
INSERT INTO  `order` VALUES (106, 1450, '2021-08-18', 1, 9);
INSERT INTO  `order` VALUES (107, 789, '2021-09-01', 3, 7);
INSERT INTO  `order` VALUES (108, 780, '2021-09-07', 5, 6);
INSERT INTO  `order` VALUES (109, 3000, '2021-00-10', 5, 3);
INSERT INTO  `order` VALUES (110, 2500, '2021-09-10', 2, 4);
INSERT INTO  `order` VALUES (111, 1000, '2021-09-15', 4, 5);
INSERT INTO  `order` VALUES (112, 789, '2021-09-16',4, 7);
INSERT INTO  `order` VALUES (113, 31000, '2021-09-16', 1,8);
INSERT INTO  `order` VALUES (114, 1000, '2021-09-16', 3, 5);
INSERT INTO  `order` VALUES (115, 3000, '2021-09-16', 5, 3);
INSERT INTO  `order` VALUES (116, 99, '2021-09-17', 2, 14);

/* RATING TABLR */
INSERT INTO RATING VALUES (1, 101, 4);
INSERT INTO RATING VALUES (2, 102, 3);
INSERT INTO RATING VALUES (3, 103, 1);
INSERT INTO RATING VALUES (4, 104, 2);
INSERT INTO RATING VALUES (5, 105, 4);
INSERT INTO RATING VALUES (6, 106, 3);
INSERT INTO RATING VALUES (7, 107, 4);
INSERT INTO RATING VALUES (8, 108, 4);
INSERT INTO RATING VALUES (9, 109, 3);
INSERT INTO RATING VALUES (10, 110, 5);
INSERT INTO RATING VALUES (11, 111, 3);
INSERT INTO RATING VALUES (12, 112, 4);

/* Question - 3 */
SELECT CUS_GENDER AS GENDER, COUNT(distinct(CUS_ID)) AS NoOfCustomers from
(SELECT CUSTOMER.CUS_ID,CUSTOMER.CUS_GENDER FROM CUSTOMER INNER JOIN
(SELECT CUS_ID FROM E_Commerce.ORDER  where ORD_AMOUNT >=3000) AS FILTER_ORDER 
ON customer. CUS_ID = FILTER_ORDER. CUS_ID) AS FILTER_CUSTOMER GROUP BY CUS_GENDER;


SELECT CUS_GENEDER as GENDER, count(distinct(CUS_ID)) AS NOOFCUSTOMERS FROM 
(SELECT CUSTOMER .CUS_ID,CUSTOMER.CUS_GENDER FROM CUSTOMER WHERE CUS_ID IN
(select CUS_ID FROM e_commerce.ORDER WHERE ORD_AMOUNT>=3000))  AS filter_customer group by CUS_GENDER;


/* Question - 4 */
select order_details.*, prod. pro_name from product as prod inner join
(select ord.*,price.pro_id from e_commerce.order as ord inner join supplier_pricing as price 
on ord.PRICING_ID = price.pricing_ID WHERE ord.cus_id2) as order_details 
on order_details.PRO_ID = prod.pro_id; 

select product.pro_name, `order`.* from `order`
supplier_pricing, product where `order`. cus_id =2 and `order`. 
pricing_id = supplier_pricing. pro_id = product.pro_id;

/* Question - 5 */

select supplier.*from supplier where supplier.supp_id in
(select supp_id from supplier_pricing group by supp_id having count(pro_id)>1);

/* Question - 6 */
select category . cat_id, category. cat_name, min(t3.min_price)as min_price from category inner join
(select product. cat_id , product. PRO_NAME, t2.* from product inner join
(select PRO_ID, min(supp_price) as min_price from supplier_pricing group by pro_id)
as t2 where t2.PRO_ID = product.PRO_ID)
as t3 where t3.CAT_ID = category. CAT_ID group by t3.CAT_ID;


/* Question - 7 */

select pro_id, pro_name from product where PRO_ID in
(select PRO_ID from supplier_pricing where PRICING_ID in
(select PRICING_ID from e_commerce. `order` where ord_date>'2021-10-05'));

select product.PRO_ID, product.PRO_NAME from `order` inner join supplier_pricing on supplier_pricing.PRICING_ID = `order`. PRICING_ID inner join product
 on product.PRO_ID = supplier_pricing.pro_id where `order`.ORD_DATE>"2021-10-05";


/* Question - 8*/
select customer.cus_NAME,customer.cus_GENDER from customer where customer. cus_NAME like
'A%' or customer. cus_name like '%A';


/* Question - 9 */
DELIMITER &&
CREATE PROCEDURE proc()
select REPORT.SUPP_ID,REPORT.SUPP_NAME , REPORT, AVERAGE,
CASE
BEGIN
WHEN report.Average = 5 THEN 'EXECELLENT SERVIVE'
WHEN report.Average > 4 THEN  'GOOD SERVICE'
WHEN report.Average > 2 THEN 'AVERAGE SERVICE'
ELSE 'POOR SERVICE'
END AS type_of_service
 from
(select final.supp_id,supplier.supp_Name, final.Average from
(select test2.supp_id, sum(test2.rat_ratstars) / count (test2.rat_ratstars) as average from
(select supplier_pricing.SUPP_ID, test.ord_id , test.rat_ratstars from supplier_pricing inner join
(select `order`.PRICING_ID,rating.ord_id,rating.rat_ratstars from `order`inner join rating on rating.`ord_id` = `order`.ord_id) as test
on test.pricing_id = supplier_pricing.PRICING_ID)
as tests2 group by supplier_pricing.supp_id)
as final inner join supplier where final.supp_ID = supplier.supp_ID) as REPORT ;



























 
 



















