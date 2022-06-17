--Exploring Data

--Task 1 | Viewing the total size of the table (excluding indexes)
SELECT pg_size_pretty(pg_indexes_size('sensors.observations')) as table_size;

--Task 2 | Checking the size of the indexes
SELECT pg_size_pretty(pg_indexes_size('sensors.observations')) as idx_size;

 --Task 3 | Querying for the size of the table's data, indexes and total relation
SELECT pg_size_pretty(pg_table_size('sensors.observations')) as tbl_size, 
    pg_size_pretty(pg_indexes_size('sensors.observations')) as idx_size,
    pg_size_pretty(pg_total_relation_size('sensors.observations')) as total_size;  

--Task 4 | Updating the sensors.observations table
UPDATE sensors.observations 
SET distance  = (distance * 3.281) 
WHERE TRUE;

--Task 5 | Querying for the size of the table's data, indexes and total relation.
SELECT 
    pg_size_pretty(pg_table_size('sensors.observations')) as tbl_size, 
    pg_size_pretty(pg_indexes_size('sensors.observations')) as idx_size,
    pg_size_pretty(pg_total_relation_size('sensors.observations')) as total_size;

--Task 6 | Running a vacuum and checking table size
VACUUM sensors.observations;
SELECT pg_size_pretty(pg_table_size('sensors.observations')) as tbl_size;

--Task 7 | Adding data to the table
\COPY sensors.observations (id, datetime, location_id, duration, distance, category) 
FROM './additional_obs_types.csv' WITH DELIMITER ',' CSV HEADER;

--Task 8 | Querying the table size of our table
SELECT pg_size_pretty(pg_table_size('sensors.observations')) as total_size;

--Task 9 | Performing a vaccuum full operation and checking table size after that
VACUUM FULL sensors.observations;
 
SELECT pg_size_pretty(pg_table_size('sensors.observations')) as table_size;

--Task 10 | Performing a deletion
DELETE FROM sensors.observations 
WHERE location_id > 24;

--Task 11 | Checking table size after the deletion
SELECT pg_size_pretty(pg_table_size('sensors.observations')) as table_size;

--Task 12 | Perform a Truncate operation on our table
TRUNCATE sensors.observations;

--Task 13 | Inserting data into the table
\COPY sensors.observations (id, datetime, location_id, duration,distance, category) 
FROM './original_obs_types.csv' WITH DELIMITER ',' CSV HEADER;

--Task 14 | Querying for the size of the table's data, indexes and total relation.
SELECT 
    pg_size_pretty(pg_table_size('sensors.observations')) as tbl_size, 
    pg_size_pretty(pg_indexes_size('sensors.observations')) as idx_size,
    pg_size_pretty(pg_total_relation_size('sensors.observations')) as total_size;









