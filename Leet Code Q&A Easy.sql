1. Write a solution to find the ids of products that are both low fat and recyclable. Return the result table in any order.The result format is in the following example.

  +-------------+---------+
| Column Name | Type    |
+-------------+---------+
| product_id  | int     |
| low_fats    | enum    |
| recyclable  | enum    |
+-------------+---------+
product_id is the primary key (column with unique values) for this table.
low_fats is an ENUM (category) of type ('Y', 'N') where 'Y' means this product is low fat and 'N' means it is not.
recyclable is an ENUM (category) of types ('Y', 'N') where 'Y' means this product is recyclable and 'N' means it is not.

  Ans: select product_id from products where low_fats='Y' and recyclable='Y';

2. Find the names of the customer that are either: referred by any customer with id != 2.not referred by any customer.Return the result table in any order.
Input: 
Customer table:
+----+------+------------+
| id | name | referee_id |
+----+------+------------+
| 1  | Will | null       |
| 2  | Jane | null       |
| 3  | Alex | 2          |
| 4  | Bill | null       |
| 5  | Zack | 1          |
| 6  | Mark | 2          |
+----+------+------------+

Ans: select name from Customer where referee_id!=2 or referee_id IS NULL;
