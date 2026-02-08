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
- [Data Cleaning & Preparation](#data-cleaning--preparation)  
- [Exploratory Data Analysis (EDA)](#exploratory-data-analysis-eda)  
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

## 📊 Exploratory Data Analysis (EDA)

The EDA phase focused on data cleaning and preparing the dataset for analysis.

- Loaded the dataset using pandas and checked column names, data types, and structure  
- Reviewed unique values and summary statistics to understand the data  
- Identified missing values in the **review_rating** column  
- Filled missing **review_rating** values using the median rating of the same product category  
- Renamed all columns to **snake_case** for better consistency and readability  
- Created an **age_group** column by grouping customer ages into ranges  
- Created a **purchase_frequency_days** column based on purchase frequency data  
- Checked the relationship between **discount_applied** and **promo_code_used** columns  
- Removed **promo_code_used** after confirming it provided duplicate information  
- Rechecked the data to ensure values and data types were correct after changes  
- Prepared the cleaned dataset for further analysis and loaded the transformed data into **SQL Server**

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

### **1️⃣ Step 1 — Python (Jupyter Notebook)**  
- Open the notebook in `/notebooks`  
- Run EDA, clean data, create engineered features  
- Export final cleaned dataset  

### **2️⃣ Step 2 — SQL Server**  
- Import cleaned dataset into SQL Server  
- Run analytical queries from `/sql` folder  
- Extract customer segments, revenue summaries, and product insights  

### **3️⃣ Step 3 — Power BI Dashboard**  
- Load SQL output tables  
- Open `/dashboard/customer_behavior_dashboard.pbix`  
- Explore interactive visuals  

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

### **📧 Email**  
📮 **rohit.41.das@gmail.com**  

### **🔗 LinkedIn**  
https://www.linkedin.com/in/rohit-das-jsr/   

---


