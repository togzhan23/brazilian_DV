# Brazilian E-Commerce Analytics Project

## Project Background
This is a **Data Visualization project** for practicing data analysis with PostgreSQL, Python, and visualization tools. The project is based on the **Brazilian E-commerce (Olist) dataset** and focuses on analyzing users, products, items, orders, and related behavior. 

I am using the **Olist Brazilian E-Commerce dataset** from Kaggle to learn how to:
- Set up a database
- Load CSV datasets into PostgreSQL
- Write and run analytical SQL queries
- Connect Python to PostgreSQL for automation
- Visualize and document results

---

## 📈 Project Overview
This repository contains:
- The **PostgreSQL database** with Olist datasets.
- **SQL queries** for analytical tasks (`queries.sql`).
- A **Python script (`main.py`)** to connect to the database and execute queries.
- An **ERD diagram** and **visualizations** for understanding table relationships.
- Installation and execution instructions for PostgreSQL, pgAdmin, and Python.

---

## Screenshot & **ERD diagram** and **visualizations** for understanding table relationships
<img width="806" height="624" alt="image" src="https://github.com/user-attachments/assets/028955c2-735e-49a0-9881-b6254ff24e10" />




---

## Installation and Setup

### 1. Install Tools
Make sure the following are installed:
- [PostgreSQL](https://www.postgresql.org/download/) (includes **pgAdmin** for GUI)
- [Python 3](https://www.python.org/downloads/)
- [Apache Superset](https://superset.apache.org/) *(optional, for dashboards)*

Install required Python packages:
```bash
pip install psycopg2-binary pandas
``` 

---

## Set up the Databse 
- Open pgAdmin
- Create the databse
```bash
CREATE DATABASE brazilian;
```  

- Create tables (orders, customers, etc.).
- Load CSV data with \copy in psql:
```bash
\copy orders FROM '/path/to/olist_orders_dataset.csv' DELIMITER ',' CSV HEADER;
``` 
(in y case /Users/myuser/Desktop/brazilian_ecommerce/olist_orders_dataset.csv'
DELIMITER ',' CSV HEADER; )
- Repeat for all 9 datasets.

---

## Verify Database Connection

Check in terminal:
```bash
psql -U username -d databse  
\dt   -- list all tables
SELECT * FROM orders LIMIT 10;
``` 
(in my case username - postgres and databse - brazilian)

---

## Run Python Script

Inside the project folder, run:
```bush
python3 main.py
``` 

---

## Tools & Resources

- **Database:** PostgreSQL 17 + pgAdmin 4
- **Programming Language:** Python 3.9+
- **Libraries:** psycopg2, pandas, graphviz
- **Visualization:** Apache Superset (optional), ER diagrams, pgAdmin
- **Dataset:** Olist Brazilian E-Commerce
- **Version Control:** Git & GitHub


 
