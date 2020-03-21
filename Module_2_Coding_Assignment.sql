-- 1. All of the questions in this quiz refer to the open source Chinook Database. Please familiarize yourself with the 
-- ER diagram to familiarize yourself with the table and column names to write accurate queries and get the appropriate answers.
-- https://ucde-rey.s3.amazonaws.com/DSV1015/ChinookDatabaseSchema.png
-- Run Query: Find all the tracks that have a length of 5,000,000 milliseconds or more.

SELECT *
FROM Tracks
WHERE Milliseconds >= 5000000;

-- 2. Run Query: Find all the invoices whose total is between $5 and $15 dollars.
	
SELECT *
FROM Invoices
WHERE Total BETWEEN 5 and 15;
	
-- 3. Run Query: Find all the customers from the following States: RJ, DF, AB, BC, CA, WA, NY.

SELECT *
FROM Customers
WHERE State IN ('RJ', 'DF', 'AB', 'BC', 'CA', 'WA', 'NY');

-- 4. Run Query: Find all the invoices for customer 56 and 58 where the total was between $1.00 and $5.00.

SELECT *
FROM Invoices
WHERE (CustomerId = 56 OR CustomerId = 58)
AND Total BETWEEN 1 AND 5;

--5. Run Query: Find all the tracks whose name starts with 'All'.

SELECT *
FROM Tracks
WHERE Name LIKE 'All%';

-- 6. Run Query: Find all the customer emails that start with "J" and are from gmail.com.

SELECT *
FROM Customers
WHERE Email LIKE 'J%@gmail.com';

-- 7. Run Query: Find all the invoices from the billing city Brasília, Edmonton, and Vancouver and sort in descending
-- order by invoice ID.

SELECT *
FROM Invoices
WHERE BillingCity IN ('Brasília', 'Edmonton', 'Vancouver')
ORDER BY InvoiceId DESC;

-- 8. Run Query: Show the number of orders placed by each customer (hint: this is found in the invoices table) and 
-- sort the result by the number of orders in descending order.

SELECT CustomerId,
COUNT (InvoiceId) AS total_orders
FROM Invoices
GROUP BY CustomerId
ORDER BY total_orders DESC;

-- 9. Run Query: Find the albums with 12 or more tracks.

SELECT AlbumId,
COUNT (TrackId) AS total_tracks
FROM Tracks
GROUP BY AlbumId
HAVING total_tracks >= 12;
