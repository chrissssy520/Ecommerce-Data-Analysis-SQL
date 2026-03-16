# 🛒 Philippine E-Commerce Data Analysis (SQL)

A SQL-based data analysis project exploring sales performance, product trends, customer geography, and payment behavior from a simulated Philippine e-commerce dataset for the year **2024**.

---

## 📁 Project Structure

```
├── ph_ecommerce_dataset.csv       # Raw dataset (160 transactions)
└── Ecommerce_Data_Analysis2.sql   # SQL queries for all analyses
```

---

## 📊 Dataset Overview

| Column | Description |
|---|---|
| `order_id` | Unique identifier for each order |
| `order_date` | Date the order was placed (2024) |
| `customer_city` | City where the customer is located |
| `product_name` | Name of the product purchased |
| `category` | Product category (Electronics, Accessories, Home) |
| `quantity` | Number of units ordered |
| `price_php` | Unit price in Philippine Peso (₱) |
| `total_amount_php` | Total revenue for the order (₱) |
| `payment_method` | Payment method used (GCash, Credit Card, COD, etc.) |

**Cities covered:** Manila, Cebu City, Davao City, Quezon City, Makati, Taguig, Pasig, Iloilo City, Baguio, Caloocan

**Products:** Mechanical Keyboard, Bluetooth Earbuds, Gaming Headset, LED Ring Light, Laptop Stand, Power Bank 20000mAh, Wireless Mouse, Portable Fan, Phone Case, USB-C Cable

---

## 🔍 Analysis Performed

### 1. KPI — Total Profit
Calculates the overall revenue generated across all 160 transactions.

### 2. Top 3 Most Sold Products
Uses `DENSE_RANK()` window function to identify the three products with the highest total units sold.

### 3. Top 3 Most Profitable Products
Ranks products by total revenue using `DENSE_RANK()` over summed `total_amount_php`.

### 4. Top 3 Least Profitable Products
Identifies the lowest-earning products using `ORDER BY ... ASC LIMIT 3`.

### 5. Running Total Profit Per Month (2024)
Computes a cumulative monthly profit using `SUM() OVER(PARTITION BY ...)` window function.

### 6. Total Profit & Units Sold by Category
Aggregates sales performance across Electronics, Accessories, and Home categories.

### 7. Top 3 Most Profitable Cities
Uses `RANK()` window function to surface the cities generating the most revenue.

### 8. Payment Method Breakdown
Counts transaction volume per payment method (GCash, Credit Card, Cash on Delivery, Maya, Debit Card).

### 9. Most Profitable Month
Identifies the single highest-revenue month in 2024.

---

## 🛠️ Tools & Concepts Used

- **MySQL** — Primary database and query engine
- **Window Functions** — `DENSE_RANK()`, `RANK()`, `SUM() OVER()`
- **CTEs** — Common Table Expressions (`WITH ... AS`) for clean, readable queries
- **Aggregate Functions** — `SUM()`, `COUNT()`, `MONTH()`, `YEAR()`, `MONTHNAME()`
- **Filtering & Sorting** — `WHERE`, `ORDER BY`, `LIMIT`, `GROUP BY`

---

## ▶️ How to Run

1. Import the dataset into your MySQL database:
   ```sql
   -- Create the table and import ph_ecommerce_dataset.csv
   LOAD DATA INFILE 'ph_ecommerce_dataset.csv'
   INTO TABLE ecommerce
   FIELDS TERMINATED BY ','
   ENCLOSED BY '"'
   LINES TERMINATED BY '\n'
   IGNORE 1 ROWS;
   ```

2. Open `Ecommerce_Data_Analysis2.sql` in MySQL Workbench (or any MySQL client).

3. Run each query block individually or all at once.

---

## 👤 Author

**Christian Kho Aler**

---

## 📌 Notes

- All monetary values are in **Philippine Peso (₱)**.
- Dataset covers the full calendar year **2024** (January–December).
- This is a simulated dataset created for portfolio and learning purposes.
