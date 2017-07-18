--Query all the entries in the Genre table
select g.Label, g.GenreId
from Genre g;
select *
from Artist;
select *
from Album;
select *
from Song;

--Using the INSERT statement, add one of your favorite artists to the Artist table.
insert into Artist
values (null, "Playboi Carti", 2017);

insert into Artist (ArtistName, YearEstablished)
values ("Wintertime", 2015);

--Using the INSERT statement, add one, or more, albums by your artist to the Album table.
insert into Album
values (null, "Playboi Carti", 2017,48, "Interscope",28,13);

--Using the INSERT statement, add some songs that are on that album th the Song table.
insert into Song
values (null, "Magnolia",3, 2017,13,28,23);

--Show albums by specific artist
select Title
from Album
where artistId = 1
and Title = "Point 
 Entry";

/* Write a SELECT query that provides the song titles, album title,
 and artist name for all of the data you just entered in. 
 Use the LEFT JOIN keyword sequence to connect the tables, 
 and the WHERE keyword to filter the results to the album and artist you added.*/
select s.Title as "Song Title", al.Title as "Album Title", a.ArtistName
from Song s, Album al, Artist a
where s.AlbumId = al.AlbumId
and s.ArtistId = a.ArtistId;

/*Write a SELECT statement to display how many songs exist for each album.
You'll need to use the COUNT() function and the GROUP BY keyword sequence.*/
select al.Title, count(s.AlbumId) as "Number of Tracks"
from Album al, Song s
where al.AlbumId = s.AlbumId
group by al.title;


select a.ArtistName, al.Title
from Artist a, Album al
where a.ArtistId = al.ArtistId
order by a.ArtistName asc;

select s.Title as "song title", al.Title as "album title", a.ArtistName as "artist"
from Song s
left join Album al
on s.albumid = al.albumid
left join Artist a
on s.artistId = a.ArtistId;

select s.Title as "Song", al.Title as "Album", g.Label as "Genre", a.ArtistName as "Artist"
from Song s, Album al, Genre g, Artist a
where s.albumid = al.albumid
and s.genreid = g.genreid
and s.artistid = a.artistid;

--5
/*Write a SELECT query that provides the song titles, album title, 
and artist name for all of the data you just entered in. 
Use the LEFT JOIN keyword sequence to connect the tables, 
and the WHERE keyword to filter the results to the album and artist you added.*/
SELECT a.Title, s.Title FROM Album a LEFT JOIN Song s ON s.AlbumId = a.AlbumId;
SELECT a.Title, s.Title FROM Song s LEFT JOIN Album a ON s.AlbumId = a.AlbumId;

select s.title as "Song", al.title as "Album", ar.artistname as "Artist"
from Song s
left join album al on s.albumid = al.albumid
left join artist ar on s.artistid = ar.artistid
where ar.artistname = "Playboi Carti";

--6
/*Write a SELECT statement to display how many songs exist for each album.
You'll need to use the COUNT() function and the GROUP BY keyword sequence.*/
select al.Title, count(s.AlbumId) as "Number of Tracks"
from Album al, Song s
where al.AlbumId = s.AlbumId
group by al.title;

--7
/*Write a SELECT statement to display how many songs exist for each artist.
You'll need to use the COUNT() function and the GROUP BY keyword sequence.*/
select ar.artistname, count(s.artistid) as "Number of Tracks"
from Artist ar, Song s
where ar.artistid = s.artistid
group by ar.ArtistName;

--8
/*Write a SELECT statement to display how many songs exist for each genre. 
You'll need to use the COUNT() function and the GROUP BY keyword sequence.
*/
select g.Label, count(s.genreId) as "Number of Tracks"
from Genre g, Song s
where g.genreId = s.genreId
group by g.genreid;

--9
/*Using MAX() function, write a select statement to find the album with the longest duration. 
The result should display the album title and the duration.*/
select title, max(albumlength) as "Duration"
from Album;

--10
/*Using MAX() function, write a select statement to find the song with the longest duration. 
The result should display the song title and the duration.*/
select title, max(songlength) as "Duration"
from song;

--11
--Modify the previous query to also display the title of the album.
select s.title, max(s.songlength) as "Duration", al.title
from song s, album al
where s.albumid = al.albumid;