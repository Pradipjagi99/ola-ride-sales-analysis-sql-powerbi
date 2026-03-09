-- 9. Calculate the total booking value of rides completed successfully?
SELECT 
    SUM(Booking_Value) AS total_booking_value
FROM
    ola_bookings
WHERE
    Booking_Status = 'Success'; 