	-- 1. All of the questions in this quiz refer to the open source Chinook Database. Please familiarize yourself 
  -- with the ER diagram in order to familiarize yourself with the table and column names in order to write 
  -- accurate queries and get the appropriate answers.
	-- https://ucde-rey.s3.amazonaws.com/DSV1015/ChinookDatabaseSchema.png
	
	-- Using a subquery, find the names of all the tracks for the album "Californication".
	
	SELECT alb.Title,
		tra.TrackId,
		tra.Name
	
	FROM Albums alb
	
	INNER JOIN tracks tra
		ON alb.AlbumId = tra.AlbumId
	
	WHERE alb.Title = 'Californication'
	
	ORDER BY tra.TrackId ASC;
	
  -- 2. Find the total number of invoices for each customer along with the customer's full name, city and email.
	
	SELECT cus.CustomerId,
		cus.FirstName,
		cus.LastName,
		cus.Email,
		COUNT(inv.InvoiceId) AS total_invoices
	
	FROM Customers cus
	
	LEFT JOIN Invoices inv
		ON cus.CustomerId = inv.CustomerId
	
	GROUP BY cus.CustomerId
	
	ORDER BY cus.CustomerId ASC;
	
-- 3. Retrieve the track name, album, artistID, and trackID for all the albums.

	SELECT tra.Name,
		alb.Title,
		art.ArtistId,
		tra.TrackId
	
	FROM Artists art
	
	LEFT JOIN Albums alb
		ON art.ArtistId = alb.ArtistId
	
	LEFT JOIN Tracks tra
		ON alb.AlbumId = tra.AlbumId
	
	WHERE alb.Title = 'For Those About To Rock We Salute You'
		AND tra.TrackId = 12;
	
  -- 4. Retrieve a list with the managers last name, and the last name of the employees who report to him or her.
	
	SELECT A.LastName AS LastName_mgr,
		B.LastName AS LastName_emp
	
	FROM Employees A,
		Employees B
	
	WHERE A.EmployeeId = B.ReportsTo;
	
  -- 5. Find the name and ID of the artists who do not have albums.

SELECT art.Name,
	art.ArtistId,
	alb.Title

FROM Artists art

LEFT JOIN Albums alb
	ON art.ArtistId = alb.ArtistId

WHERE alb.Title IS NULL;

-- 6. Use a UNION to create a list of all the employee's and customer's first names and last names ordered by 
-- the last name in descending order.

SELECT FirstName,
	LastName

FROM Employees


UNION

SELECT FirstName,
	LastName

FROM Customers

ORDER BY LastName DESC;

-- 7. See if there are any customers who have a different city listed in their billing city versus their customer city.

SELECT cus.CustomerId,
	cus.City,
	inv.BillingCity

FROM Customers cus

INNER JOIN Invoices inv
	ON cus.CustomerId = inv.CustomerId

WHERE cus.City <> inv.BillingCity;
