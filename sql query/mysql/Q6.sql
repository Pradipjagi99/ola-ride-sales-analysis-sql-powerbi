-- 6. Find the maximum and minimum driver ratings for Prime Sedan bookings?
SELECT 
    Vehicle_Type,
    MAX(Driver_Ratings) AS max_rating,
    MIN(Driver_Ratings) AS min_rating
FROM
    ola_bookings
WHERE
    Vehicle_Type = 'Prime Sedan';
