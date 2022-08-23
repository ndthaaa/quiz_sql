CREATE DATABASE tugas_sql
USE tugas_sql

--TABLE CUSTOMER

 CREATE TABLE dbo.customers  
    (id int PRIMARY KEY NOT NULL,  
    forename varchar(255) NOT NULL,
    surname varchar(255) NOT NULL,  
    postcode varchar(255) NULL,
    phone varchar(255) NOT NULL,
    registered bit)

 INSERT dbo.customers (id, forename, surname, postcode,phone,registered) 
     VALUES (1, 'Peggie', 'Pallent',NULL,'521-107-9777',1)  
 SELECT * FROM customers
 INSERT dbo.customers (id, forename, surname, postcode,phone,registered) 
     VALUES 
     (2, 'Mathias', 'Foister',56528,'545-991-1112',0),
     (3, 'Tamarra', 'Le Merchant',55184,'808-786-9467',1), 
     (4, 'Janetta', 'Helin',NULL,'686-355-4931',1),  
     (5, 'Reinhold', 'Martijn',NULL,'795-679-7136',0),  
     (6, 'Lauritz', 'Provest',NULL,'296-351-8061',0),  
     (7, 'Con', 'Kupisz',NULL,'184-411-1830',1),  
     (8, 'Beatrisa', 'Tomowics',NULL,'979-772-1232',1),  
     (9, 'Nathanial', 'Rupert',3025-419,'636-290-1463',0), 
     (10, 'Etta', 'Edginton',48100,'862-845-2560',1)  

-- TABLE ORDERS

 CREATE TABLE dbo.orders
    (id int PRIMARY KEY NOT NULL,  
    registered bit,  
    payment_type varchar(255) NOT NULL,
    date date NULL,
    status varchar(255) NOT NULL,
    total int NULL,
    customer_id int FOREIGN KEY REFERENCES customers(id),
    delivery_add_id int FOREIGN KEY REFERENCES delivery (id))
 SELECT * FROM orders
 SELECT CAST('05/31/2019' AS date);
 INSERT dbo.orders (id, registered, payment_type, date, status, total, customer_id, delivery_add_id) 
     VALUES (1, 0, 'diners-club-us-ca','2019-05-31','Paid', 182389, 6, 17)
     (2, 1, 'jcb', '2019-12-24','Canceled',385376, 6,17), 
     (3, 0, 'mastercard', '2019-07-04','Canceled',404804,2,4),  
     (4, 1, 'jcb', '2019-07-16','Canceled',428182,10,13),  
     (5, 1, 'visa-electron', '2019-01-13','Canceled',370261,5,10 ),  
     (6, 1, 'americanexpress', '2019-10-22','Canceled',440665,6,3),  
     (7, 0, 'jcb', '2020-01-30','Canceled',427954,3,14),  
     (8, 0, 'mastercard', '2019-08-30','Canceled',250107,6,11), 
     (9, 0, 'jcb', '2019-06-03','Paid',144049,2,4),
     (10, 0, 'jcb', '2019-08-31','Pending',114408,5,6)   
 


-- TABLE ORDERS ITEM

 CREATE TABLE dbo.order_item
    (id int PRIMARY KEY NOT NULL,  
    order_id int FOREIGN KEY REFERENCES orders(id),  
    product_id int FOREIGN KEY REFERENCES products(id),
    quantity int NULL)
 SELECT * from order_item
 INSERT dbo.order_item (id, order_id, product_id,quantity) 
 VALUES 
    (1,4,8,4),
    (2,8,10,11),
    (3,8,4,11),
    (4,1,2,3),
    (5,7,9,15),
    (6,1,4,13),
    (7,10,7,6),
    (8,9,10,12),
    (9,7,6,11),
    (10,6,2,16);

-- TABLE PRODUCTS

 CREATE TABLE dbo.products
    (id int PRIMARY KEY NOT NULL,  
    cat_id int FOREIGN KEY REFERENCES categories(id),  
    name varchar(255) NULL,
    description varchar(max) NULL,
    image varchar(max),
    price money NULL)
 SELECT * FROM products
INSERT dbo.products (id, cat_id, name, description, image, price) 
 Values 
 (1,1, 'Truffle Paste', 'Jamur enak', 'http://jamur.com/truffle.png', 8791),
 (2,6, 'Carrots - Mini Reg Organic', 'Wortel enak', 'http://wortel.com/carrot.png', 9675),
 (3,4, 'Sprouts Dikon', 'Kecambah enak', 'http://kecambah.com/sprouts.png', 9147),
 (4,4, 'Mushrooms - Black, Dried', 'Jamur sedap', 'http://jamur.com/mushrooms.png', 2019),
 (5,6, 'Coffee - Flavoured', 'Kopi enak', 'http://kopi.com/coffee.png', 5270),
 (6,2, 'Juice - Orange', 'Jus Jeruk enak', 'http://jeruk.com/orange.png', 9780),
 (7,1, 'Energy Drink - Franks Original', 'Extra Joss', 'http://extrajoss.com/extrajoss.png', 9676),
 (8,3, 'Energy - Boo - Koo', 'Kuku Bima', 'http://kukubima.com/bimaclaw.png', 2916),
 (9,4, 'Tart - Lemon', 'Lemon enak', 'http://lemon.com/lemon.png', 2099),
 (10,5, 'Beef Tenderloin Aaa', 'Rendang enak', 'http://rendang.com/beef.png', 6888);


-- TABLE CATEGORIES

 CREATE TABLE dbo.categories
    (id int PRIMARY KEY NOT NULL,  
    name varchar(255) NULL,
    description varchar(max) NULL,
    image varchar(max))
 SELECT * FROM categories
INSERT dbo.categories (id, name, description, image) 
     VALUES 
 (1,'vegetables', 'Fus-Ro-Dah', 'http://theelderscroll.skyrim/UnrelentingForce.jpg'),
 (2,'vegetables', 'Yol-Tor-Suul', 'http://theelderscroll.skyrim/FireBreath.jpg'),
 (3,'fruits', 'Od-Ah-Viing', 'http://theelderscroll.skyrim/CallDragonOdahviing.jpg'),
 (4,'fruits', 'Mul-Qah-Diiv', 'http://theelderscroll.skyrim/DragonAspect.jpg'),
 (5,'vegetables', 'Joor-Zah-Frul', 'http://theelderscroll.skyrim/Dragonrend.jpg'),
 (6,'vegetables', 'Fo-Krah-Diin', 'http://theelderscroll.skyrim/FrostBreath.jpg'),
 (7,'vegetables', 'Wuld-Nah-Kest', 'http://theelderscroll.skyrim/WhirlwindSprint.jpg'),
 (8,'fruits', 'Su-Grah-Dun', 'http://theelderscroll.skyrim/ElementalFuryjpg'),
 (9,'vegetables', 'Wuld-Nah-Kest', 'http://theelderscroll.skyrim/WhirlwindSprint.jpg'),
 (10,'fruits', 'Su-Grah-Dun', 'http://theelderscroll.skyrim/ElementalFuryjpg')


-- TABLE DELIVERY_ADDRESS

 CREATE TABLE dbo.delivery  
    (id int PRIMARY KEY NOT NULL,  
    forename varchar(255) NOT NULL,
    surname varchar(255) NOT NULL,  
    add1 varchar(255) NULL,
    post_code varchar(255) NOT NULL,
    phone varchar(255) NOT NULL,
    email varchar(255) NOT NULL)
 SELECT * FROM delivery

 INSERT dbo.delivery (id, forename, surname, add1, post_code, phone, email) 
     VALUES (1, 'Harry', 'Blamires','5 Northwestern','K67','709-178-2038','hblamires@lulu.com')  
     (2, 'Adi', 'Carlon','37136 Macpherson Street','','522-462-4973','acarlon1@discuz.net'),  
     (3, 'Barty', 'Monkley','55 Hauk Trail','','879-792-1014','brmonkley@ihg.com'), 
     (4, 'Salem', 'Ewert','81078 Oakridge Circle','','223-256-8714','sewert3@hostgator.com'),  
     (5, 'Vilhemina', 'Baimsfather','72949 Eastwood Street','','632-170-9234','vbairnsfather4@psu.edu'),  
     (6, 'Hayyim', 'Lisamore','388 Birchwood Place','','901-562-9922','hlisamore5@prweb.com'),  
     (7, 'Mareah', 'Gutans','56 Tony Terrace','','142-802-2019','mgutans6@ucoz.com'),  
     (8, 'Garrent', 'Grayston','64394 Clove Place','','580-799-7576','ggrayston7@prweb.com'),  
     (9, 'Roxine', 'Booler','69 Lakewood Gardens Place','','857-659-8653','rbooler8@springer.com'),  
     (10, 'Filbert', 'Brougham','8756 Village Green Place','','476-610-5525','fbrougham9@si.edu'),  
     (11, 'Ayub', 'Hasyim','Perumda Helvet','','001-010-4973','aayub@gmaiil.com'),  
     (12, 'Huda', 'Sianipar','Sleman City House','','002-020-4973','hudaa@yahoo.co.id'),  
     (13, 'Hali', 'Naibaho','Green city village','','003-030-4973','halii@psu.edu'),  
     (14, 'Barry', 'Carlon','Villagian Village','','004-040-4973','bbarry@gmail.com'),  
     (15, 'Deri', 'Ewert','Perumahanan millenial','','005-050-4973','Derii@gmail.com'),  
     (16, 'Diah', 'Lisamore','Komplek Besari','','006-060-4973','Diah@yahoo.co.id'),  
     (17, 'Ayomi', 'Hanida','Desa Penari','','007-070-4973','ayomi@gmail.com'),  
     (18, 'Nezu', 'Zuko','Komplek Orangtua','','008-080-4973','Nezuko@yahoo.co.id'),  
     (19, 'Kyugi', 'Oh','Komplek Ikan Hiu','','009-090-4973','Kyugioh@yahoo.co.id'), 
     (20, 'Otsuka', 'Nasu','Hottage','','010-100-4973','Otsuka@gmail.com')  

 SELECT * FROM delivery
-- UPDATE delivery
-- SET post_code = '5049'
-- WHERE id = 10;



--1.  Create query to show orders by customer
 SELECT orders.id, CONCAT (customers.forename, ' ', customers.surname), products.name
 FROM customers
 INNER JOIN orders ON orders.customer_id=customers.id
 INNER JOIN order_item ON order_item.order_id=orders.id
 INNER JOIN products ON products.id=order_item.id;


-- 2. Create query to show sum of orders by order status (“paid”, “cancelled”,"pending")
 SELECT status, SUM (total) as total
 from orders
 GROUP BY status

-- 3. Create query to show products by categories
 SELECT products.id AS id,products.name AS name,categories.name AS categories
 FROM products
 INNER JOIN categories ON categories.id=products.cat_id
 ORDER BY categories.name;

-- 4. Create query to show address of customers orders
 SELECT orders.id AS id,CONCAT (delivery.forename, ' ', delivery.surname)AS name,delivery.add1 AS address
 FROM orders
 INNER JOIN delivery ON delivery.id=orders.delivery_add_id;

-- 5. Create query to show all product on orders
 SELECT orders.id AS id, order_item.order_id, products.name AS Name
 FROM orders
 INNER JOIN order_item ON order_item.id=orders.id
 INNER JOIN products ON products.id=order_item.product_id;
