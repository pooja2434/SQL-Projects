Refer Table Creation.sql(https://github.com/pooja2434/SQL-Projects/blob/main/Table%20Creation.sql) to know about the table structure..

  1. Rank()

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

3. ROW_NUMBER()
  
Assigns a unique row number to each product within each category, based on price.
  
select ProductID,
    CategoryID,
    Price,
    Row_number() over(partition by CategoryID order by price desc) as rownumber 
    from Products;

4. NTILE()

  Divides products into 4 quartiles based on price within each category.
  
select ProductID,
    CategoryID,
    Price,
    Ntile(2) over(partition by CategoryID order by Price desc) as price_desc
    from Products;

5. SUM() as window function

Calculates the cumulative price of products within category

select ProductID,
    CategoryID,
    Price, 
    sum(Price) over(partition by CategoryID order by Price desc) as price_desc 
    from Products;

6. AVG() as window function

  Calculates the average price of products within each category.

  select ProductID,
    CategoryID,
    Price, 
   AVG(Price) over(partition by CategoryID order by Price desc) as price_desc
    from Products;

7. LAG()

  Shows the price of the previous product (based on price within each category)

select ProductID, 
    CategoryID,
    Price, 
    LAG(Price) over(partition by CategoryID order by Price desc) as price_desc 
    from Products;

8. LEAD()

  Shows the price of next product(based on price within each category)

select ProductID,
    CategoryID,
    Price,
    LEAD(Price) over(partition by CategoryID order by Price desc) as Lowest_Price
    from Products;

9. First_value()

Gets the price of the most expensive product in each category

select ProductID,
  CategoryID,
  Price,
  First_value(Price) over(partition by CategoryID order by Price desc ) as Highest_price
  from Products;

10.Last_value()
--UNBOUNDED PRECEDING: All rows before current row are considered.
-- UNBOUNDED FOLLOWING: All rows after the current row are considered.
select ProductID,
    CategoryID,
    Price,
   last_value(Price) over(partition by CategoryID order by Price desc rows BETWEEN 
    unbounded preceding and unbounded following) as Least_price
    from Products;








  

