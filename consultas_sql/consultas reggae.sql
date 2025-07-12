/* REGGAE*/
  
-- SPOTIFY
/* 1. Identificar cabezas de cartel potenciales:
¨ ¿Cuáles fueron las canciones con mayor "Popularidad" en Spotify entre 2013 y 2017?*/

-- Crear una tabla nueva con el top_20
CREATE TABLE popularidad_reggae AS
SELECT popularidad, cancion, nombre_artista, año
FROM reggae
ORDER BY popularidad DESC
LIMIT 20;

-- De esa tabla, sacar la cantidad de veces que sale cada artista
SELECT COUNT(cancion), nombre_artista
FROM popularidad_reggae
GROUP BY nombre_artista;

-- Mismo resultado sin usar la tabla nueva, usando subconsulta

SELECT nombre_artista, COUNT(*) AS apariciones
FROM (
    SELECT nombre_artista, año, popularidad
    FROM reggae
    ORDER BY popularidad DESC
    LIMIT 20
) AS top_20
GROUP BY nombre_artista
ORDER BY apariciones DESC;

/*¨ ¿Qué artistas tuvieron la mayor cantidad de canciones en el top de popularidad de cada
género y año?*/

-- Respondida en query especial
WITH Top20Songs AS (
    -- 1. Identificar las 20 canciones más populares de Reggae
    SELECT id_cancion, año
    FROM reggae -- Tabla Reggae
    -- Se eliminó: WHERE año IS NOT NULL AND año != ''
    ORDER BY popularidad DESC
    LIMIT 20
),
Top20Artistas AS (
    -- 2. Obtener los artistas de esas 20 canciones top
    SELECT t20.año AS año, a.artista, a.id_artista, t20.id_cancion
    FROM Top20Songs t20
    JOIN canciones_artistas_reggae ca ON t20.id_cancion = ca.id_cancion -- Enlace Reggae
    JOIN reggae_artistas a ON ca.id_artista = a.id_artista -- Artistas Reggae
),
ContajeArtistasTop20 AS (
    -- 3. Contar cuántas canciones del Top 20 tiene cada artista por año
    SELECT año, artista, id_artista,
        COUNT(DISTINCT id_cancion) AS num_canciones_top20
    FROM Top20Artistas
    GROUP BY año, artista, id_artista
),
RankingArtistasTop20 AS (
    -- 4. Rankear artistas por año basado en su cuenta de canciones en el Top 20
    SELECT año, artista, num_canciones_top20,
        RANK() OVER (PARTITION BY año ORDER BY num_canciones_top20 DESC) as ranking
    FROM ContajeArtistasTop20
)
-- 5. Seleccionar el/los artista(s) con más canciones en el Top 20 por año
SELECT año, artista, num_canciones_top20
FROM RankingArtistasTop20
WHERE ranking = 1
ORDER BY año, artista;


/* 2.Clásicos nostálgicos:
¿Hay canciones que se mantuvieron consistentemente populares a lo largo de varios
años? */

SELECT cancion, COUNT(año) años_en_top
FROM popularidad_reggae
GROUP BY cancion
HAVING COUNT(DISTINCT año) > 1
ORDER BY años_en_top DESC, cancion;


-- LAST.FM
/* 1.¿Qué artistas de cada género tuvieron la mayor cantidad de "oyentes" y "playcount" en
LastFM entre 2013 y 2017?*/

SELECT artista, oyentes, reproducciones
FROM reggae_artistas
ORDER BY oyentes DESC, reproducciones DESC
LIMIT 20;

/* 2.¿Cuales son los artistas que son más populares tanto en Spotify como en Last.fm?*/

SELECT a.artista, r.nombre_artista, a.oyentes, r.popularidad
FROM reggae r
INNER JOIN reggae_artistas a
ON a.artista = r.nombre_artista
ORDER BY r.popularidad DESC, a.oyentes DESC
LIMIT 20;

/* 3.¿Qué artistas y canciones fueron populares tanto en Spotify (alta popularidad) como en
LastFM (altos oyentes y playcount)?*/

SELECT a.artista, r.cancion, a.oyentes, r.popularidad, a.reproducciones
FROM reggae r
INNER JOIN reggae_artistas a
ON a.artista = r.nombre_artista
ORDER BY r.popularidad DESC, a.oyentes DESC, a.reproducciones DESC
LIMIT 20;

/* 4. Populares en ambas plataformas*/

SELECT artista, oyentes, reproducciones
FROM reggae_artistas
ORDER BY oyentes DESC, reproducciones DESC
LIMIT 20;

SELECT popularidad, cancion, nombre_artista, año
FROM reggae
ORDER BY popularidad DESC
LIMIT 20;

WITH spotify_top20 AS (
  SELECT nombre_artista
  FROM reggae
  ORDER BY popularidad DESC
  LIMIT 20
),
fm_top20 AS (
  SELECT artista
  FROM reggae_artistas
  ORDER BY oyentes DESC
  LIMIT 20
)
SELECT s.nombre_artista
FROM spotify_top20 s
JOIN fm_top20 f
  ON LOWER(s.nombre_artista) = LOWER(f.artista);
  
/*Preguntas en base a resultados:
1. Teniendo en cuenta los cabezas de cartel seleccionados, ¿cuáles son 
sus canciones más más escuchadas y a qué álbum pertenecen?*/

SELECT * FROM reggae;

SELECT cancion, album, nombre_artista, popularidad
FROM reggae
WHERE UPPER(nombre_artista) LIKE '%Damian Marley%'
ORDER BY popularidad DESC
LIMIT 20;
SELECT cancion, album, nombre_artista, popularidad
FROM reggae
WHERE UPPER(nombre_artista) LIKE '%Protoje%'
ORDER BY popularidad DESC
LIMIT 20;

/*Preguntas finales que permiten comparación de géneros para 
priorizar sobre qué género se puede realizar el festival:
1. ¿Cuál es el número de oyentes total en el top 10 de cada género? FM
2. ¿Cuál es el nivel medio de popularidad en el top20 de cada género? 
Spotify*/