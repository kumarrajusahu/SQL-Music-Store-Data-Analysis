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

--- Data analysis work is in file "Business Problems Solved.sql"
