-- 5. Get the number of rides cancelled by drivers due to personal and car-related issues?
SELECT 
    COUNT(*)
FROM
    ola_bookings
WHERE
    Canceled_Rides_by_Driver = 'Personal & Car related issue';