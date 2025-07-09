# 🛍️ Olist eCommerce SQL + Power BI Portfolio Project

This portfolio project explores the Brazilian Olist eCommerce public dataset using **SQL** for data extraction and **Power BI** for business insights visualization. It demonstrates key competencies in data cleaning, querying, KPI creation, and dashboard building.

---

## 📂 Dataset Overview

- Source: [Olist eCommerce Public Dataset on Kaggle](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce)
- Tables used: `orders`, `order_items`, `customers`, `products`, `sellers`, `order_payments`, `order_reviews`, `product_category_name_translation`
- Tooling: PostgreSQL (via pgAdmin), Power BI

---

## 🧪 SQL Analysis Topics

🗂️ **Part 1–6: Table-Level Analysis**
- Orders: total count, monthly trends, delivery time
- Order Items: revenue, freight, product performance
- Customers: unique users, top states/cities
- Products: category counts, average dimensions
- Sellers: location distribution
- Payments & Reviews: payment method trends, scores, longest reviews

🔗 **Part 7: Business Insight Queries**
- Top 10 revenue-generating categories
- Review count per category
- Average delivery days by category
- Retention rate & average days between purchases

👉 All queries are stored in: `Olist_SQL_Portfolio_Project.sql`

---

## 📈 Power BI Dashboard

This Power BI dashboard was built on the SQL results. It includes two pages covering:

### 📄 Page 1 – Sales & Fulfillment Overview
- Total / Delivered / Canceled Orders
- Repeat Customers & Retention Rate
- Top States by Delivered Orders
- Top Product Categories by Revenue
- Avg Freight vs Avg Delivery Time
- Avg Days Between Purchases

### 📄 Page 2 – Customer, Review & Payment Insights
- Customer distribution by state
- One-time vs Repeat buyers (%)
- Review Score Distribution & Average
- Payment method breakdown (volume, value, installments)

## 🧠 Business Insights Uncovered

- 📦 **Top Product Categories**:  
  - *"health_beauty"*, *"watch_gifts"*, and *"bed_bath_table"* generated the highest total revenue.

- 🚚 **Delivery Performance**:  
  - **Average delivery time** across all orders: **12.65 days**  
  - *"office_furniture"* had the **longest average delivery time** at **20.79 days**

- 🌍 **Regional Analysis**:  
  - Most delivered orders came from **São Paulo (SP)** and **Rio de Janeiro (RJ)** states

- 🔁 **Customer Retention**:  
  - **3.12%** of customers placed more than one order  
  - **Repeat customers**: 2,997 out of ~96,000 unique customers

- ⏱ **Average Time Between Purchases**:  
  - Customers waited on average **77.86 days** between orders

- 💳 **Payment Insights**:  
  - **Credit card** was the most popular method  
  - It also contributed the highest total transaction value

📷 **Preview:**

### 📊 Power BI Dashboard – Page 1: Sales & Fulfillment
![Page 1 Dashboard](./Page%201.png)

### 👥 Page 2: Customer & Review Analysis
![Page 2 Dashboard](./Page%202.png)

---

## 💡 Skills Demonstrated

- Complex SQL: `JOIN`, `CTE`, `LAG()`, `EXTRACT()`, aggregation, filtering
- Power BI: card KPIs, bar/column charts, dual-axis visuals
- DAX: calculated columns & measures (e.g., delivery days, repeat rate)
- Data storytelling & business insight communication

## ▶️ How to Run This Project

1. Import the Olist eCommerce CSVs into PostgreSQL using pgAdmin
2. Run `SQL_queries.sql` step by step to explore each business question and generate insights

> ⚠️ Power BI `.pbix` file is not included in this repository due to file size limits.
> Please refer to the screenshots above for a preview of the final dashboard layout and insights.

---

## 📬 Contact

Feel free to connect with me on [LinkedIn](www.linkedin.com/in/charlotte-fong-95799a1b1) or hoisumfong@gmail.com  
Portfolio powered by SQL + Power BI 🚀
