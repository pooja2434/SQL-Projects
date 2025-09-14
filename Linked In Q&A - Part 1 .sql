1. All customers with/without orders (Full Outer Join)
  ## Use Case- LEFT OUTER JOIN (LEFT JOIN) - “Show me all customers and their orders, even customers with no orders.”
 RIGHT OUTER JOIN (RIGHT JOIN) - “Show me all orders and any matching customers, even if some orders have no customer record.”
  FULL OUTER JOIN - “Show every customer and every order, including customers without orders and orders without customers.”
  Result:
  * Customers with orders → combined row.
  * Customers without orders → order columns are NULL.
  * Orders without matching customers → customer columns are NULL.
So in short: an OUTER JOIN keeps the unmatched rows instead of dropping them.

SELECT c.customer_id,
       c.customer_name,
       o.order_id
FROM Customers c
FULL OUTER JOIN Orders o
    ON c.customer_id = o.customer_id;

2. Employees in more than one project (Self-join)
  # Rows are matched when they have the same employee_id but different project_id
  
SELECT e1.employee_id, e1.name
FROM EmployeeProject e1
JOIN EmployeeProject e2
  ON e1.employee_id = e2.employee_id
 AND e1.project_id <> e2.project_id
GROUP BY e1.employee_id, e1.name;

3. Match orders with customers; include unmatched orders (Left Join)
SELECT o.order_id,
       o.order_date,
       c.customer_name
FROM Orders o
LEFT JOIN Customers c
       ON o.customer_id = c.customer_id;

4. Unique product combinations (Cross Join)
For example, if you have products: A, B, C, the unique combinations are:
(A, B) , (A, C) , (B, C)
SELECT p1.product_name AS product_a,
       p2.product_name AS product_b
FROM Products p1
CROSS JOIN Products p2
WHERE p1.product_id < p2.product_id;
## p1.product_id < p2.product_id is used to avoid duplicate and reversed pairs when generating every possible pair of products.

5. Employees with their direct managers (Self-join)
SELECT e.employee_id,
       e.name  AS employee_name,
       m.name  AS manager_name
FROM Employees e
LEFT JOIN Employees m
       ON e.manager_id = m.employee_id;
6. Customers whose total purchase > average order value
SELECT customer_id
FROM Orders
GROUP BY customer_id
HAVING SUM(order_amount) >
       (SELECT AVG(order_amount) FROM Orders);

7. Employees with lowest salary in their department
SELECT e.*
FROM Employees e
WHERE e.salary = (
    SELECT MIN(salary)
    FROM Employees
    WHERE department_id = e.department_id
);

8. Products ordered more than 10 times
SELECT product_id
FROM OrderDetails
GROUP BY product_id
HAVING SUM(quantity) > 10;

9. Regions where highest sales < threshold (e.g. 100000)

SELECT region
FROM Sales
GROUP BY region
HAVING MAX(sales_amount) < 100000;

10. Median salary per department(use window function)

SELECT department_id,
       PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY salary) AS median_salary
FROM Employees
GROUP BY department_id;

11. Summarize monthly sales & rank descending

SELECT DATE_TRUNC('month', order_date) AS month,
       SUM(order_amount)               AS total_sales,
       RANK() OVER (ORDER BY SUM(order_amount) DESC) AS sales_rank
FROM Orders
GROUP BY DATE_TRUNC('month', order_date);

12. Count unique customers for each product
SELECT product_id,
       COUNT(DISTINCT customer_id) AS unique_customers
FROM OrderDetails
GROUP BY product_id;

13. Top 5 regions by total sales
  
SELECT region,
       SUM(sales_amount) AS total_sales
FROM Sales
GROUP BY region
ORDER BY total_sales DESC
LIMIT 5;

14. Average order value for every customer
  
SELECT customer_id,
       AVG(order_amount) AS avg_order_value
FROM Orders
GROUP BY customer_id;

15. Locate duplicate entries in a column
  
SELECT email, COUNT(*) AS dup_count
FROM Users
GROUP BY email
HAVING COUNT(*) > 1;

16. Evaluate composite index effect

EXPLAIN ANALYZE
SELECT * FROM Orders
WHERE customer_id = 123 AND order_date >= '2025-01-01';

17. Identify High Cardinality
  SELECT column_name, COUNT(DISTINCT column_name) AS distinct_count
FROM TableName;
## High-cardinality means a column contains many distinct values relative to the total number of rows.










