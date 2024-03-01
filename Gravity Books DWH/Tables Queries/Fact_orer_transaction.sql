
SELECT 
order_line.line_id as line_id_fk, 
order_line.price,
 CAST(cust_order.order_date as date) as order_date_fk, 
order_line.book_id as book_id_fk,
cust_order.customer_id AS customer_id_fk, 
cust_order.shipping_method_id as shipping_method_id_fk
FROM     cust_order INNER JOIN
                  order_line ON cust_order.order_id = order_line.order_id
where order_line.line_id >?   --last load order_line
;
