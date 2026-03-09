-- 10. List all incomplete rides along with the reason? 
SELECT 
    Booking_ID, Incomplete_Rides_Reason
FROM
    ola_bookings
WHERE
    Incomplete_Rides = 'Yes';
