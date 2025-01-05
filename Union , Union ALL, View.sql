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
