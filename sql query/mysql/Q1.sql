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