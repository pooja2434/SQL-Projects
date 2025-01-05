

--Sample Data:
Customers [-]
 customer_id [int] 
 first_name [varchar(100)] 
 last_name [varchar(100)] age[int]
 country [varchar(100)]
Orders [-]
 order_id[integer]
 item[varchar(100)]
 amount[integer]
 customer_id [integer]
Shippings [-]
 shipping_id[integer]
 status[integer]
 customer[integer]


-- To identify the orders which is pending
select 
  cus.customer_id, 
  cus.first_name, 
  cus.last_name, 
  ord.item, 
  sum(ord.amount) as Order_amt, 
  ship.shipping_id 
from 
  Customers cus 
  join Orders ord on cus.customer_id = ord.customer_id 
  join Shippings ship on cus.customer_id = ship.customer 
where 
  ship.status = 'Pending' 
group by 
  cus.customer_id, 
  cus.first_name, 
  ord.item 
order by 
  cus.customer_id --To identify those customers from USA whose items delivered were Keyboard and Mouse
select 
  cus.customer_id, 
  cus.first_name, 
  cus.last_name, 
  ord.item, 
  ship.status, 
  sum(ord.amount) as order_amt 
from 
  Customers cus 
  join Orders ord on cus.customer_id = ord.customer_id 
  join Shippings ship on cus.customer_id = ship.customer 
where 
  ord.item IN ('Keyboard', 'Mouse') 
  and cus.country = 'USA' 
  and ship.status = 'Delivered' 
group by 
  cus.customer_id, 
  cus.first_name, 
  ord.item --To identify the customers who has made the expensive delivered purchase with the item
select 
  cus.customer_id, 
  cus.first_name, 
  cus.last_name, 
  ord.item, 
  ship.status, 
  ord.amount as order_amt 
from 
  Customers cus 
  join Orders ord on cus.customer_id = ord.customer_id 
  join Shippings ship on cus.customer_id = ship.customer 
where 
  ord.amount = (
    select 
      max(ord.amount) 
    from 
      Customers cus 
      join Orders ord on cus.customer_id = ord.customer_id 
      join Shippings ship on cus.customer_id = ship.customer
  ) 
  and ship.status = 'Delivered'

