select * from authors
select * from titleauthor
select * from titles

------------------------------------ 1 ---------------------------------------

--Create Procedure
CREATE PROC sp_showTitleAndAuthor 
AS
BEGIN
SELECT "Authors Last Name"=au_lname FROM authors where au_id in (select au_id from titleauthor where title_id='BU1032')
END
--Execute Procedure
EXEC sp_showTitleAndAuthor

--Change Procedure
ALTER PROC sp_showTitleAndAuthor
AS 
BEGIN
SELECT "Authors Fast Name"=au_fname FROM authors where au_id in (select au_id from titleauthor where title_id='BU1032')
END

--Delete Procedure
DROP PROC sp_showTitleAndAuthor



------------------------------------ 2 ---------------------------------------

ALTER PROC sp_showTitleAndAuthor @titleid char(15)
AS
BEGIN
SELECT "Authors Last Name"=au_lname FROM authors where au_id in (select au_id from titleauthor where title_id=@titleid)
END

--Execute
EXEC sp_showTitleAndAuthor 'TC7777'


------------------------------------ 3 ---------------------------------------

CREATE PROC sp_updatePrice @titleid char(15)
AS
BEGIN
	DECLARE @price MONEY 
	SELECT @price=price from TITLES WHERE title_id=@titleid
	set @price=@price+0.1*@price
	IF @price<=20
UPDATE titles SET price= @price WHERE title_id=@titleid 
   END

   --Execute
EXEC sp_updatePrice 'BU2075'


------------------------------------Task 1 ---------------------------------------
select * from CustomerAndSuppliersTable
select * from ITEM
select * from TransactionsTable


CREATE PROC sp_showItemDetails
AS
BEGIN
SELECT "Category"=item_category,"Total number of items"=count(item_qoh),"Average Price"=cast(avg(item_price)as decimal(10,2)) FROM ITEM group by item_category
END

exec sp_showItemDetails

------------------------------------Task 2 ---------------------------------------

CREATE PROC sp_showItemDetailsP @item_category char(10),@item_price char(12)
AS
BEGIN
SELECT * FROM ITEM where item_category=@item_category and item_price<@item_price
END

exec sp_showItemDetailsP 'vehicle','8'


------------------------------------Task 3 ---------------------------------------

CREATE PROC sp_showItemDetailsL @item_category char(10),@avg_price float(12)
AS
BEGIN
WHILE (SELECT avg(item_price) from ITEM WHERE item_category=@item_category)<=@avg_price
BEGIN
UPDATE ITEM SET item_price=item_price+item_price*0.1 WHERE item_category=@item_category 
END
END

drop proc sp_showItemDetailsL

exec sp_showItemDetailsL 'vehicle',8.0