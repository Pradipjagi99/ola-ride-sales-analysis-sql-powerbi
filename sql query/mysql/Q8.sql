-- 8. Find the average customer rating per vehicle type?
SELECT 
    Vehicle_Type,
    ROUND(AVG(Customer_Rating), 2) AS avg_cus_rating
FROM
    ola_bookings
GROUP BY Vehicle_Type
ORDER BY avg_cus_rating DESC;