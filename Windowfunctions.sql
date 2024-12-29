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

Gets the price of the least expensive product in each category.
  
--UNBOUNDED PRECEDING: All rows before current row are considered.
-- UNBOUNDED FOLLOWING: All rows after the current row are considered.
select ProductID,
    CategoryID,
    Price,
   last_value(Price) over(partition by CategoryID order by Price desc rows BETWEEN 
    unbounded preceding and unbounded following) as Least_price
    from Products;

11. cume_dist()

  Calculates the cumulative distribution of the products price with in each category
  --Here category id under 1 has 2 items , 2 has 3 items  so the output for the first record 
--with 1 is 1/2- 0.5, the next 1 - 2/2 - 1, for 2 , since it has three items,
--the answer will be 1/3= 0.33, 2/3 = 0.66, 3/3 =1

select ProductID,
     CategoryID,
     Price,
     round(cume_dist() over( partition by CategoryID order by Price desc ),4) as cume_dist
     from Products;

12. percent_rank()

  Calculates the relative rank of the product’s price within its category.
  Below is the Answer where 1 is the highest value and least value takes -/0
  After leaving 1 rest is 6 = 1/6=0.1666

ProductID	ProductName	CategoryID	Price	PercentRank
1	Chais	1	18	-
2	Chang	1	19	1
3	Aniseed Syrup	2	10	-
5	Chef Anton's Gumbo Mix	2	21.35	0.16666666666666666
6	Chef Anton's Gumbo Mix	2	21.35	0.16666666666666666
7	Chef Anton's Gumbo Mix	2	21.35	0.16666666666666666
8	Chef Anton's Gumbo Mix	2	21.35	0.16666666666666666
9	Chef Anton's Gumbo Mix	2	21.35	0.16666666666666666
4	Chef Anton's Cajun Seasoning	2	22	1

SELECT 
    ProductID, 
    ProductName, 
    CategoryID, 
    Price,
PERCENT_RANK() OVER (PARTITION BY CategoryID ORDER BY Price asc)  AS PercentRank
FROM Products;

13. Custom Rolling window

Calculates a rolling average price over the last 2 products (based on price).

SELECT 
    ProductID, 
    ProductName, 
    CategoryID, 
    Price,
    Avg(price) over(partition by CategoryID order by Price rows between 1 preceding and current row) as rolling_average
  FROM Products;




  









  

