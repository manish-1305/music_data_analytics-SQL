select * from bands;
select * from albums;
select * from songs
limit 100;


-- retrive all the band names
SELECT DISTINCT b.name AS band_name
FROM bands b
JOIN albums a
ON b.id = a.band_id;

select * from albums
where release_year IS NULL
order by release_year ; 


-- give the total duration of songs in the album
SELECT
  albums.name as Name,
  albums.release_year as 'Release Year',
  SUM(songs.length) as 'Duration'
FROM albums
JOIN songs on albums.id = songs.album_id
GROUP BY songs.album_id
ORDER BY Duration DESC;

-- Retrieve Song Information with Album and Band Name
SELECT 
  songs.name AS song_name, 
  songs.length, 
  albums.name AS album_name, 
  bands.name AS band_name 
FROM 
  songs 
JOIN 
  albums ON songs.album_id = albums.id 
JOIN 
  bands ON albums.band_id = bands.id;
  
-- Count Number of Albums per Band
SELECT 
  bands.name AS band_name, 
  COUNT(albums.id) AS album_count 
FROM 
  bands 
LEFT JOIN 
  albums ON bands.id = albums.band_id 
GROUP BY 
  bands.name;
  
-- Retrieve Bands with More Than One Album
SELECT 
  bands.name AS band_name, 
  COUNT(albums.id) AS album_count 
FROM 
  bands 
JOIN 
  albums ON bands.id = albums.band_id 
GROUP BY 
  bands.name 
HAVING 
  COUNT(albums.id) > 1;
  
  
-- Total Number of Songs by Each Band
WITH SongCounts AS (
  SELECT 
    albums.band_id, 
    COUNT(songs.id) AS song_count 
  FROM 
    songs 
  JOIN 
    albums ON songs.album_id = albums.id 
  GROUP BY 
    albums.band_id
)
SELECT 
  bands.name AS band_name, 
  SongCounts.song_count 
FROM 
  SongCounts 
JOIN 
  bands ON SongCounts.band_id = bands.id;
  
  

  




