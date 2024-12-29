Refer Table Creation.sql(https://github.com/pooja2434/SQL-Projects/blob/main/Table%20Creation.sql) to know about the table structure..

  1. Rank

Ranks products based on price within each category, with ties receiving the same rank.
PARTITION BY: Groups rows for window calculations

  SELECT 
    ProductID, 
    ProductName, 
    CategoryID, 
    Price,
    RANK() OVER (PARTITION BY CategoryID ORDER BY Price DESC) AS PriceRank
FROM Products;

2.  DENSE_RANK()

Similar to RANK() but does not skip ranks if there are ties.

  SELECT ProductID,
    CategoryID,
    Price,
    Dense_rank() over(partition by CategoryID order by Price desc) as price_desc 
    from Products;
  

