
-- Create a new table 'airline_info'
create database airline_info;
use airline_info;

CREATE TABLE airline_info (
    id INT,
    airline VARCHAR(50),
    flight VARCHAR(50),
    source_city VARCHAR(50),
    departure_time VARCHAR(50),
    stops VARCHAR(50),
    arrival_time VARCHAR(50),
    destination_city VARCHAR(50),
    class VARCHAR(50),
    duration FLOAT,
    days_left INT,
    price INT
);
describe airline_info;


-- Describing Table Structure
-- Describe the structure of the 'airline_info' table

DESCRIBE airline_info;



-- Loading Data into a Table
-- Load data from a CSV file into the 'airline_info' table

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Airline.csv'
INTO TABLE airline_info
FIELDS TERMINATED BY ','
ENCLOSED BY ""
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
select* from airline_info;


select count(stops) from airline_info;
select min(stops) from airline_info;

-- Q2) What is the average, maximum, and minimum ticket prices for different travel classes?
select class ,avg(price) avrage_price 
from airline_info group by class;

select class,max(price) maximum_price 
from airline_info group by class;

select class,min(price) minimim_price from airline_info group by class;

select  class ,avg(price) average_price 
from airline_info
group by class;

select class,sum(price) sum_price
from airline_info
group by class;

select class,count(price) count_price from airline_info group by class;

select class,sum(price) sum_price from airline_info group by class;

select class,max(price) max_price
from airline_info
group by class;

select class,min(price) min_price
from airline_info
group by class;
select count(days_left) as lead_time,
count(*) as daya_left
from airline_info group by days_left;
select * from airline_info;



SELECT count( days_left) AS lead_time,
  COUNT(*) AS daya_left
FROM airline_info
GROUP BY days_left;

-- Q3) Which flight has the most stops, and which airline operates it?
select flight,airline, max(stops) max_stops from airline_info 
group by flight,airline limit 8;

select flight,airline,max(stops) max_stops 
from airline_info
 group by flight ,airline limit 10;
 

select flight,airline, max(stops) max_stops
from airline_info
group by flight,airline
limit 5;
select* from airline_info;
-- Q4) Which flights have the shortest duration, and which airlines operate them?
select duration,flight ,min(duration) airline_duration from airline_info
group by duration ,flight;

SELECT id, duration,airline
FROM airline_info
WHERE duration = (SELECT MIN(duration) FROM airline_info);
-- Q5) How does the average ticket price vary based on the number of stops in the flight?
select stops, avg(price) average_price from airline_info group by stops;
 
select stops,avg(price) average_price
from airline_info
group by stops;
-- Q6) What is the average flight duration for each airline and travel class combination?
select class,airline,avg(duration) average_duration 
from airline_info
 group by class,airline;
 
select class,airline,avg(duration) average_duration
from airline_info
group by class,airline;

-- Q7) Which flights have the longest layovers, and what are their departure and arrival times?
select departure_time,arrival_time(arrival_time) as layover_duration 
from airline_info 
order by layover_duration desc limit 9;

    select departure_time,arrival(arrival) AS layover_duration
FROM airline_info
ORDER BY layover_duration DESC
LIMIT 5;
select * from airline_info;
select departure_time,arrival(longest_layovers) as longest_layovers
from airline_info
group by departure_time,arrival;


-- Write a query to find the top 3 most expensive flights from Delhi to Mumbai.
select flight,  airline,price from airline_info where source_city = 'Delhi' and destination_city = 'Mumbai'
order by price desc limit 3;











