-- USE DATABASE
USE online_music_store;

-- BUSINESS PROBLEMS SOLVED
--1. Senior Most Employee
SELECT TOP 1 
    first_name,
    levels
FROM employees
ORDER BY levels DESC;

--2. Countries with Most Invoices
SELECT TOP 5 
    billing_country,
    COUNT(*) AS total_invoices
FROM invoice
GROUP BY billing_country
ORDER BY total_invoices DESC;

--3. Top 3 Invoice Values
SELECT TOP 3 
    invoice_id,
    total
FROM invoice
ORDER BY total DESC;

--4. City with Highest Revenue
SELECT TOP 1 
    billing_city,
    SUM(total) AS total_revenue
FROM invoice
GROUP BY billing_city
ORDER BY total_revenue DESC;

--5. Best Customer (Highest Spending)
SELECT TOP 1 
    c.customer_id,
    c.first_name,
    SUM(i.total) AS total_spent
FROM customer c
JOIN invoice i 
    ON c.customer_id = i.customer_id
GROUP BY 
    c.customer_id, 
    c.first_name
ORDER BY total_spent DESC;

--6. Rock Music Listeners (Email starts with 'A')
SELECT 
    c.email,
    c.first_name,
    c.last_name,
    g.name AS genre
FROM customer c
JOIN invoice i 
    ON c.customer_id = i.customer_id
JOIN invoice_line il 
    ON i.invoice_id = il.invoice_id
JOIN track t 
    ON il.track_id = t.track_id
JOIN genre g 
    ON t.genre_id = g.genre_id
WHERE 
    c.email LIKE 'A%' 
    AND g.name = 'Rock'
ORDER BY c.email ASC;

--7. Top 10 Rock Artists
SELECT TOP 10 
    a.artist_id,
    a.name AS artist_name,
    COUNT(*) AS total_tracks
FROM artist a
JOIN album al 
    ON a.artist_id = al.artist_id
JOIN track t 
    ON al.album_id = t.album_id
JOIN genre g 
    ON t.genre_id = g.genre_id
WHERE g.name = 'Rock'
GROUP BY 
    a.artist_id, 
    a.name
ORDER BY total_tracks DESC;

--8. Tracks Longer Than Average Duration
SELECT 
    name,
    milliseconds
FROM track
WHERE 
    (
        DATEPART(HOUR, milliseconds) * 3600 +
        DATEPART(MINUTE, milliseconds) * 60 +
        DATEPART(SECOND, milliseconds)
    ) 
    >
    (
        SELECT AVG(
            DATEPART(HOUR, milliseconds) * 3600 +
            DATEPART(MINUTE, milliseconds) * 60 +
            DATEPART(SECOND, milliseconds)
        )
        FROM track
    )
ORDER BY 
    (
        DATEPART(HOUR, milliseconds) * 3600 +
        DATEPART(MINUTE, milliseconds) * 60 +
        DATEPART(SECOND, milliseconds)
    ) DESC;

--9. Customer Spending on Artists
SELECT 
    c.customer_id,
    c.first_name,
    a.name AS artist_name,
    SUM(i.total) AS total_spent
FROM customer c
JOIN invoice i 
    ON c.customer_id = i.customer_id
JOIN invoice_line il 
    ON i.invoice_id = il.invoice_id
JOIN track t 
    ON il.track_id = t.track_id
JOIN album al 
    ON t.album_id = al.album_id
JOIN artist a 
    ON al.artist_id = a.artist_id
GROUP BY 
    c.customer_id,
    c.first_name,
    a.name;

--10. Most Popular Genre by Country
WITH genre_purchases AS (
    SELECT 
        i.billing_country,
        g.name AS genre_name,
        COUNT(*) AS total_purchases
    FROM invoice i
    JOIN invoice_line il 
        ON i.invoice_id = il.invoice_id
    JOIN track t 
        ON il.track_id = t.track_id
    JOIN genre g 
        ON t.genre_id = g.genre_id
    GROUP BY 
        i.billing_country, 
        g.name
),
ranked_genre AS (
    SELECT *,
           RANK() OVER (
               PARTITION BY billing_country 
               ORDER BY total_purchases DESC
           ) AS rnk
    FROM genre_purchases
)
SELECT 
    billing_country,
    genre_name,
    total_purchases
FROM ranked_genre
WHERE rnk = 1;

--11. Top Customer by Country (Final Completed)
WITH customer_spending AS (
    SELECT 
        c.customer_id,
        c.first_name,
        i.billing_country,
        SUM(i.total) AS total_spent
    FROM customer c
    JOIN invoice i 
        ON c.customer_id = i.customer_id
    GROUP BY 
        c.customer_id,
        c.first_name,
        i.billing_country
),
ranked_customers AS (
    SELECT *,
           RANK() OVER (
               PARTITION BY billing_country 
               ORDER BY total_spent DESC
           ) AS rnk
    FROM customer_spending
)
SELECT 
    billing_country,
    customer_id,
    first_name,
    total_spent
FROM ranked_customers
WHERE rnk = 1;