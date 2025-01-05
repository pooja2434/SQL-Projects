Use an Online SQL complier to execute the below query
Refer Table Creation.sql(https://github.com/pooja2434/SQL-Projects/blob/main/Table%20Creation.sql) to know about the table structure..

-- Common Table Expressions
With Oldest_employee as(
  select 
    EmployeeID, 
    FirstName, 
    LastName, 
    Notes, 
    BirthDate, 
    Rank() over (
      order by 
        BirthDate
    ) as Rank 
  from 
    Employees
) 
select 
  * 
from 
  Oldest_employee;


---Subqueries

select 
  CustomerID, 
  CustomerName 
from 
  Customers 
where 
  CustomerID IN (
    select 
      CustomerID 
    from 
      Orders 
    group by 
      CustomerID 
    having 
      count(CustomerID)> 2
  );

--CASE statements

select 
  ProductID, 
  ProductName, 
  SupplierID, 
  case when Price > 10 then 'Expensive' else 'Cheap' end as pricecategory 
from 
  Products;

