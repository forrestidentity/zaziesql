Model

- Store
    - Name (PRIMARY KEY)
    - Location (NOT NULL)
    - Phone (Unique)
- Order
    - ID (PRIMARY KEY GENERATED)
    - Store(FK)
    - Customer ID(FK)
    - is Delivery/pickup
    - Pizza Size (FK)
    - Date Ordered (NOT NULL)
    - Date Delivered (NOT NULL)
- Customer
    - ID (PRIMARY KEY GENERATED)
    - Name (NOT NULL)
    - Phone NULLABLE
    - Address NULLABLE
- Pizza Size
    - Name (PRIMARY KEY)
    - Cost (NOT NULL)


    Queries we want:
    - Total nunber of orders per store
    - Total number of deliveries per store
    - percentage of orders completed per store
    - Average time for a completed deliver per store

Updates
- set delivery date to now
update pizza_order
set delivery_date = now()
where order_id=1

Example queries

Get all orders ordere by the store name and order type

select *
from pizza_order
order by store_name, order_type

Group By with a count

select store_name, order_type, count(*)
from pizza_order
group by store_name, order_type
order by store_name, order_type

Adding a column alias

select store_name, count(*) as TOTAL_ORDERS
from pizza_order
group by store_name
order by store_name


Getting a maximum value 

select store_name, order_type, count(*), MAX(order_date)
from pizza_order
group by store_name, order_type
order by store_name, order_type

String functions (lower case store name)

select order_id, LOWER(store_name), order_date
from pizza_order

Truncate a date
# extract the first momemnt of the given time (truncate)
select order_id, store_name, order_date, date_trunc('year', order_date)
from pizza_order

Extract a part of the date

# get the count of orders per store, per month
select store_name, 
	extract(MONTH from order_date), count(*)
from pizza_order
group by store_name, extract(MONTH from order_date)
order by store_name

#percentage of orders completed per store (NOT WORKING YET!)
select 
	store_name, 
	order_type, 
	count(*) as total_orders,
	count(delivery_date) as delivered_orders,
	DIV(count(delivery_date), count(*)) as completed_percent
from pizza_order
group by store_name, order_type



