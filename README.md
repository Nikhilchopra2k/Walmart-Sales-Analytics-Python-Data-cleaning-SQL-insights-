# Walmart-Sales-Analytics-Python-Data-cleaning-SQL-insights-
Built an ETL pipeline for Walmart sales data, using Python (data cleaning) and SQL (exploration &amp; KPI extraction) to deliver business intelligence insights on revenue trends, branch performance, and customer behavior.
# Project Overview
This project demonstrates an end-to-end data analytics workflow, where raw Walmart sales data is cleaned and preprocessed using Python, then explored with SQL to uncover meaningful business insights.
The workflow follows an ETL pipeline approach:
# 1. Set Up the Environment
   Goal: Create a structured workspace within VS Code and organize project folders for smooth development and data handling.
   
# 2. Set Up Kaggle API
  API Setup: Obtain your Kaggle API token from Kaggle by navigating to your profile settings and downloading the JSON file.
  Configure Kaggle:
  
  Place the downloaded kaggle.json file in your local .kaggle folder.
  
  Use the command kaggle datasets download -d <dataset-path> to pull datasets directly into your project.
  
# 3. Download Walmart Sales Data
  Data Source: Use the Kaggle API to download the Walmart sales datasets from Kaggle.
  
  Storage: Save the data in the data/ folder for easy reference and access.
  
# 4. Install Required Libraries and Load Data

  Libraries: Install necessary Python libraries using:
  
  pip install pandas numpy sqlalchemy mysql-connector-python 
  
  Loading Data: Read the data into a Pandas DataFrame for initial analysis and transformations.
  
# 5. Explore the Data
  Goal: Conduct an initial data exploration to understand data distribution, check column names, types, and identify potential issues.
  
  Analysis: Use functions like .info(), .describe(), and .head() to get a quick overview of the data structure .

# 6. Data Cleaning
  Remove Duplicates: Identify and remove duplicate entries to avoid skewed results.
  
  Handle Missing Values: Drop rows or columns with missing values if they are insignificant; fill values where essential.
  
  Fix Data Types: Ensure all columns have consistent data types (e.g., dates as datetime, prices as float).
  
  Currency Formatting: Use .replace() to handle and format currency values for analysis.
  
  Validation: Check for any remaining inconsistencies and verify the cleaned data.
  
# 7. Feature Engineering
  Create New Columns: Calculate the Total Amount for each transaction by multiplying unit_price by quantity and adding this as a new column.
  
  Enhance Dataset: Adding this calculated field will streamline further SQL analysis and aggregation tasks.
  
# 8. Load Data into MySQL and PostgreSQL
  Set Up Connections: Connect to MySQL and PostgreSQL using sqlalchemy and load the cleaned data into each database.
  
  Table Creation: Set up tables in both MySQL and PostgreSQL using Python SQLAlchemy to automate table creation and data insertion.
  
  Verification: Run initial SQL queries to confirm that the data has been loaded accurately.

# 9. SQL Analysis: Complex Queries and Business Problem Solving

  Business Problem-Solving: Write and execute complex SQL queries to answer critical business questions, such as:
  
  Revenue trends across branches and categories.
  
  Identifying best-selling product categories.
  
  Sales performance by time, city, and payment method.
  
  Analyzing peak sales periods and customer buying patterns.
  
  Profit margin analysis by branch and category.



# Tech Stack

Kaggle API (Python) - Extract raw Walmart dataset programmatically using authenticated access 

Python (Pandas, NumPy) -	Clean and preprocess raw data: impute missing values, validate data types

SQLAlchemy -	Bridge Python and MySQL—handles database connection, schema setup, and query execution 

PyMySQL -	MySQL driver used by SQLAlchemy for connecting to MySQL instances 

MySQL / SQL scripts -	Analyze cleaned data using SQL queries (aggregations, window functions, trends), format dates

# Key Insights

- credit card is mostly used payment method having 4256 number of payments
- Each branch has high avg rating category like 001 have electronics acessories
- Each branch has busiest day like 001 has thursday with 16 transactions
- Five branches have revenue decrease ratio
- WALM045	63
- 
  WALM047	59
  
  WALM098	58
  
  WALM033	56
  
  WALM081	51

# Project Structure

|-- data/                     # Raw data and transformed data

|-- sql_queries/              # SQL scripts for analysis and queries

|-- notebooks/                # Jupyter notebooks for Python analysis

|-- README.md                 # Project documentation

|-- main.py                   # Main script for loading, cleaning, and processing data

