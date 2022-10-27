--CREATE VIEW [dbo].[answer]
--AS
SELECT 
	vendor_id,
	total_amount,
	tip_amount,
	passenger_count,
	trip_distance,
	pickup_datetime,
	dropoff_datetime,
	payment_type,
	pickup_latitude,
	pickup_longitude,
	dropoff_latitude,
	dropoff_longitude,
	CASE
		WHEN day_of_week = 1 THEN 'Domingo'
		WHEN day_of_week = 2 THEN 'Segunda-feira'
		WHEN day_of_week = 3 THEN 'Terca-feira'
		WHEN day_of_week = 4 THEN 'Quarta-feira'
		WHEN day_of_week = 5 THEN 'Quinta-feira'
		WHEN day_of_week = 6 THEN 'Sexta-feira'
		WHEN day_of_week = 7 THEN 'Sabado'
		ELSE day_of_week
		END AS day_of_week
FROM
	(SELECT
		*,
		CAST(DATEPART(WEEKDAY, CAST(pickup_datetime AS DATE)) AS varchar) day_of_week
	FROM dbo.taxitrips) t1