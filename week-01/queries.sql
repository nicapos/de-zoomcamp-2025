-- During the period of October 1st 2019 (inclusive) and November 1st 2019 (exclusive), how many trips, respectively, happened:
-- Up to 1 mile
SELECT COUNT(*)
FROM yellow_taxi_trips
WHERE
	lpep_dropoff_datetime >= '2019-10-01' AND 
	lpep_dropoff_datetime < '2019-11-01' AND
	trip_distance <= 1;

-- In between 1 (exclusive) and 3 miles (inclusive),
SELECT COUNT(*)
FROM yellow_taxi_trips
WHERE
	lpep_dropoff_datetime >= '2019-10-01' AND 
	lpep_dropoff_datetime < '2019-11-01' AND
	trip_distance > 1 AND
    trip_distance <= 3;

-- Which was the pick up day with the longest trip distance? Use the pick up time for your calculations.
SELECT DATE(lpep_pickup_datetime) AS longest_trip_date
FROM yellow_taxi_trips
ORDER BY trip_distance DESC
LIMIT 1;

-- Which were the top pickup locations with over 13,000 in total_amount (across all trips) for 2019-10-18?
SELECT
	zpu."Zone" AS "pickup_loc",
	SUM(t.total_amount) AS total_amount
FROM 
    yellow_taxi_trips t,
    zones zpu
WHERE
    t."PULocationID" = zpu."LocationID"
	AND DATE(t.lpep_pickup_datetime) = '2019-10-18'
GROUP BY zpu."Zone"
ORDER BY total_amount DESC
LIMIT 3;

-- For the passengers picked up in October 2019 in the zone named "East Harlem North" which was the drop off zone that had the largest tip?
SELECT
    zdo."Zone" AS dropoff_zone
FROM 
    yellow_taxi_trips t,
    zones zpu,
    zones zdo
WHERE
    t."PULocationID" = zpu."LocationID" AND
    t."DOLocationID" = zdo."LocationID" AND
	EXTRACT(YEAR FROM lpep_pickup_datetime) = 2019 AND
    EXTRACT(MONTH FROM lpep_pickup_datetime) = 10 AND
	zpu."Zone" LIKE '%East Harlem North%'
ORDER BY tip_amount DESC
LIMIT 1;