UPDATE tarif
SET prix = 
    CASE 
        WHEN Prix = 9.20 THEN 8.50
        WHEN Prix = 7.60 THEN 6.80
        WHEN Prix = 5.90 THEN 5.00
    END
WHERE Prix IN (9.20, 7.60, 5.90);


