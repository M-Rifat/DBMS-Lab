CREATE TABLE ITEM
(
item_id CHAR(6) PRIMARY KEY CHECK (item_id LIKE '[P][0-9][0-9][0-9][0-9][0-9]'),
item_name CHAR(12) ,
item_category CHAR(10),
item_price FLOAT(12) check(item_price>=0),
item_qoh int check(item_qoh>=0),
item_last_sold date default(GETDATE())
)

select * from ITEM

INSERT ITEM
(item_id,item_name,item_category,item_price,item_qoh,item_last_sold) VALUES 
('P17102','Watch','Device','3','22','2022-08-24')

UPDATE ITEM set item_price='3' where item_id='P18106'

-------------------------------------------------------------------------------------------


CREATE TABLE TransactionsTable
(
tran_id CHAR(10) PRIMARY KEY CHECK (tran_id LIKE '[T][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
item_id CHAR(6) foreign key references item(item_id),
cust_id CHAR(6) foreign key references CustomerAndSuppliersTable(cust_id),
tran_type CHAR (1) check(tran_type like '[SO]'),
tran_quantity int check (tran_quantity>=0),
tran_date datetime default(GETDATE())
)

select * from TransactionsTable

INSERT TransactionsTable
(tran_id,item_id,cust_id,tran_type,tran_quantity) VALUES 
('T123456175','P17100','C18106','S',2)


