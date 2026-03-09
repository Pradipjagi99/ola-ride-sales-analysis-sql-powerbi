-- 4. List the top 5 customers who booked the highest number of rides?
SELECT 
    Customer_ID, COUNT(Booking_ID) AS rides
FROM
    ola_bookings
GROUP BY Customer_ID
ORDER BY rides DESC
LIMIT 5;