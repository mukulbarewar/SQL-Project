3) Perform the following with help of the above database



==>Get all the details from the person table including email ID, phone number, and phone number type
select person.person.*,person.emailaddress.emailaddress,person.personphone.phonenumber,person.phonenumbertype.phonenumbertypeid from person.person
join person.emailaddress on person.person.bussinessentityid=Person.emailaddress.BusinessEntityID
join person.personphone on person.person.BusinessEntityID=person.personphone.BusinessEntityID
join person.PhoneNumberType on person.personphone.PhoneNumberTypeID=person.phonenumbertype.phonenumbertype.PhoneNumberTypeID

select p.*,pe.EmailAddress,pp.PhoneNumber,pt.PhoneNumberTypeID from Person.Person as p
join Person.EmailAddress as pe on p.BussinessEntityID=pe.BusinessEntityID
join person.PersonPhone as pp on p.BusinessEntityID=pp.BusinessEntityID
join Person.PhoneNumberType as pt on pp.PhoneNumberTypeID=pt.PhoneNumberTypeID


==>Get the details of the sales header order made in May 2011

select *, SalesOrderHeader.OrderDate from Sales.SalesOrderDetail inner join Sales.SalesOrderHeader
on sales.SalesOrderHeader.SalesOrderID = sales.SalesOrderDetail.SalesOrderID 
where month(SalesOrderHeader.OrderDate) = 05 and year(SalesOrderHeader.OrderDate) = 2011



==>Get the details of the sales details order made in the month of May 2011

select * from sales.salesorderheader join 
sales.SalesOrderDetail on sales.SalesOrderHeader.SalesOrderID=sales.SalesOrderDetail.SalesOrderID
where month(Orderdate) = 5 and year(Orderdate)=2011


==>Get the total sales made in May 2011

select sum(totaldue) as total_sales from sales.SalesOrderHeader 
where month(Orderdate)=5 and year(Orderdate)=2011


==>Get the total sales made in the year 2011 by month order by increasing sales


select month(orderdate) as month,sum(totaldue) as total_sale 
from sales.salesorderheader where year(orderdate)=2011
group by month(OrderDate)
order by total_sale



select datename(month,orderdate) as month,sum(totaldue) as total_sale 
from sales.salesorderheader where year(orderdate)=2011
group by dataname(month,OrderDate)
order by total_sale


-- ==>Get the total sales made to the customer with FirstName='Gustavo' and LastName='Achong'