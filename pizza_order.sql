create table pizza_order(
    order_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    customer_id INT REFERENCES pizza_customer(customer_id),
	store_name VARCHAR(50) NOT NULL,
    order_type VARCHAR(20) NOT NULL,
    order_date timestamptz default current_timestamp,
    delivery_date timestamptz NULL
);

