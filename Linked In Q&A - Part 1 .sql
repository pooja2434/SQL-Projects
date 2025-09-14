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


