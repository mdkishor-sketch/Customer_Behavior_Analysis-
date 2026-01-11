# Customer Behavior Analysis

## 📊 Project Overview
A comprehensive data science project analyzing customer purchasing behavior using Python, PostgreSQL, and Power BI. This project demonstrates end-to-end data pipeline implementation from raw CSV data to actionable business insights.

## 🎯 Objectives
- Analyze customer purchasing patterns and behavior
- Identify discount rate trends across different product categories
- Extract insights on purchase frequency and customer segmentation
- Build a scalable data pipeline for business intelligence

## 🛠️ Technologies Used
- **Python 3.13**: Data processing and transformation
- **Pandas**: Data manipulation and analysis
- **PostgreSQL**: Database management and storage
- **SQLAlchemy & psycopg2**: Database connectivity
- **Jupyter Notebook**: Interactive development and analysis
- **Power BI**: Data visualization and reporting
- **pgAdmin**: Database administration

## 📁 Project Structure
```
customer-behavior-analysis/
│
├── data/
│   └── Customer_Report.csv          # Raw customer data
│
├── notebooks/
│   └── CUST-Analysis.ipynb          # Jupyter notebook with analysis
│
├── sql/
│   └── queries.sql                  # SQL queries for analysis
│
├── requirements.txt                  # Python dependencies
└── README.md                         # Project documentation
```
DASHBOARD:
<img width="1356" height="736" alt="image" src="https://github.com/user-attachments/assets/d793776f-4048-4bef-9c87-731e38de4fe6" />



## 🚀 Key Features
1. **Data Cleaning & Transformation**
   - Column name standardization (lowercase, underscore formatting)
   - Purchase frequency mapping (Weekly, Fortnightly, Monthly, etc.)
   - Data type optimization

2. **Database Integration**
   - Automated ETL pipeline from CSV to PostgreSQL
   - Efficient data storage and retrieval
   - Scalable architecture for large datasets

3. **Business Analytics**
   - Revenue analysis by gender and demographics
   - Discount rate analysis by product category
   - Purchase frequency patterns
   - Customer segmentation insights

## 📈 Sample Insights
- Top 5 products with highest discount rates
- Revenue distribution across customer segments
- Purchase frequency patterns by customer type
- Seasonal purchasing trends

## 🔧 Setup Instructions

### Prerequisites
```bash
Python 3.13+
PostgreSQL 12+
Anaconda (recommended)
```

### Installation
1. Clone the repository
```bash
git clone https://github.com/yourusername/customer-behavior-analysis.git
cd customer-behavior-analysis
```

2. Install dependencies
```bash
pip install -r requirements.txt
```

3. Set up PostgreSQL database
```sql
CREATE DATABASE cust_behavior;
```

4. Update database credentials in the notebook
```python
username = "postgres"
password = "your_password"
host = "localhost"
port = "5432"
database = "cust_behavior"
```

5. Run the Jupyter notebook
```bash
jupyter notebook notebooks/CUST-Analysis.ipynb
```

## 📊 Sample Queries

### Revenue by Gender
```sql
SELECT gender, SUM(purchase_amount) AS revenue
FROM "Customer"
GROUP BY gender;
```

### Top Discounted Products
```sql
SELECT item_purchased,
       ROUND(100 * SUM(CASE WHEN discount_applied = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS discount_rate
FROM "Customer"
GROUP BY item_purchased
ORDER BY discount_rate DESC
LIMIT 5;
```

## 🎓 Learning Outcomes
- ETL pipeline development
- Database design and optimization
- SQL query optimization
- Data visualization best practices
- Business intelligence reporting

## 📝 Future Enhancements
- [ ] Add machine learning models for customer churn prediction
- [ ] Implement real-time data streaming
- [ ] Create interactive dashboards with Plotly/Dash
- [ ] Add customer lifetime value (CLV) calculations
- [ ] Integrate with cloud services (AWS/Azure)

## 🤝 Contributing
Contributions are welcome! Please feel free to submit a Pull Request.

## 📄 License
This project is licensed under the MIT License - see the LICENSE file for details.





