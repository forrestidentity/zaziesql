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

