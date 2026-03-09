-- 7. Retrieve all rides where payment was made using UPI?
SELECT 
    *
FROM
    ola_bookings
WHERE
    Payment_Method = 'UPI';