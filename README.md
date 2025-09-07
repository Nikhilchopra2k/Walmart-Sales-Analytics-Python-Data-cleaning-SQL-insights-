# Walmart-Sales-Analytics-Python-Data-cleaning-SQL-insights-
Built an ETL pipeline for Walmart sales data, using Python (data cleaning) and SQL (exploration &amp; KPI extraction) to deliver business intelligence insights on revenue trends, branch performance, and customer behavior.
# Project Overview
This project demonstrates an end-to-end data analytics workflow, where raw Walmart sales data is cleaned and preprocessed using Python, then explored with SQL to uncover meaningful business insights.
The workflow follows an ETL pipeline approach:

Extract → Import/Download raw Walmart dataset using kaggle api,unzip dataset into .csv

Transform → Data cleaning, preprocessing, and formatting using Python (Pandas, NumPy)

Load → Load cleaned dataset into MySQL database using pymysql(adapter) and sqlalchemy to create engine

Analyze → Use SQL queries to perform EDA, aggregation, and generate insights and trends
# Tech Stack
Python → Data Cleaning (pandas, numpy)

SQL (MySQL) → Data exploration, window functions, aggregations
