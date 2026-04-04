create database online_music_store;
use online_music_store;

-- table Album
create table album(
album_id int,
title varchar(100),
artist_id int);

bulk insert album
from 'C:\Users\rsah7\OneDrive\DATA_ANALYTICS\Projects\Sql projects\music store data\music store data\album.csv'
with
(

FORMAT = 'CSV',
FIRSTROW = 2,       -- skip header
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'

)
select * from album;

-- Table Album2
create table Album2
(
album_id	int,
title	varchar(60),
artist_id int
);

bulk insert album2
from 'C:\Users\rsah7\OneDrive\DATA_ANALYTICS\Projects\Sql projects\music store data\music store data\album2.csv'
with
(
Format = 'CSV',
Firstrow = 2,
Fieldterminator = ',',
rowterminator = '\n'
);

select * from Album2;


-- Table Artis 
create table Artist(
artist_id Int,
name Varchar(100)

);

bulk insert artist
from 'C:\Users\rsah7\OneDrive\DATA_ANALYTICS\Projects\Sql projects\music store data\music store data\artist.csv'
with
(
format = 'CSV',
FIRSTROW = 2,       -- skip header
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
);
select * from Artist;

-- Table Customer
create table Customer(
customer_id	int,
first_name	varchar(60),
last_name	varchar(60),
company	varchar(150),
address	varchar(150),
city	varchar(150),
state	varchar(60),
country	varchar(60),
postal_code	varchar(60),
phone	varchar(20),
fax	varchar(30),
email	varchar(100),
support_rep_id int
);

select * from Customer;

bulk insert Customer
from 'C:\Users\rsah7\OneDrive\DATA_ANALYTICS\Projects\Sql projects\music store data\music store data\customer.csv'
with
(
format = 'CSV',
FIRSTROW = 2,       -- skip header
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)
select * from Customer;
drop table Customer;

--Employees Table
create table employees(
employee_id	int primary key,
last_name varchar(60),
first_name varchar(70),
title varchar(60),
reports_to int,
levels varchar(10),
birthdate date,
hire_date	date,
address	varchar(200),
city varchar(60),
state varchar(60),
country varchar(60), 
postal_code varchar(60),
phone  VARCHAR(20), 
fax	varchar(20), 
email varchar(60));

BULK INSERT employees
FROM 'C:\Users\rsah7\OneDrive\DATA_ANALYTICS\Projects\Sql projects\music store data\music store data\employee.csv'
WITH
(
    FORMAT = 'CSV',
    FIRSTROW = 2,       -- skip header
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n'
);

select * from employees;


-- Table Genre
create table Genre
(
genre_id int,
name varchar(20)
);

bulk insert Genre
from 'C:\Users\rsah7\OneDrive\DATA_ANALYTICS\Projects\Sql projects\music store data\music store data\genre.csv'
with
(
Format = 'CSV',
Firstrow = 2,
Fieldterminator = ',',
Rowterminator = '\n'
);
select * from Genre;

--Table Invoice
create table invoice
(
invoice_id	int,
customer_id	int,
invoice_date date,
billing_address	varchar(50),
billing_city Varchar(30),
billing_state	varchar(10),
billing_country	varchar(20),
billing_postal_code varchar(15)	,
total float

);

bulk insert invoice
from 'C:\Users\rsah7\OneDrive\DATA_ANALYTICS\Projects\Sql projects\music store data\music store data\invoice.csv'
with
(
Format = 'CSV',
Firstrow = 2,
FIELDTERMINATOR = ',',
Rowterminator = '\n'
);

select * from invoice;

-- Table invoce line
create table Invoice_line(
invoice_line_id	int,
invoice_id	int,
track_id	int,
unit_price	float,
quantity int
)

bulk insert Invoice_line
from 'C:\Users\rsah7\OneDrive\DATA_ANALYTICS\Projects\Sql projects\music store data\music store data\invoice_line.csv'
with
(
Format = 'CSV',
Firstrow = 2,
FIELDTERMINATOR = ',',
Rowterminator = '\n'
)
select * from Invoice_line;

-- Table Media Type
create table media_type
(
media_type_id int,
name varchar(50)
);

bulk insert media_type
from 'C:\Users\rsah7\OneDrive\DATA_ANALYTICS\Projects\Sql projects\music store data\music store data\media_type.csv'
with
(
Format = 'CSV',
Firstrow = 2,
FIELDTERMINATOR = ',',
Rowterminator = '\n'
)
select * from media_type;

--Table Playlist
create table playlist(
playlist_id	int, 
name varchar(30)

);

bulk insert playlist
from 'C:\Users\rsah7\OneDrive\DATA_ANALYTICS\Projects\Sql projects\music store data\music store data\playlist.csv'
with
(
Format = 'CSV',
Firstrow = 2,
FIELDTERMINATOR = ',',
Rowterminator = '\n'
);

select * from playlist;

--Playlist Track
create table playlist_track
(
playlist_id int,
track_id int
);

bulk insert playlist_track
from 'C:\Users\rsah7\OneDrive\DATA_ANALYTICS\Projects\Sql projects\music store data\music store data\playlist_track.csv'
with
(
Format = 'CSV',
Firstrow = 2,
FIELDTERMINATOR = ',',
Rowterminator = '\n'
);

select * from playlist_track;

-- Track
create table track
(track_id	int primary key,
name varchar(150),
album_id int,
media_type_id int,
genre_id int,
composer varchar(200),
milliseconds time,
bytes int,
unit_price float
);

bulk insert track
from 'C:\Users\rsah7\OneDrive\DATA_ANALYTICS\Projects\Sql projects\music store data\music store data\track.csv'
with
(
Format = 'CSV',
Firstrow = 2,
FIELDTERMINATOR = ',',
Rowterminator = '\n'
);

select * from track;

-- Accessing all the table at once
select * from album;
select * from Album2;
select * from Artist;
select * from Customer;
select * from invoice;
select * from employees;
select * from Genre;
select * from Invoice_line;
select * from media_type;
select * from playlist;
select * from playlist_track;
select * from track;

--- Data Analysis Work Starts Here
--1. Who is the senior most employee based on job title?
select * from employees;
select top(1) first_name, levels from employees order by levels desc;

--2. Which countries have the most Invoices?
select top(5) billing_country,count(*) as top_billing_country from invoice group by billing_country 
order by top_billing_country desc;


--3. What are top 3 values of total invoice?
select 
top(3) invoice_id, total 
from invoice
order by total desc;

/*4. 
Which city has the best customers? We would like to throw a promotional Music
Festival in the city we made the most money. Write a query that returns one city that
has the highest sum of invoice totals. Return both the city name & sum of all invoice
totals
*/
select top(1) billing_city,
sum(total) as city_total
from invoice
group by billing_city order by city_total desc;

select top(1) distinct (billing_city),
SUM(total) as city_total                    -- wrong why?
from invoice 
group by billing_city 
order by city_total desc;

/* 5. Who is the best customer? The customer who has spent the most money will be
declared the best customer. Write a query that returns the person who has spent the
most money
*/

select top(1) c.customer_id, c.first_name, sum(i.total) total_spen from customer c
inner join invoice i 
on c.customer_id = i.customer_id
group by c.customer_id, c.first_name
order by total_spen desc;



/*
6. Write query to return the email, first name, last_name, & Genre of all Rock Music
listeners. Return your list ordered alphabetically by email starting with A
*/
select c.email, c.last_name, g.genre_id, g.name
from customer c
inner join invoice i on c.customer_id = i.customer_id
inner join Invoice_line i_l on i.invoice_id = i_l.invoice_id
inner join track t on i_l.track_id =  t.track_id
inner join Genre g on t.genre_id = g.genre_id
where c.email like 'a%' and g.name= 'Rock'
order by c.email asc;


/*
7. Let's invite the artists who have written the most rock music in our dataset. Write a
query that returns the Artist name and total track count of the top 10 rock bands
*/
select  top(10) a.artist_id, a.name, g.name as Gerne_Name, g.genre_id, count(a.artist_id) as total_books
from Artist a
inner join album al on a.artist_id = al.artist_id
inner join track t on al.album_id = t.album_id
inner join Genre g on t.genre_id = g.genre_id
where g.name = 'Rock'
group by a.artist_id, a.name, g.name, g.genre_id
order by total_books desc;


/*
8. Return all the track names that have a song length longer than the average song length.
Return the Name and Milliseconds for each track. Order by the song length with the
longest songs listed first
*/
select name, milliseconds from track;

select name, milliseconds from track
where CAST(milliseconds AS FLOAT) > (SELECT AVG(CAST(milliseconds AS FLOAT)) from track)           -- DOUBT
order by cast(milliseconds as float) desc;



/*
9. Find how much amount spent by each customer on artists? Write a query to return
customer name, artist name and total spent
*/
select * from  Customer

select c.Customer_Id, c.First_name, a.Name as artist_name, sum(i.total) as customer_spent_per_artist
from customer c
inner join invoice i 
on c.customer_id = i.customer_id
inner join Invoice_line i_l
on i.invoice_id = i_l.invoice_id
inner join track t
on t.track_id = i_l.track_id
inner join album al
on t.album_id = al.album_id
inner join Artist a
on al.artist_id = a.artist_id
group by c.Customer_Id, c.First_name, a.Name




/*
10. We want to find out the most popular music Genre for each country. We determine the
most popular genre as the genre with the highest amount of purchases. Write a query
that returns each country along with the top Genre. For countries where the maximum
number of purchases is shared return all Genres
*/


/*
11. Write a query that determines the customer that has spent the most on music for each
country. Write a query that returns the country along with the top customer and how
much they spent. For countries where the top amount spent is shared, provide all
customers who spent this amount
*/