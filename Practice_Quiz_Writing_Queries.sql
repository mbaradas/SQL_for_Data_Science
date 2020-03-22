-- 1. All of the questions in this quiz pull from the open source Chinook Database. Please refer to the ER Diagram 
-- below and familiarize yourself with the table and column names to write accurate queries and get the appropriate answers.

-- https://d3c33hcgiwev3.cloudfront.net/imageAssetProxy.v1/UAPENoOVEei4RQ5L9j9nDA_5042a1f0839511e8beb2b5b4ae9fa29a_ER-Diagram.png?expiry=1585008000000&hmac=DMDLn6nsSpDvPJCg9UMf-n4cBw77zSAkgic17oORSsw

-- How many albums does the artist Led Zeppelin have?

SELECT art.Name,
	COUNT(alb.Title) AS Albums
	
FROM artists art

INNER JOIN albums alb
	ON art.ArtistId = alb.ArtistId
	
WHERE art.Name = 'Led Zeppelin';

-- 2. Create a list of album titles and the unit prices for the artist "Audioslave".

SELECT art.Name,
	alb.Title,
	tra.Name,
	tra.UnitPrice
	
FROM artists art

INNER JOIN albums alb
	ON art.ArtistId = alb.ArtistId
	
INNER JOIN tracks tra
	ON alb.AlbumId = tra.AlbumId
	
WHERE art.Name = 'Audioslave';
-- 3. Find the first and last name of any customer who does not have an invoice. Are there any customers returned from the query?

SELECT cus.FirstName,
	cus.LastName,
	inv.InvoiceId

FROM customers cus

LEFT JOIN invoices inv
	ON cus.CustomerId = inv.CustomerId

WHERE inv.InvoiceId IS NULL;

-- 4. Find the total price for each album.

SELECT art.Name,
	alb.Title,
	SUM(UnitPrice) AS album_price

FROM artists art

INNER JOIN albums alb
	ON art.ArtistId = alb.ArtistId

INNER JOIN tracks tra
	ON alb.AlbumId = tra.AlbumId

WHERE alb.Title = 'Big Ones'

GROUP BY alb.AlbumId;

-- 5. How many records are created when you apply a Cartesian join to the invoice and invoice items table?

SELECT inv.CustomerId,
	ite.InvoiceId

FROM invoices inv

CROSS JOIN invoice_items ite;
