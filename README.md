
# 🍽 PostgreSQL Restaurant Management System

## 📘 Overview
This project is a **PostgreSQL-based Restaurant Management System** that demonstrates real-world database design, query development, and data management for a restaurant business.  
It includes tables for managing **customers, staff, menu items, orders, reservations, and shifts**.

---

## 🗂 Features
- **Customer Management** – store customer contact details  
- **Table Management** – track seating capacity and status (available/occupied/reserved)  
- **Reservations** – create and manage upcoming bookings  
- **Order Taking** – log orders, link them to customers and tables, and calculate totals  
- **Staff Scheduling** – assign shifts, roles, and pay rates  
- **Reporting** – generate insights such as daily revenue, popular items, and staff hours

---

## 🧱 Database Schema
Main tables include:

| Table | Description |
|--------|-------------|
| `customers` | Customer profiles |
| `tables` | Physical tables in the restaurant |
| `reservations` | Table reservations |
| `menu_items` | Food and drink menu items |
| `orders` | Customer orders |
| `order_items` | Items within each order |
| `staff` | Restaurant employees |
| `shifts` | Staff schedules |

---

## ⚙️ Setup Instructions
1. Clone this repository or download the `.sql` file.
2. Open PostgreSQL or pgAdmin.
3. Run the SQL script to create tables and populate sample data:
   ```bash
   \i restaurant_management_system.sql
   ```
4. Explore the database using SQL queries.

---

## 💡 Example Queries

### 1. View Available Tables
```sql
SELECT table_number, capacity FROM tables WHERE status = 'available';
```

### 2. View Upcoming Reservations
```sql
SELECT c.first_name || ' ' || c.last_name AS customer, t.table_number, r.reservation_time
FROM reservations r
JOIN customers c ON r.customer_id = c.customer_id
JOIN tables t ON r.table_id = t.table_id
WHERE r.reservation_time > NOW()
ORDER BY r.reservation_time;
```

### 3. Find Most Popular Menu Items
```sql
SELECT m.name, SUM(oi.quantity) AS total_sold
FROM order_items oi
JOIN menu_items m ON oi.item_id = m.item_id
GROUP BY m.name
ORDER BY total_sold DESC
LIMIT 5;
```

---

## 🧑‍💻 Skills Demonstrated
- Relational database design
- SQL joins, subqueries, and aggregate functions
- Schema normalization
- Data modeling for real-world operations
- Query optimization for performance

---

## 🚀 How to Showcase on LinkedIn
Post about your project with something like:

> 🎉 I built a **Restaurant Management System** using PostgreSQL!  
> It handles reservations, staff scheduling, and order management — with realistic data and advanced SQL queries.  
> Skills: SQL, database design, query optimization, and data analysis.  
>  
> 💾 GitHub Repo: [your link here]

---

## 🏁 License
MIT License – free to use and modify.
