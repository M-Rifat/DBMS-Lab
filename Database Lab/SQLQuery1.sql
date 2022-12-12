--SELECT * FROM INFORMATION_SCHEMA.TABLES 

--2
select * from titles
select * from publishers
select * from authors
select * from titleauthor

SELECT CITY,ZIP FROM AUTHORS
select * from authors where state='CA'
--3
SELECT * FROM TITLES ORDER BY royalty ASC
--4
SELECT MAX (PRICE) FROM TITLES
--5
SELECT TYPE,MAX (PRICE) FROM TITLES GROUP BY TYPE
--6
SELECT TYPE,MAX(PRICE) FROM TITLES GROUP BY TYPE HAVING AVG(PRICE)>15
--7
SELECT "NAME" =SUBSTRING(au_fname,1,1)+'.'+au_lname,phone FROM AUTHORS



--Task1
select title from titles where ytd_sales>8000
--Task2
SELECT TITLE FROM TITLES WHERE royalty>12 AND royalty<24
--Task3
SELECT TYPE,"PRICE"=AVG(PRICE),"YTD_SALES"=SUM(ytd_sales) FROM TITLES GROUP BY TYPE


