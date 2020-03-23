-- 1. All of the questions in this quiz refer to the open source Chinook Database. Please familiarize yourself with the 
-- ER diagram in order to familiarize yourself with the table and column names in order to write accurate queries and get
-- the appropriate answers.
-- https://ucde-rey.s3.amazonaws.com/DSV1015/ChinookDatabaseSchema.png

-- Pull a list of customer ids with the customer’s full name, and address, along with combining their city and country together. Be sure to make a space in between these two and make it UPPER CASE.

SELECT CustomerId,
	FirstName,
	LastName,
	Address,
	UPPER(City) || ' ' || UPPER(Country)

FROM Customers;

-- 2. Create a new employee user id by combining the first 4 letters of the employee’s first name with the first 2 letters of the employee’s last name. Make the new field lower case and pull each individual step to show your work.

SELECT FirstName,
	LastName,
	LOWER(SUBSTR(FirstName, 1, 4)) || LOWER(SUBSTR(LastName, 1, 2)) AS new_employee_user_id

FROM Employees;

-- 3. Show a list of employees who have worked for the company for 15 or more years using the current date function. Sort by lastname ascending.

SELECT LastName,
	HireDate,
	DATE ('now') - HireDate AS longevity

FROM Employees

WHERE longevity >= 15

ORDER BY LastName ASC;

-- 4. Profiling the Customers table, answer the following question.

SELECT *

FROM Customers

-- WHERE CustomerId IS NULL;
-- WHERE FirstName IS NULL;
-- WHERE LastName IS NULL;
-- WHERE Company IS NULL;
-- WHERE Address IS NULL;
-- WHERE City IS NULL;
-- WHERE State IS NULL;
-- WHERE Country IS NULL;
-- WHERE PostalCode IS NULL;
-- WHERE Phone IS NULL;
-- WHERE Fax IS NULL;
-- WHERE Email IS NULL;
-- WHERE SupportRepId IS NULL;

-- 5. Find the cities with the most customers and rank in descending order.

SELECT COUNT(CustomerId) AS customer_count,
	City

FROM Customers

GROUP BY City

ORDER BY customer_count DESC;
-- 6. Create a new customer invoice id by combining a customer’s invoice id with their first and last name while ordering your query in the following order: firstname, lastname, and invoiceID.

SELECT cus.FirstName,
	cus.LastName,
	inv.InvoiceId,
	cus.FirstName || cus.LastName || inv.InvoiceId AS new_inv_id

FROM Customers cus

INNER JOIN Invoices inv
	ON cus.CustomerId = inv.CustomerId

ORDER BY cus.FirstName,
	cus.LastName,
	inv.InvoiceId;
