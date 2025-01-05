Use an Online SQL complier like (https://www.codechef.com/sql-online-compiler) to execute the below query
Refer Table Creation.sql(https://github.com/pooja2434/SQL-Projects/blob/main/Table%20Creation.sql) to know about the table structure..

-- Union 
# Removes all the duplicates 
SELECT City FROM Customers
UNION
SELECT City FROM Suppliers;

-- Union ALL
# Gives the result with duplicates
SELECT 
  City 
FROM 
  Customers 
UNION ALL 
SELECT 
  City 
FROM 
  Suppliers;


--Creating View
Create view OrderDetailsview as 
select 
  ord.OrderDetailID, 
  ord.OrderID, 
  prod.ProductID, 
  ord.Quantity, 
  (ord.Quantity * prod.Price) as Total_price 
from 
  OrderDetails Ord 
  join Products prod on ord.ProductID = prod.ProductID;
select 
  * 
from 
  OrderDetailsview;
