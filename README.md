# 🛒 E-Commerce Sales Analytics

## 📌 Project Overview

An end-to-end **E-Commerce Data Analytics project** built using **Python, MySQL, and Power BI**.

The project analyzes customer, product, and order data to understand sales performance, profitability, product performance, customer segments, and regional trends.

The project demonstrates a complete Data Analyst workflow:

**Data Generation → Data Exploration → Data Quality Checks → SQL Analysis → Power BI Dashboard**

---

## 🛠️ Tools & Technologies

* **Python** — Data generation, exploration, and data-quality checks
* **Pandas** — Data manipulation and analysis
* **NumPy** — Numerical operations
* **MySQL 5.7** — Database management and SQL analysis
* **Power BI** — Interactive dashboards and data visualization
* **DAX** — KPI calculations and time-based analysis
* **Git & GitHub** — Version control and project sharing

---

## 📊 Dataset

The project contains three datasets:

| Dataset         | Description                                             |
| --------------- | ------------------------------------------------------- |
| `customers.csv` | Customer information and segmentation                   |
| `products.csv`  | Product, category, brand, and pricing information       |
| `orders.csv`    | Order transactions, sales, costs, discounts, and profit |

### Main Tables

```text
Customers
Products
Orders
```

The tables are connected using:

```text
Customers
    │
    │ Customer_ID
    ▼
 Orders
    ▲
    │ Product_ID
    │
 Products
```

---

## 🐍 Python Analysis

Python was used as the first stage of the analytics workflow.

### Activities performed

* Generated realistic e-commerce datasets
* Explored the datasets using Pandas
* Checked dataset dimensions and data types
* Checked for missing values
* Checked for duplicate records
* Reviewed numerical statistics
* Performed basic data-quality checks
* Exported datasets to CSV files

### Python Notebook

```text
python/data_generation.ipynb
```

---

## 🗄️ SQL Analysis

The datasets were imported into **MySQL 5.7** for business analysis.

### SQL techniques used

* `SELECT`
* `WHERE`
* `GROUP BY`
* `HAVING`
* `ORDER BY`
* `COUNT`
* `SUM`
* `AVG`
* `DISTINCT`
* `JOIN`
* `LIMIT`
* Date functions
* Aggregations

### Business questions analyzed

1. What is the total revenue?
2. What is the total profit?
3. How many orders were placed?
4. What is the average order value?
5. Which product categories generate the most revenue?
6. Which regions generate the most revenue?
7. Which categories generate the most profit?
8. What are the top 10 products by revenue?
9. How does revenue change monthly?
10. Who are the top customers by revenue?
11. Which customer segment generates the most revenue?
12. Which customers place more than five orders?
13. Which products generate more than ₹100,000 in revenue?

### SQL File

```text
sql/ecommerce_analysis.sql
```

---

## 📈 Power BI Dashboard

The Power BI report contains **two dashboard pages**.

### 1. Executive Overview

The dashboard includes:

* Total Revenue
* Total Profit
* Total Orders
* Total Customers
* Average Order Value
* Profit Margin
* YoY Revenue Growth
* Monthly Revenue Trend
* Revenue by Category
* Revenue by Region
* Interactive slicers

### 2. Customer & Product Analysis

The dashboard includes:

* Top 10 Products by Revenue
* Revenue by Customer Segment
* Customers by Region
* Revenue by Brand
* Customer-level revenue and profit analysis
* Interactive filters

---

## 📐 Power BI Data Model

A relational model was created between the three main tables.

```text
                  DateTable
                     │
                     │
                     ▼
Customers (1) ─── (*) Orders (*) ─── (1) Products
```

A dedicated **Date Table** was also created for time-based analysis.

The Date Table contains:

* Date
* Year
* Quarter
* Quarter Number
* Month
* Month Number

---

## 📊 DAX Measures

The following DAX measures were created:

```DAX
Total Revenue =
SUM(Orders[Sales])
```

```DAX
Total Profit =
SUM(Orders[Profit])
```

```DAX
Total Orders =
DISTINCTCOUNT(Orders[Order_ID])
```

```DAX
Total Customers =
DISTINCTCOUNT(Orders[Customer_ID])
```

```DAX
Average Order Value =
DIVIDE(
    [Total Revenue],
    [Total Orders]
)
```

```DAX
Profit Margin =
DIVIDE(
    [Total Profit],
    [Total Revenue]
)
```

```DAX
Previous Year Revenue =
CALCULATE(
    [Total Revenue],
    SAMEPERIODLASTYEAR(DateTable[Date])
)
```

```DAX
YoY Revenue Growth =
DIVIDE(
    [Total Revenue] - [Previous Year Revenue],
    [Previous Year Revenue]
)
```

---

## 📁 Project Structure

```text
ecommerce-data-analytics/
│
├── data/
│   ├── customers.csv
│   ├── products.csv
│   └── orders.csv
│
├── python/
│   └── data_generation.ipynb
│
├── sql/
│   └── ecommerce_analysis.sql
│
├── powerbi/
│   └── ecommerce_sales_dashboard.pbix
│
└── README.md
```

---

## 🎯 Project Objective

The objective of this project is to demonstrate an end-to-end **Data Analyst workflow** using multiple industry-relevant tools.

The project covers the complete process from:

**Data → Analysis → Database → Visualization → Reporting**

It demonstrates practical experience with:

* Python
* SQL
* Data cleaning
* Data exploration
* Relational data modeling
* DAX
* Power BI
* Business-oriented data analysis

---

## 🚀 Future Improvements

Potential future improvements include:

* Customer retention analysis
* Customer lifetime value analysis
* Advanced customer segmentation
* Product profitability analysis
* Discount impact analysis
* Sales forecasting
* Additional time-series analysis
* Automated data refresh
* Advanced business recommendations

---

## 👨‍💻 Skills Demonstrated

**Python | Pandas | NumPy | SQL | MySQL | Power BI | DAX | Data Analysis | Data Visualization | Data Modeling | Git | GitHub**
