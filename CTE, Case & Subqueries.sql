Use an Online SQL complier like https://www.codechef.com/sql-online-compiler to execute the below query
Refer Table Creation.sql(https://github.com/pooja2434/SQL-Projects/blob/main/Table%20Creation.sql) to know about the table structure..

-- Common Table Expressions

#Top 2 oldest employee based on their birth date
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
  Oldest_employee 
where 
  Rank <= 2;



---Subqueries

# Find customers who placed more than 2 orders.

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
 # To categorize products as "Expensive" or "Cheap" based on price.

select 
  ProductID, 
  ProductName, 
  SupplierID, 
  case when Price > 10 then 'Expensive' else 'Cheap' end as pricecategory 
from 
  Products;

