-- 2. Find the average ride distance for each vehicle type?
SELECT 
    Vehicle_Type,
    ROUND(AVG(Ride_Distance), 2) AS average_ride_distance
FROM
    ola_bookings
GROUP BY Vehicle_Type;
    
