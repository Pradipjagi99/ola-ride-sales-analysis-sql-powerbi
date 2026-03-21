-- 3. Get the total number of cancelled rides by customers?
SELECT 
    COUNT(*) as cancelled_rides_by_customers
FROM
    ola_bookings
WHERE
    Booking_Status = 'Canceled by Customer';
