-- 3. Get the total number of cancelled rides by customers?
SELECT 
    COUNT(*)
FROM
    ola_bookings
WHERE
    Booking_Status = 'Canceled by Customer';