# 🚖 OLA Data Analyst Project Power BI & SQL

The OLA Data Analyst Project analyzes ride-booking data using SQL and Power BI to track ride volumes, customer behavior, and driver performance. It focuses on booking statuses, revenue breakdowns by payment method, and top customers. SQL queries are used to calculate ride statistics, and the final Power BI dashboard visualizes key data, including ride volumes, vehicle performance, and sales. The analysis helps optimize OLA's services by identifying trends and areas for improvement.

## 🎥 Demo

![Alt Text](https://github.com/Pradipjagi99/ola-ride-sales-analysis-sql-powerbi/blob/main/OLA%20DA%20Project%20Demo.gif)

> [!NOTE]
> Click the dropdown list below for more information on SQL or Power BI.

---

<details>
<summary>SQL 📊</summary>

# 🚖 OLA Data Analyst Project SQL

## 📂 Introduction to the Database

This project involves analyzing ride bookings data for a ride-hailing service, "OLA." The database contains various tables (e.g., `bookings`, `customers`, and `drivers`) that store information about ride bookings, customer ratings, driver ratings, vehicle types, payment methods, and more.

The main objective of this project is to extract meaningful insights and statistics using SQL queries. This document showcases a set of queries to answer specific analytical questions about the business performance and customer behavior.

### 🛠️ How the Database Works

- **📊 Tables**: The database is primarily focused on the `bookings` table, which contains the following key columns:

  - `Booking_ID`: Unique identifier for each ride.
  - `Customer_ID`: ID of the customer who booked the ride.
  - `Vehicle_Type`: Type of vehicle used (e.g., Prime Sedan, Auto, etc.).
  - `Booking_Status`: Status of the ride (e.g., `Success`, `Cancelled by Customer`, etc.).
  - `Ride_Distance`: Distance covered in the ride (in kilometers).
  - `Payment_Method`: Mode of payment used for the ride (e.g., UPI, Card, Cash).
  - `Driver_Ratings`: Ratings provided by customers to the drivers (out of 5).
  - `Customer_Rating`: Ratings provided by drivers to the customers (out of 5).
  - `Booking_Value`: Monetary value of the completed ride.
  - `Incomplete_Rides`: A flag to indicate whether the ride was completed or not.
  - `Incomplete_Rides_Reason`: If the ride was incomplete, this column stores the reason.

- **🔍 Views**: This document includes SQL `CREATE VIEW` statements to predefine specific datasets and make querying simpler for repetitive tasks.

- **📈 Key Insights**: Using SQL, we retrieve data that helps us answer questions such as:
  - The top-performing customers.
  - Average ratings and distances.
  - Trends in cancellations by drivers and customers.
  - The total revenue from successful rides.

---    

## 🏗️ Database Setup

```sql
CREATE DATABASE Ola;
USE Ola;
```

## 📂 Importing Data into MySQL Workbench

To work with the database, we first need to import the data from the `Untitled spreadsheet - July.csv` file into MySQL Workbench. Follow these steps:

1. **Open MySQL Workbench**:

   - Launch MySQL Workbench and connect to your database server.

2. **Select the Database**:

   - Use the `Ola` database by running:
     ```sql
     USE Ola;
     ```

3. **Go to the Import Section**:

   - Click on the "Server" menu and select "Data Import."

4. **Choose the CSV File**:

   - In the "Import" tab, choose the `Untitled spreadsheet - July.csv` file as the source.
   - Ensure the "Import Data from File" option is selected.

5. **Map the Table**:

   - Select the destination table (`ola_bookings`).
   - Map the CSV columns to the corresponding table columns.

6. **Run the Import**:

   - Click on "Start Import."

7. **Verify the Data**:
   - After importing, verify the data using:
     ```sql
     SELECT * FROM ola_bookings LIMIT 10;
     ```

---

## 📜 SQL Queries & Answers

### 1️⃣ Retrieve all successful bookings:

**📝 Query:**

```sql   
CREATE VIEW Successful_Bookings AS
    SELECT * FROM ola_bookings
    WHERE Booking_Status = 'Success';      
    
**📊 Answer:**

```sql
SELECT  * FROM Successful_Bookings;
```

![Description of the screenshot](https://github.com/Pradipjagi99/ola-ride-sales-analysis-sql-powerbi/blob/main/images/Q1.png)

---

### 2️⃣ Find the average ride distance for each vehicle type:

**📝 Query:**

```sql
CREATE VIEW ride_distance_for_each_vehicle AS
SELECT Vehicle_Type, AVG(Ride_Distance) AS avg_distance
FROM bookings
GROUP BY Vehicle_Type;
```

**📊 Answer:**

```sql
SELECT * FROM ride_distance_for_each_vehicle;
```

![Description of the screenshot](https://github.com/Pradipjagi99/ola-ride-sales-analysis-sql-powerbi/blob/main/images/Q2.png)

---

### 3️⃣ Get the total number of cancelled rides by customers:

**📝 Query:**

```sql
SELECT 
    COUNT(*) as cancelled_rides_by_customers
FROM
    ola_bookings
WHERE
    Booking_Status = 'Canceled by Customer';
```

**📊 Answer:**
---

![Description of the screenshot](https://github.com/Pradipjagi99/ola-ride-sales-analysis-sql-powerbi/blob/main/images/Q3.png)

---

### 4️⃣ List the top 5 customers who booked the highest number of rides:

**📝 Query:**

```sql
SELECT 
    Customer_ID, COUNT(Booking_ID) AS rides
FROM
    ola_bookings
GROUP BY Customer_ID
ORDER BY rides DESC
LIMIT 5;
```

**📊 Answer:**
---

![Description of the screenshot](https://github.com/Pradipjagi99/ola-ride-sales-analysis-sql-powerbi/blob/main/images/Q4.png)

---

### 5️⃣ Get the number of rides cancelled by drivers due to personal and car-related issues:

**📝 Query:**

```sql
SELECT 
    COUNT(*) as  Canceled_Rides_by_Driver
FROM
    ola_bookings
WHERE
    Canceled_Rides_by_Driver = 'Personal & Car related issue';
```


**📊 Answer:**
---

![Description of the screenshot](https://github.com/Pradipjagi99/ola-ride-sales-analysis-sql-powerbi/blob/main/images/Q5.png)

---


### 6️⃣ Find the maximum and minimum driver ratings for Prime Sedan bookings:

**📝 Query:**

```sql
SELECT 
    Vehicle_Type,
    MAX(Driver_Ratings) AS max_rating,
    MIN(Driver_Ratings) AS min_rating
FROM
    ola_bookings
WHERE
    Vehicle_Type = 'Prime Sedan';
```

**📊 Answer:**
---

![Description of the screenshot](https://github.com/Pradipjagi99/ola-ride-sales-analysis-sql-powerbi/blob/main/images/Q6.png)

---

### 7️⃣ Retrieve all rides where payment was made using UPI:

**📝 Query:**

```sql
SELECT 
    *
FROM
    ola_bookings
WHERE
    Payment_Method = 'UPI';
```

**📊 Answer:**
---

![Description of the screenshot](https://github.com/Pradipjagi99/ola-ride-sales-analysis-sql-powerbi/blob/main/images/Q7.png)

---

### 8️⃣ Find the average customer rating per vehicle type:

**📝 Query:**

```sql
SELECT 
    Vehicle_Type,
    ROUND(AVG(Customer_Rating), 2) AS avg_cus_rating
FROM
    ola_bookings
GROUP BY Vehicle_Type
ORDER BY avg_cus_rating DESC;
```

**📊 Answer:**
---

![Description of the screenshot](https://github.com/Pradipjagi99/ola-ride-sales-analysis-sql-powerbi/blob/main/images/Q8.png)

---

### 9️⃣ Calculate the total booking value of rides completed successfully:

**📝 Query:**

```sql
SELECT 
    SUM(Booking_Value) AS total_booking_value
FROM
    ola_bookings
WHERE
    Booking_Status = 'Success';
```

**📊 Answer:**
---

![Description of the screenshot](https://github.com/Pradipjagi99/ola-ride-sales-analysis-sql-powerbi/blob/main/images/Q9.png)

---

### 🔟 List all incomplete rides along with the reason:

**📝 Query:**

```sql
ELECT 
    Booking_ID, Incomplete_Rides_Reason
FROM
    ola_bookings
WHERE
    Incomplete_Rides = 'Yes';
```

**📊 Answer:**
---

![Description of the screenshot](https://github.com/Pradipjagi99/ola-ride-sales-analysis-sql-powerbi/blob/main/images/Q10.png)

---

## File Details 📁

- **File Name**: `ola project.sql` [Download File](https://github.com/Pradipjagi99/ola-ride-sales-analysis-sql-powerbi/blob/main/sql%20query/postgresql/ola%20project.sql)
- **Size**: `4 KB`

- **File Name**: `Untitled spreadsheet - July.csv` [Download File](https://github.com/Pradipjagi99/ola-ride-sales-analysis-sql-powerbi/blob/main/Datasets/Untitled%20spreadsheet%20-%20July.csv)
- **Size**: `15.5 MB`

</details>

---

<details>
    <summary>Power BI 📈</summary>

# OLA Data Analysis in Power BI 📊

This Power BI project provides a comprehensive analysis of OLA's operational and customer data, focusing on ride volume, customer ratings, revenue, and performance metrics. The analysis leverages dynamic dashboards, interactive charts, and key performance indicators (KPIs) to identify trends and insights.

## ✨ Key Features

📌 **Ride Volume Analysis**: Tracks ride volume over time, helping to identify peak demand periods.

📌 **Booking Status Breakdown**: Visualizes the proportion of completed, canceled, and pending rides.

📌 **Top 5 Vehicle Types**: Highlights the most popular vehicle types based on ride distance.

📌 **Cancellation Insights**: Analyzes reasons for ride cancellations to improve customer experience.

📌 **Revenue Insights**: Breaks down revenue by payment methods to understand customer preferences.

📌 **Top Customers**: Identifies the top 5 customers based on their total booking value.

📌 **Driver Ratings**: Analyzes driver rating distribution to ensure service quality.

📌 **Customer vs. Driver Ratings**: Compares customer and driver ratings to identify gaps in satisfaction.

---

![App Screenshot](https://github.com/Pradipjagi99/ola-ride-sales-analysis-sql-powerbi/blob/main/images/overall.png)

---

## 🛠️ Tools Used:

**Power BI**: For creating dashboards, visualizations, and interactive reports.

**SQL**: For querying, aggregating, and preparing data for analysis.

**Excel/CSV**: For preprocessing and cleaning raw data.

## 🚀 Steps in Project

✔️ Requirement Gathering / Business Requirements

✔️ Data Extraction

✔️ Data Walkthrough

✔️ Data Cleaning

✔️ Data Modeling

✔️ DAX Calculations

✔️ Dashboard Layout Design

✔️ Chart Development and Formatting

✔️ Dashboard / Report Development

✔️ Insights Generation

✔️ Report Presentation

## 🧑‍💼 Business Requirement

To conduct a comprehensive analysis of OLA's ride data, focusing on key aspects such as ride volume, booking status, and vehicle types. The analysis will also include customer and driver ratings, reasons for canceled rides, and revenue by payment method. Additionally, it will identify the top customers by total booking value and examine the distribution of ride distances per day. The goal is to provide actionable insights that can help optimize OLA's services and improve overall performance.

## 📈 KPI’s Requirements

**1. Total Sales:** The overall revenue generated from all items sold.

**2. Average Sales:** The average revenue per sale.

**3. Number of Items:** The total count of different items sold.

**4. Average Rating:** The average customer rating from items sold.

## 📊 Chart’s Requirements

<ol>  
<h3><li> Overall 📅</li></h3>  
<ul>  
  <li>Ride Volume Over Time: Visualize ride volume trends over time.</li>  
  <li>Booking Status Breakdown: Display the distribution of completed, canceled, and pending bookings.</li>  
  <br>
<div style="display: flex; justify-content: center; align-items: center; gap: 20px;">
   <img src="https://github.com/Pradipjagi99/ola-ride-sales-analysis-sql-powerbi/blob/main/images/overall.png"  />
</div>
</ul>

<h3><li> Vehicle Type 🚗:</li></h3>  
<ul>  
  <li>Top 5 Vehicle Types by Ride Distance: Show the top 5 vehicle types based on ride distance.</li>  
  <br>
<div style="display: flex; justify-content: center; align-items: center; gap: 20px;">
   <img src="https://github.com/Pradipjagi99/ola-ride-sales-analysis-sql-powerbi/blob/main/images/vehicle%20type.png"  />
</div>
</ul>

<h3><li> Revenue 💰:</li></h3>  
<ul>  
  <li>Revenue by Payment Method: Visualize total revenue generated by different payment methods.</li>  
  <li>Top 5 Customers by Total Booking Value: Identify the top 5 customers with the highest total booking value.</li>  
  <li>Ride Distance Distribution Per Day: Display the distribution of ride distances on a daily basis.</li> 
  <br>
<div style="display: flex; justify-content: center; align-items: center; gap: 20px;">
    <img src="https://github.com/Pradipjagi99/ola-ride-sales-analysis-sql-powerbi/blob/main/images/revenue.png"  />
</div> 
</ul>

<h3><li> Cancellation 🚫:</li></h3>  
<ul>  
  <li>Cancelled Rides Reasons (Customer): Show the reasons behind canceled rides by customers.</li>  
  <li>Cancelled Rides Reasons (Driver): Show the reasons behind canceled rides by drivers.</li>  
  <br>
<div style="display: flex; justify-content: center; align-items: center; gap: 20px;">
    <img src="https://github.com/Pradipjagi99/ola-ride-sales-analysis-sql-powerbi/blob/main/images/cancellation.png"  />
</div>
</ul>

<h3><li> Ratings 🌟:</li></h3>  
<ul>  
  <li>Driver Ratings: Display the distribution of ratings given to drivers.</li>  
  <li>Customer Ratings: Display the distribution of ratings given by customers.</li>  
  <br>
<div style="display: flex; justify-content: center; align-items: center; gap: 20px;">
    <img src="https://github.com/Pradipjagi99/ola-ride-sales-analysis-sql-powerbi/blob/main/images/Rating.png"  />
</div>
</ul>
</ol>

## Dashboard Insights

### Key Insights 🔑:

1. **Ride Volume Trends 📉**: Identify peak times and demand fluctuations.
2. **Booking Status Insights 📋**: Understand the distribution of booking statuses.
3. **Vehicle Type Performance 🚗**: Discover the most effective vehicle types.
4. **Revenue Patterns 💸**: Track payment method usage and high-value customers.
5. **Cancellation Analysis 🔄**: Pinpoint reasons for ride cancellations.

### 🎛 Interactive Features:

- Drill-through options to explore details at multiple levels.
- Custom slicers for dynamic filtering.
- KPIs displayed in real-time visuals.

## How to Use 📋

1. Download the Power BI file: `ola project.pbix`
2. Open the file in **Power BI Desktop**.
3. Explore the dashboards and insights interactively.

## File Details 📁

- **File Name**: `ola project.pbix` [Download File](https://github.com/Pradipjagi99/ola-ride-sales-analysis-sql-powerbi/blob/main/power%20bi%20dashboard/ola%20project.pbix)
- **Size**: `4.51 MB`

- **File Name**: `Untitled spreadsheet - July.csv` [Download File](https://github.com/Pradipjagi99/ola-ride-sales-analysis-sql-powerbi/blob/main/Datasets/Untitled%20spreadsheet%20-%20July.csv)
- **Size**: `15.5 MB`

</details>

---

## Contact 📧

For any queries or feedback, feel free to reach out:

- **Name**: Jagi Pradip Rao
- **Email**: pradip.jagi@gmail.com

## 🙌 Acknowledgments

A big shoutout to [Top VarSity](https://www.youtube.com/@TopVarSity) for their helpful tutorial that guided this project. A heartfelt thanks to Top VarSity for sharing valuable insights in their YouTube video tutorial, which can be found [here](https://www.youtube.com/watch?si=29Ikp70AdbmvziIh&v=1uPUyT9LoHQ&feature=youtu.be). Your content played a significant role in shaping the success of this project!

---

## 🔗 Links
 
[![linkedin](https://img.shields.io/badge/linkedin-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/jagipradiprao/)

---











