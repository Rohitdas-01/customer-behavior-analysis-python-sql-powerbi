# 🛒 Customer Shopping Behavior Analysis  
[![Python](https://img.shields.io/badge/Python-EDA-yellow?logo=python&logoColor=white)]()
[![SQL Server](https://img.shields.io/badge/SQL%20Server-Data%20Analysis-red?logo=microsoftsqlserver&logoColor=white)]()
[![Power BI](https://img.shields.io/badge/Power%20BI-Dashboard-orange?logo=powerbi&logoColor=white)]()
[![GitHub](https://img.shields.io/badge/Repository-Active-brightgreen?logo=github)](https://github.com/Rohitdas-01/customer-behavior-analysis-python-sql-powerbi)

---

## 📌 Table of Contents  
- [Overview](#overview)  
- [Business Problem](#business-problem)  
- [Dataset](#dataset)  
- [Tools & Technologies](#tools--technologies)  
- [Project Structure](#project-structure)   
- [Exploratory Data Analysis (EDA)](#eda-analysis)  
- [Insights From SQL Analysis](#insights-from-sql-analysis)  
- [Dashboard](#dashboard)  
- [How to Run This Project](#how-to-run-this-project)  
- [Future Work](#future-work)  
- [Contact](#contact)

---

## <a id="overview"></a>🧾 Overview  
This project analyzes customer shopping patterns across demographics, product categories, pricing, subscriptions, and purchase behavior. The goal is to help retailers understand what drives purchases, retention, and revenue using Python for EDA, SQL Server for structured analysis, and Power BI for visual insights.

---

## <a id="business-problem"></a>🎯 Business Problem  
A retail company wants to optimize its marketing, engagement, and product strategy by answering:

- What influences customer purchase decisions?  
- Which demographic groups generate the most revenue?  
- What factors drive subscription adoption?  
- How do discounts, seasons, and shipping types affect sales?  
- Which product categories and items perform the best?

The insights enable data-driven decisions to improve customer satisfaction, loyalty, and overall sales.

---

## <a id="dataset"></a>📂 Dataset  
- **Total Records:** 3,900  
- **Total Features:** 18  
- **Missing Values:** **37** in review ratings (imputed)  
- **Key Columns Include:**  
  - Age, gender, location  
  - Purchase amount, discount applied  
  - Previous purchases, frequency  
  - Product category, item name, color, size  
  - Season, shipping type  
  - Subscription status

---

## <a id="tools--technologies"></a>🛠 Tools & Technologies  
| Tool | Usage |
|------|-------|
| 🐍 **Python** | EDA, cleaning, feature engineering |
| 🧮 **SQL Server** | Segmentation, revenue breakdown, product insights |
| 📊 **Power BI** | Interactive dashboard |
| 📓 **Jupyter Notebook** | Exploration environment |
| 🗂 **GitHub** | Version control |

---
<h2><a class="anchor" id="project-structure"></a>Project Structure</h2>

```
customer-behavior-analysis-python-sql-powerbi/
│
├── README.md
├── Business Problem Statement.pdf
├── customer_behavior_report.pdf
│
├── notebooks/ # Jupyter notebooks
│ └── eda_customer_behavior.ipynb
│
├── sql/ # SQL analysis queries
│ └── customer_behavior_queries.sql
│
├── images/ # Dashboard images
│ └── dashboard.png
│
└── dashboard/ # Power BI dashboard file
└── customer_behavior_dashboard.pbix
```

---

## <a id="eda-analysis"></a>📊 Exploratory Data Analysis (EDA)

The EDA phase focused on data cleaning and preparing the dataset for analysis.

- **Data Loading:** Imported the dataset using pandas and reviewed structure, column names, and data types  
- **Initial Review:** Checked unique values and summary statistics to understand the data  
- **Missing Values:** Identified missing entries in the **review_rating** column  
- **Missing Value Handling:** Filled missing **review_rating** values using the median rating of the same product category  
- **Column Naming:** Renamed all columns to **snake_case** for consistency and readability  
- **Age Group Creation:** Grouped customer ages into defined age ranges  
- **Purchase Frequency Feature:** Created a **purchase_frequency_days** column from purchase data  
- **Data Consistency Check:** Verified overlap between **discount_applied** and **promo_code_used**  
- **Column Removal:** Dropped **promo_code_used** after confirming it was redundant  
- **Data Validation:** Rechecked values and data types after transformations  
- **Database Preparation:** Prepared the cleaned data and loaded it into **SQL Server** for analysis

---

## <a id="insights-from-sql-analysis"></a>🧠 Insights From SQL Analysis  

- **Revenue by Gender:** Male customers generate **higher revenue**  
- **High-Spending Discount Users:** Identified customers who used discounts but still spent **above the average**  
- **Top Products by Rating:** Extracted items with **highest mean review scores**  
- **Shipping Type Impact:** Express shipping users spend **more on average**  
- **Subscription Effect:**  
  - Subscribers contribute **higher total revenue**  
  - Higher average purchase value  
- **Discount-Dependent Items:** Identified **5 products** heavily reliant on discounts  
- **Customer Segmentation:** Classified into **New**, **Returning**, and **Loyal** customers  
- **Top 3 Items per Category:** Listed leading products across all categories  
- **Repeat Buyers & Subscriptions:** Customers with **>5 past purchases** are more likely to subscribe  
- **Revenue by Age Group:** Adults and middle-aged users generate the **highest revenue**  

---

### 📈 Power BI Visualization  

<h2><a class="anchor" id="dashboard"></a>Dashboard</h2>

Power BI dashboard shows:

- Total number of customers, average purchase amount, and average review rating  
- Revenue comparison between **subscribers and non-subscribers**  
- Revenue distribution across **product categories**  
- Sales contribution by **gender**  
- Revenue contribution by **age groups**  
- Revenue by **top customer locations**  
- Customer distribution based on **subscription status**  
- Interactive filters for **subscription status, gender, category, and shipping type**

![Customer Behavior Dashboard](https://raw.githubusercontent.com/Rohitdas-01/customer-behavior-analysis-python-sql-powerbi/main/images/dashboard.png)


---

## <a id="how-to-run-this-project"></a>▶️ How to Run This Project  

### Step 1 — Clone the Repository**
```bash
git clone https://github.com/Rohitdas-01/customer-behavior-analysis-python-sql-powerbi.git
```
### Step 2 -Run Exploratory Data Analysis (Python)

Open Jupyter Notebook

-> Navigate to the notebooks/ directory

Open and run:

-> eda_customer_behavior.ipynb

This step includes:

- Data loading and inspection

- Data cleaning and missing value handling

- Feature engineering (age groups, purchase frequency, etc.)

- Export the final cleaned dataset for database ingestion
  
### Step - 3️ Load Data into SQL Server

1. Import the cleaned dataset into SQL Server

2. Open and execute SQL scripts from the sql/ folder:
```bash
sql/customer_behavior_queries.sql
```
This step generates:
- Customer segmentation
- Revenue and sales summaries
- Product and subscription insights

### Step 4 - Open Power BI Dashboard
```bash
dashboard/customer_behavior_dashboard.pbix
```
### Step 5 - Review Project Outputs
- customer_behavior_report.pdf

- images/dashboard.png

---

## <a id="future-work"></a>🔮 Future Work  
The analysis revealed that **female customers are significantly less likely to subscribe**, but the reason is unclear.  
Further investigation is needed to understand:  
- Why female shoppers avoid subscriptions  
- What benefits or incentives might attract them  
- How marketing campaigns can better target female customers  

Addressing this gap can unlock additional revenue and improve subscription adoption.

---

## <a id="contact"></a>📞 Contact  

**<img src="https://upload.wikimedia.org/wikipedia/commons/4/4e/Gmail_Icon.png" width="20px"> Email:**  
rohit.41.das@gmail.com

**<img src="https://cdn-icons-png.flaticon.com/512/174/174857.png" width="20px"> LinkedIn:**  
https://www.linkedin.com/in/rohit-das-jsr/

---


