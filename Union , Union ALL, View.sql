

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
