CREATE TABLE ola_bookings (
      Date                     DATE NOT NULL,
	  Time                     time NOT NULL,
      Booking_ID                VARCHAR(20) ,
      Booking_Status            VARCHAR(30) NOT NULL,
	  Customer_ID		        VARCHAR(20) NOT NULL,
      Vehicle_Type              VARCHAR(30) NOT NULL,
      Pickup_Location           VARCHAR(100) NOT NULL,
      Drop_Location             VARCHAR(100) NOT NULL,
      V_TAT                     varchar(10) ,
      C_TAT                      VARCHAR (10),
      Canceled_Rides_by_Customer TEXT NULL,
      Canceled_Rides_by_Driver  TEXT NULL,
      Incomplete_Rides          VARCHAR(10) NULL,
      Incomplete_Rides_Reason   TEXT NULL,
      Booking_Value             NUMERIC(10,2),
      Payment_Method            VARCHAR(20) NULL,
      Ride_Distance             NUMERIC(6,2),
      Driver_Ratings            NUMERIC(2,1) NULL,
      Customer_Rating           NUMERIC(2,1) NULL,
      Vehicle_Images            TEXT
);



select * from ola_bookings;


-- 1. Retrieve all successful bookings?
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


-- 2. Find the average ride distance for each vehicle type?
SELECT 
    Vehicle_Type, ROUND(AVG(Ride_Distance),2) AS average_ride_distance
FROM
    ola_bookings
GROUP BY Vehicle_Type;
    

-- 3. Get the total number of cancelled rides by customers?
SELECT 
    COUNT(*)
FROM
    ola_bookings
WHERE
    Booking_Status = 'Canceled by Customer';


-- 4. List the top 5 customers who booked the highest number of rides?
SELECT 
    Customer_ID, COUNT(Booking_ID) AS rides
FROM
    ola_bookings
GROUP BY Customer_ID
ORDER BY rides DESC
LIMIT 5;


-- 5. Get the number of rides cancelled by drivers due to personal and car-related issues?
SELECT 
    COUNT(*)
FROM
    ola_bookings
WHERE
    Canceled_Rides_by_Driver = 'Personal & Car related issue';


-- 6. Find the maximum and minimum driver ratings for Prime Sedan bookings?
SELECT 
    Vehicle_Type,
    MAX(Driver_Ratings) AS max_rating,
    MIN(Driver_Ratings) AS min_rating
FROM
    ola_bookings
WHERE
    Vehicle_Type = 'Prime Sedan'
GROUP BY 
    Vehicle_Type;


-- 7. Retrieve all rides where payment was made using UPI?
SELECT 
    *
FROM
    ola_bookings
WHERE
    Payment_Method = 'UPI';



-- 8. Find the average customer rating per vehicle type?
SELECT 
    Vehicle_Type,
    ROUND(AVG(Customer_Rating), 2) AS avg_cus_rating
FROM
    ola_bookings
GROUP BY Vehicle_Type
ORDER BY avg_cus_rating DESC;	


-- 9. Calculate the total booking value of rides completed successfully?
SELECT 
    SUM(Booking_Value) AS total_booking_value
FROM
    ola_bookings
WHERE
    Booking_Status = 'Success'; 


-- 10. List all incomplete rides along with the reason? 
SELECT 
    Booking_ID, Incomplete_Rides_Reason
FROM
    ola_bookings
WHERE
    Incomplete_Rides = 'Yes';
