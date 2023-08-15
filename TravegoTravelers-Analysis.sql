USE travego;

-- a. How many female passengers traveled a minimum distance of 600 KMs?
SELECT count(gender) AS female_passenger_travelling_min_of_600kms FROM passengers
WHERE gender = 'F' AND distance >= 600;

/* b. Write a query to display the passenger details whose travel distance is greater than 500 and  who are traveling in a
sleeper bus */
SELECT * FROM passengers
WHERE distance >= 500 AND bus_type = 'sleeper';

-- c. Select passenger names whose names start with the character 'S'.
SELECT passenger_name FROM passengers
WHERE passenger_name like 'S%';

/* d. Calculate the price charged for each passenger, displaying the Passenger name, Boarding City, Destination City,
Bus type and Price in the output */
SELECT ps.passenger_name, ps.boarding_city, ps.destination_city, ps.bus_type, pr.price
FROM passengers AS ps LEFT JOIN prices AS pr
ON ps.bus_type = pr.bus_type AND ps.distance = pr.distance;

-- e. What are the passenger name(s) and the ticket price for those who traveled 1000 KMs Sitting in a bus?
SELECT ps.passenger_name, pr.price
FROM passengers AS ps LEFT JOIN prices AS pr
ON ps.bus_type = pr.bus_type AND ps.distance = pr.distance
WHERE ps.distance>=1000 AND ps.bus_type = 'sitting';
# The output here is null as no is travelling 1000 km and more sitting right up 

-- f. What will be the Sitting and Sleeper bus charge for Pallavi to travel from Bangalore to Panaji?
SELECT pr.bus_type, pr.price FROM passengers AS ps LEFT JOIN prices AS pr
ON pr.distance = ps.distance WHERE ps.passenger_name='Pallavi';

-- g. Alter the column category with the value "Non-AC" where the Bus_Type is sleeper.
UPDATE passengers SET category = 'Non-AC' WHERE bus_type = 'Sleeper';

-- h. Delete an entry from the table where the passenger name is Piyush and commit this change in the database.
DELETE FROM passengers WHERE passenger_name = 'Piyush';
Commit;

-- i. Truncate the table passenger and comment on the number of rows in the table (explain if required).
TRUNCATE TABLE passengers;
/* After running the truncate query all the rows will be rempved leaving only the structure intact. So the number of rows 
will be zero in passengers table */

-- j. Delete the table passenger from the database.
DELETE FROM passengers;