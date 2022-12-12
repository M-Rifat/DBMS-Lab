CREATE TABLE CustomerAndSuppliersTable
(
cust_id CHAR(6) PRIMARY KEY CHECK (cust_id LIKE '[CS][0-9][0-9][0-9][0-9][0-9]'),
cust_fname CHAR(15) NOT NULL,
cust_lname VARCHAR(15),
cust_address TEXT,
cust_telno CHAR(12) CHECK (cust_telno LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
cust_city CHAR(12) DEFAULT 'Rajshahi',
sales_amnt MONEY CHECK(sales_amnt>=0),
proc_amnt MONEY CHECK(proc_amnt>=0)
)

select * from CustomerAndSuppliersTable

INSERT CustomerAndSuppliersTable
(cust_id,cust_fname,cust_lname,cust_address,cust_telno,cust_city,sales_amnt,proc_amnt) VALUES 
('S18141','Emon','Islam','Binodpur','01725028366','Rajshahi',0,0)

UPDATE CustomerAndSuppliersTable set cust_fname='Sajjjid' where cust_id='C18107'

DELETE from CustomerAndSuppliersTable where cust_id='S18106'