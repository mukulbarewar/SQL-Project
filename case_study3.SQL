use Assigment_23
drop table [dbo].[Transaction]
-----------------------------------------------------------------------------------------------------------------------

1) Display the count of customer in each region who has done the transaction in year 2020
select con.region_name, count(distinct cus.customer_id)
as count from [dbo].[Continent] con
inner join [dbo].[Customers] cus on con.region_id = cus.region_id
inner join [dbo].[Transaction] t on t.customer_id = cus.customer_id
where year(t.txn_date) = 2020 group by con.region_name

select Customers.region_name, count(distinct customers.customer_id) as count from [dbo].[Continent] cont 
inner join [dbo].[Customers] cust on cont.region_id=cust.region_id
inner join [dbo].[transaction] trans on trans.customer_id=cust.customer_id 
where year(trans.txn_date)=2020 group by cont.region_name
-----------------------------------------------------------------------------------------------------------------------
2) Display the maximum, minimum of transaction amount of each transaction type.
select txn_type, max(txn_amount) as max, min(txn_amount) as min from [dbo].[Transaction] group by txn_type
-----------------------------------------------------------------------------------------------------------------------
3) Display customer id, region name and transaction amount where transaction type is deposit and transaction amount > 2000.

select [dbo].[Transaction].customer_id,Continent.region_name, [dbo].[Transaction].txn_type, [dbo].[Transaction].txn_amount,[dbo].[Transaction].txn_type,
Continent.region_id,customers.customer_id,Customers.region_id from [dbo].[Transaction] inner join
Customers on [dbo].[Transaction].customer_id=Customers.customer_id inner join Continent on Customers.region_id=Continent.region_id
where [dbo].[Transaction].txn_type in ('deposit') AND [dbo].[Transaction].txn_amount > 2000
select * from continent
select * from customers
select * from [dbo].[Transaction]

-----------------------------------------------------------------------------------------------------------------------
4) Find duplicate records in a customer table.
-----------------------------------------------------------------------------------------------------------------------
5) Display the detail of customer id, region name, transaction type and transaction amount for the minimum 
transaction amount in deposit.
select [dbo].[Transaction].customer_id,Continent.region_name, [dbo].[Transaction].txn_type, [dbo].[Transaction].txn_amount,[dbo].[Transaction].txn_type,
Continent.region_id,customers.customer_id,Customers.region_id from [dbo].[Transaction] inner join
Customers on [dbo].[Transaction].customer_id=Customers.customer_id inner join Continent on Customers.region_id=Continent.region_id
where  

-----------------------------------------------------------------------------------------------------------------------
6) Create a stored procedure to display details of customer and transaction table where transaction
date is greater than Jun 2020.
-----------------------------------------------------------------------------------------------------------------------
7) Create a stored procedure to insert a record in the continent table.

CREATE PROCEDURE Continent_insert1 @region_id int, @region_name varchar(20)
as
insert into Continent values(@region_id, @region_name)
go
exec Continent_insert1 6, 'India'

-----------------------------------------------------------------------------------------------------------------------

select * from Continent
8) Create a stored procedure to display the details of transactions that happened on a specific day.
select * from [dbo].[Transaction]
CREATE PROCEDURE transaction_123 @date as day
as
select * from [dbo].[Transaction] where day('txn_date') 
go

-----------------------------------------------------------------------------------------------------------------------
select * from [dbo].[transaction]
9) Create a user defined function to add 10% of the transaction amount in a table.

create function transaction_add10 
returns table
AS
Return(update [dbo].[transaction] set txn_amount=(txn_amount+txn_amount*10/100)
-----------------------------------------------------------------------------------------------------------------------
10) Create a user defined function to find the total transaction amount for a given transaction type.

CREATE FUNCTION transaction_type (@type as varchar(20))
RETURNS Table
As
Return(select txn_type,sum(txn_amount) from [dbo].[transaction] group by txn_type having txn_type=@type)

select * from dbo.transaction_type('deposit')

-----------------------------------------------------------------------------------------------------------------------
11) Create a table value function which comprises of the following columns customer_id,
region_id ,txn_date , txn_type , txn_amount which will retrieve data from the above table.

-----------------------------------------------------------------------------------------------
12) Create a try catch block to print a region id and region name in a single column.

begin try 
select region_id+region_name from Continent
end try 

begin catch
print 'cannot a add numerical with a string value in one column'
end catch
go
select * from Continent
-----------------------------------------------------------------------------------------------------------------------
13) Create a try catch block to insert a value in the continent table.

begin try
insert into Continent values(7, 'Pakistan')
end try
begin catch
print 'new row added succesfully'
end catch
go


-----------------------------------------------------------------------------------------------------------------------
14) Create a trigger to prevent deleting a table in a database.
-----------------------------------------------------------------------------------------------------------------------
15) Create a trigger to audit the data in a table.
-----------------------------------------------------------------------------------------------------------------------
16) Create a trigger to prevent login of the same user id in multiple pages.
-----------------------------------------------------------------------------------------------------------------------
17) Display top n customers on the basis of transaction type.
select top(n)txn_amount, txn_type from [dbo].[Transaction] group by txn_type




-----------------------------------------------------------------------------------------------------------------------

18) Create a pivot table to display the total purchase, withdrawal and deposit for all the customers
exec emp_details2
-----------------------------------------------------------------------------------------------------------------------

