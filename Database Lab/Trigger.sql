select * from ITEM

---------------------------- 1 ----------------------------

Create trigger trg_test on ITEM for insert 
as begin 
print 'data inserted'
end

--------------------------- 2 ------------------------------
select * from ITEM

create trigger trg_update_item on TransactionsTable for insert 
as begin 
declare @item_id char(6),@tranamount int,@tran_type char(1)
select @item_id=item_id,@tranamount=tran_quantity,@tran_type=tran_type from inserted
if (@tran_type='S')
update ITEM set item_qoh=item_qoh- @tranamount where item_id=@item_id
else 
update ITEM set item_qoh=item_qoh+ @tranamount where item_id=@item_id
end

----------------------------Task 1-------------------------------------


select * from CustomerAndSuppliersTable
select * from ITEM
select * from TransactionsTable


create trigger trg_update on TransactionsTable for insert 
as begin 
declare @cust_id char(6),@tranamount int,@tran_type char(1),@price float(12)
select @cust_id=cust_id,@tranamount=tran_quantity,@tran_type=tran_type,@price=item_price from inserted,ITEM where inserted.item_id = ITEM.item_id
if (@tran_type='S')
update CustomerAndSuppliersTable set sales_amnt=sales_amnt+ (@tranamount*@price) where cust_id=@cust_id
else 
update CustomerAndSuppliersTable set proc_amnt=sales_amnt+ (@tranamount*@price) where cust_id=@cust_id
end
