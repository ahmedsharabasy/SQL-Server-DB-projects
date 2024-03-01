

select distinct
co.customer_id as customer_id_fk,
co.order_id as order_id_BK,
co.shipping_method_id as shipping_method_id_fk,
max(case when h.status_id = 1 then CAST(h.status_date as Date) end) as Date_order_recived_fk,
max(case when h.status_id = 2 then CAST(h.status_date as Date) end) as [Date_pending_delivery_fk],
max(case when h.status_id = 3 then CAST(h.status_date as Date) end) as [Date_delivery_inprogress_fk],
max(case when h.status_id = 4 then CAST(h.status_date as Date) end) as [Date_deliverd_fk],
max(case when h.status_id = 5 then CAST(h.status_date as Date) end) as [Date_cancelled_fk],
max(case when h.status_id = 6 then CAST(h.status_date as Date) end) as [Date_returned_fk]


from cust_order co 
join order_history h
on co.order_id = h.order_id
where co.order_id>?
GROUP BY co.customer_id, co.order_date, co.order_id, co.shipping_method_id
order by co.order_id

;



