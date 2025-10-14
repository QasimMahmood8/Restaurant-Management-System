
-- PostgreSQL Restaurant Management System

-- 1. Customers
CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    phone_number VARCHAR(15),
    email VARCHAR(100)
);

-- 2. Tables
CREATE TABLE tables (
    table_id SERIAL PRIMARY KEY,
    table_number INT UNIQUE NOT NULL,
    capacity INT NOT NULL,
    status VARCHAR(20) DEFAULT 'available'
);

-- 3. Reservations
CREATE TABLE reservations (
    reservation_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(customer_id),
    table_id INT REFERENCES tables(table_id),
    reservation_time TIMESTAMP NOT NULL,
    num_guests INT NOT NULL,
    status VARCHAR(20) DEFAULT 'pending'
);

-- 4. Menu Items
CREATE TABLE menu_items (
    item_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    price DECIMAL(10, 2) NOT NULL,
    available BOOLEAN DEFAULT TRUE
);

-- 5. Orders
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    table_id INT REFERENCES tables(table_id),
    customer_id INT REFERENCES customers(customer_id),
    order_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10,2) DEFAULT 0,
    status VARCHAR(20) DEFAULT 'open'
);

-- 6. Order Items
CREATE TABLE order_items (
    order_item_id SERIAL PRIMARY KEY,
    order_id INT REFERENCES orders(order_id),
    item_id INT REFERENCES menu_items(item_id),
    quantity INT NOT NULL
);

-- 7. Staff
CREATE TABLE staff (
    staff_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    role VARCHAR(50),
    hourly_rate DECIMAL(10,2)
);

-- 8. Shifts
CREATE TABLE shifts (
    shift_id SERIAL PRIMARY KEY,
    staff_id INT REFERENCES staff(staff_id),
    shift_date DATE,
    start_time TIME,
    end_time TIME
);


-- Sample Data Inserts

-- Customers
INSERT INTO customers (first_name, last_name, phone_number, email) VALUES ('Emma', 'Jones', '555-0100', 'emma.jones@example.com');
INSERT INTO customers (first_name, last_name, phone_number, email) VALUES ('Frank', 'Garcia', '555-0101', 'frank.garcia@example.com');
INSERT INTO customers (first_name, last_name, phone_number, email) VALUES ('Ivy', 'Wilson', '555-0102', 'ivy.wilson@example.com');
INSERT INTO customers (first_name, last_name, phone_number, email) VALUES ('Ivy', 'Wilson', '555-0103', 'ivy.wilson@example.com');
INSERT INTO customers (first_name, last_name, phone_number, email) VALUES ('Jack', 'Taylor', '555-0104', 'jack.taylor@example.com');
INSERT INTO customers (first_name, last_name, phone_number, email) VALUES ('Henry', 'Davis', '555-0105', 'henry.davis@example.com');
INSERT INTO customers (first_name, last_name, phone_number, email) VALUES ('Henry', 'Davis', '555-0106', 'henry.davis@example.com');
INSERT INTO customers (first_name, last_name, phone_number, email) VALUES ('Emma', 'Jones', '555-0107', 'emma.jones@example.com');
INSERT INTO customers (first_name, last_name, phone_number, email) VALUES ('Ivy', 'Wilson', '555-0108', 'ivy.wilson@example.com');
INSERT INTO customers (first_name, last_name, phone_number, email) VALUES ('David', 'Williams', '555-0109', 'david.williams@example.com');
INSERT INTO customers (first_name, last_name, phone_number, email) VALUES ('Ivy', 'Wilson', '555-0110', 'ivy.wilson@example.com');
INSERT INTO customers (first_name, last_name, phone_number, email) VALUES ('Ivy', 'Wilson', '555-0111', 'ivy.wilson@example.com');
INSERT INTO customers (first_name, last_name, phone_number, email) VALUES ('Alice', 'Smith', '555-0112', 'alice.smith@example.com');
INSERT INTO customers (first_name, last_name, phone_number, email) VALUES ('Bob', 'Johnson', '555-0113', 'bob.johnson@example.com');
INSERT INTO customers (first_name, last_name, phone_number, email) VALUES ('Jack', 'Taylor', '555-0114', 'jack.taylor@example.com');
INSERT INTO customers (first_name, last_name, phone_number, email) VALUES ('Ivy', 'Wilson', '555-0115', 'ivy.wilson@example.com');
INSERT INTO customers (first_name, last_name, phone_number, email) VALUES ('Bob', 'Johnson', '555-0116', 'bob.johnson@example.com');
INSERT INTO customers (first_name, last_name, phone_number, email) VALUES ('Grace', 'Miller', '555-0117', 'grace.miller@example.com');
INSERT INTO customers (first_name, last_name, phone_number, email) VALUES ('Frank', 'Garcia', '555-0118', 'frank.garcia@example.com');
INSERT INTO customers (first_name, last_name, phone_number, email) VALUES ('Henry', 'Davis', '555-0119', 'henry.davis@example.com');

-- Tables
INSERT INTO tables (table_number, capacity, status) VALUES (1, 4, 'available');
INSERT INTO tables (table_number, capacity, status) VALUES (2, 2, 'available');
INSERT INTO tables (table_number, capacity, status) VALUES (3, 6, 'available');
INSERT INTO tables (table_number, capacity, status) VALUES (4, 2, 'available');
INSERT INTO tables (table_number, capacity, status) VALUES (5, 6, 'available');
INSERT INTO tables (table_number, capacity, status) VALUES (6, 4, 'available');
INSERT INTO tables (table_number, capacity, status) VALUES (7, 6, 'available');
INSERT INTO tables (table_number, capacity, status) VALUES (8, 6, 'available');
INSERT INTO tables (table_number, capacity, status) VALUES (9, 2, 'available');
INSERT INTO tables (table_number, capacity, status) VALUES (10, 6, 'available');

-- Menu Items
INSERT INTO menu_items (name, category, price) VALUES ('Caesar Salad', 'Appetizer', 8.99);
INSERT INTO menu_items (name, category, price) VALUES ('Margherita Pizza', 'Main', 14.99);
INSERT INTO menu_items (name, category, price) VALUES ('Grilled Salmon', 'Main', 22.5);
INSERT INTO menu_items (name, category, price) VALUES ('Chocolate Lava Cake', 'Dessert', 7.5);
INSERT INTO menu_items (name, category, price) VALUES ('Cappuccino', 'Drink', 4.25);
INSERT INTO menu_items (name, category, price) VALUES ('Spaghetti Carbonara', 'Main', 16.99);
INSERT INTO menu_items (name, category, price) VALUES ('Garlic Bread', 'Appetizer', 5.25);
INSERT INTO menu_items (name, category, price) VALUES ('Tiramisu', 'Dessert', 8.75);
INSERT INTO menu_items (name, category, price) VALUES ('Iced Tea', 'Drink', 3.5);
INSERT INTO menu_items (name, category, price) VALUES ('Beef Burger', 'Main', 18.25);

-- Staff
INSERT INTO staff (first_name, last_name, role, hourly_rate) VALUES ('Alice', 'Smith', 'Waiter', 20.0);
INSERT INTO staff (first_name, last_name, role, hourly_rate) VALUES ('Bob', 'Johnson', 'Waiter', 20.0);
INSERT INTO staff (first_name, last_name, role, hourly_rate) VALUES ('Clara', 'Brown', 'Waiter', 20.0);
INSERT INTO staff (first_name, last_name, role, hourly_rate) VALUES ('David', 'Williams', 'Waiter', 20.0);
INSERT INTO staff (first_name, last_name, role, hourly_rate) VALUES ('Emma', 'Jones', 'Chef', 28.0);
INSERT INTO staff (first_name, last_name, role, hourly_rate) VALUES ('Frank', 'Garcia', 'Cleaner', 16.0);
INSERT INTO staff (first_name, last_name, role, hourly_rate) VALUES ('Grace', 'Miller', 'Manager', 35.0);
INSERT INTO staff (first_name, last_name, role, hourly_rate) VALUES ('Henry', 'Davis', 'Waiter', 20.0);
INSERT INTO staff (first_name, last_name, role, hourly_rate) VALUES ('Ivy', 'Wilson', 'Manager', 35.0);
INSERT INTO staff (first_name, last_name, role, hourly_rate) VALUES ('Jack', 'Taylor', 'Cleaner', 16.0);

-- Shifts
INSERT INTO shifts (staff_id, shift_date, start_time, end_time) VALUES (1, '2025-10-07', '16:00', '16:00');
INSERT INTO shifts (staff_id, shift_date, start_time, end_time) VALUES (2, '2025-10-07', '16:00', '22:00');
INSERT INTO shifts (staff_id, shift_date, start_time, end_time) VALUES (3, '2025-10-12', '10:00', '20:00');
INSERT INTO shifts (staff_id, shift_date, start_time, end_time) VALUES (4, '2025-10-09', '12:00', '16:00');
INSERT INTO shifts (staff_id, shift_date, start_time, end_time) VALUES (5, '2025-10-07', '12:00', '22:00');
INSERT INTO shifts (staff_id, shift_date, start_time, end_time) VALUES (6, '2025-10-09', '12:00', '16:00');
INSERT INTO shifts (staff_id, shift_date, start_time, end_time) VALUES (7, '2025-10-11', '16:00', '20:00');
INSERT INTO shifts (staff_id, shift_date, start_time, end_time) VALUES (8, '2025-10-10', '16:00', '16:00');
INSERT INTO shifts (staff_id, shift_date, start_time, end_time) VALUES (9, '2025-10-08', '16:00', '22:00');
INSERT INTO shifts (staff_id, shift_date, start_time, end_time) VALUES (10, '2025-10-08', '16:00', '20:00');
