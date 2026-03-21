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
SELECT 
    *
FROM
    ola_bookings
WHERE
    Booking_Status = 'Success';
    
-- we can create a " view " to find directly the successful bookings. so that instead of long query we can find the output in smaller query-- 
-- Created view with name Successful_Bookings -- 
CREATE VIEW Successful_Bookings AS
    SELECT 
        *
    FROM
        ola_bookings
    WHERE
        Booking_Status = 'Success';  
-- output with using view --      
SELECT          
    *
FROM
    Successful_Bookings;     
---

**📊 Answer:**

---sql
SELECT          
    *
FROM
    Successful_Bookings;
---

![Description of the screenshot](https://github.com/Pradipjagi99/ola-ride-sales-analysis-sql-powerbi/blob/main/images/Q1.png)

---

### 2️⃣ Find the average ride distance for each vehicle type:

**📝 Query:**

---sql
SELECT 
    Vehicle_Type,
    ROUND(AVG(Ride_Distance), 2) AS average_ride_distance
FROM
    ola_bookings
GROUP BY Vehicle_Type;
---

**📊 Answer:**
---

![Description of the screenshot](https://github.com/Pradipjagi99/ola-ride-sales-analysis-sql-powerbi/blob/main/images/Q2.png)

---

### 3️⃣ Get the total number of cancelled rides by customers:

**📝 Query:**

---sql
SELECT 
    COUNT(*) as cancelled_rides_by_customers
FROM
    ola_bookings
WHERE
    Booking_Status = 'Canceled by Customer';
---

**📊 Answer:**
---

![Description of the screenshot](https://github.com/Pradipjagi99/ola-ride-sales-analysis-sql-powerbi/blob/main/images/Q3.png)

---

### 4️⃣ List the top 5 customers who booked the highest number of rides:

**📝 Query:**

---sql
SELECT 
    Customer_ID, COUNT(Booking_ID) AS rides
FROM
    ola_bookings
GROUP BY Customer_ID
ORDER BY rides DESC
LIMIT 5;
---

**📊 Answer:**
---

![Description of the screenshot](https://github.com/Pradipjagi99/ola-ride-sales-analysis-sql-powerbi/blob/main/images/Q4.png)

---

### 5️⃣ Get the number of rides cancelled by drivers due to personal and car-related issues:

**📝 Query:**

---sql
SELECT 
    COUNT(*) as  Canceled_Rides_by_Driver
FROM
    ola_bookings
WHERE
    Canceled_Rides_by_Driver = 'Personal & Car related issue';
---


**📊 Answer:**
---

![Description of the screenshot](https://github.com/Pradipjagi99/ola-ride-sales-analysis-sql-powerbi/blob/main/images/Q5.png)

---


### 6️⃣ Find the maximum and minimum driver ratings for Prime Sedan bookings:

**📝 Query:**

---sql
SELECT 
    Vehicle_Type,
    MAX(Driver_Ratings) AS max_rating,
    MIN(Driver_Ratings) AS min_rating
FROM
    ola_bookings
WHERE
    Vehicle_Type = 'Prime Sedan';
---

**📊 Answer:**
---

![Description of the screenshot](https://github.com/Pradipjagi99/ola-ride-sales-analysis-sql-powerbi/blob/main/images/Q6.png)

---

### 7️⃣ Retrieve all rides where payment was made using UPI:

**📝 Query:**

---sql
SELECT 
    *
FROM
    ola_bookings
WHERE
    Payment_Method = 'UPI';
---

**📊 Answer:**
---

![Description of the screenshot](https://github.com/Pradipjagi99/ola-ride-sales-analysis-sql-powerbi/blob/main/images/Q7.png)

---

### 8️⃣ Find the average customer rating per vehicle type:

**📝 Query:**

---sql
SELECT 
    Vehicle_Type,
    ROUND(AVG(Customer_Rating), 2) AS avg_cus_rating
FROM
    ola_bookings
GROUP BY Vehicle_Type
ORDER BY avg_cus_rating DESC;
---

**📊 Answer:**
---

![Description of the screenshot](https://github.com/Pradipjagi99/ola-ride-sales-analysis-sql-powerbi/blob/main/images/Q8.png)

---

### 9️⃣ Calculate the total booking value of rides completed successfully:

**📝 Query:**

---sql
SELECT 
    SUM(Booking_Value) AS total_booking_value
FROM
    ola_bookings
WHERE
    Booking_Status = 'Success';
---

**📊 Answer:**
---

![Description of the screenshot](https://github.com/Pradipjagi99/ola-ride-sales-analysis-sql-powerbi/blob/main/images/Q9.png)

---

### 🔟 List all incomplete rides along with the reason:

**📝 Query:**

---sql
ELECT 
    Booking_ID, Incomplete_Rides_Reason
FROM
    ola_bookings
WHERE
    Incomplete_Rides = 'Yes';
---

**📊 Answer:**
---

![Description of the screenshot](https://github.com/Pradipjagi99/ola-ride-sales-analysis-sql-powerbi/blob/main/images/Q10.png)

---












