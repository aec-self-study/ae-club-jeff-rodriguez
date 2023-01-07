SELECT distinct customer_id 
, name
, email
, first_value(created_at) over (partition by customer_id order by created_at asc) as first_order_at
, COUNT(customer_id) OVER (PARTITION BY customer_id) AS number_of_orders,
FROM analytics-engineers-club.coffee_shop.orders orders
LEFT JOIN analytics-engineers-club.coffee_shop.customers customers on orders.customer_id = customers.id