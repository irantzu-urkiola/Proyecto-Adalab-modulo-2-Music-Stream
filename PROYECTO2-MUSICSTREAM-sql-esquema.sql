CREATE SCHEMA proyecto_2_musicstream;
USE proyecto_2_musicstream;

-- Tablas para canciones por género (Spotify)

CREATE TABLE flamencopop (
id_cancion INT AUTO_INCREMENT PRIMARY KEY,
genero VARCHAR(50), 
cancion VARCHAR(400), 
nombre_artista VARCHAR(250), 
album VARCHAR(300), 
año VARCHAR(20), 
duracion INT, 
popularidad SMALLINT, 
numero_pista VARCHAR(10), 
spotify_id VARCHAR(150)
);

CREATE TABLE reggae (
id_cancion INT AUTO_INCREMENT PRIMARY KEY,
genero VARCHAR(50), 
cancion VARCHAR(400), 
nombre_artista VARCHAR(400), 
album VARCHAR(300), 
año VARCHAR(20), 
duracion INT, 
popularidad SMALLINT, 
numero_pista VARCHAR(10), 
spotify_id VARCHAR(150)
);

CREATE TABLE ska (
id_cancion INT AUTO_INCREMENT PRIMARY KEY,
genero VARCHAR(50), 
cancion VARCHAR(400), 
nombre_artista VARCHAR(400), 
album VARCHAR(300), 
año VARCHAR(20), 
duracion INT, 
popularidad SMALLINT, 
numero_pista VARCHAR(10), 
spotify_id VARCHAR(150)
);

CREATE TABLE kpop (
id_cancion INT AUTO_INCREMENT PRIMARY KEY,
genero VARCHAR(50), 
cancion VARCHAR(400), 
nombre_artista VARCHAR(400), 
album VARCHAR(300), 
año VARCHAR(20), 
duracion INT, 
popularidad SMALLINT, 
numero_pista VARCHAR(10), 
spotify_id VARCHAR(150)
);

-- Tablas para artistas por género (Last.fm)

CREATE TABLE flamencopop_artistas (
id_artista INT AUTO_INCREMENT PRIMARY KEY,
artista VARCHAR (300),
biografia LONGTEXT,
oyentes INT,
reproducciones INT,
artistas_similares VARCHAR (400)
);

CREATE TABLE reggae_artistas (
id_artista INT AUTO_INCREMENT PRIMARY KEY,
artista VARCHAR (300),
biografia LONGTEXT,
oyentes INT,
reproducciones INT,
artistas_similares VARCHAR (400)
);

CREATE TABLE ska_artistas (
id_artista INT AUTO_INCREMENT PRIMARY KEY,
artista VARCHAR (300),
biografia LONGTEXT,
oyentes INT,
reproducciones INT,
artistas_similares VARCHAR (400)
);

-- Tenemos que modificar el tipo de dato de reproducciones porque aquí nos daba fallo al subirlos por quedarse pequeño el INT

ALTER TABLE kpop_artistas
MODIFY reproducciones BIGINT;

CREATE TABLE kpop_artistas (
id_artista INT AUTO_INCREMENT PRIMARY KEY,
artista VARCHAR (300),
biografia LONGTEXT,
oyentes INT,
reproducciones INT,
artistas_similares VARCHAR (400)
);

-- Tablas intermedias por géneros (Unimos info de Spotify con info de Last.fm)

CREATE TABLE canciones_artistas_flamencopop (
    id_cancion INT,
    id_artista INT,
    PRIMARY KEY (id_cancion, id_artista),
    FOREIGN KEY (id_cancion) REFERENCES flamencopop(id_cancion),
    FOREIGN KEY (id_artista) REFERENCES flamencopop_artistas(id_artista)
);

CREATE TABLE canciones_artistas_reggae (
    id_cancion INT,
    id_artista INT,
    PRIMARY KEY (id_cancion, id_artista),
    FOREIGN KEY (id_cancion) REFERENCES reggae(id_cancion),
    FOREIGN KEY (id_artista) REFERENCES reggae_artistas(id_artista)
);

CREATE TABLE canciones_artistas_ska (
    id_cancion INT,
    id_artista INT,
    PRIMARY KEY (id_cancion, id_artista),
    FOREIGN KEY (id_cancion) REFERENCES ska(id_cancion),
    FOREIGN KEY (id_artista) REFERENCES ska_artistas(id_artista)
);

CREATE TABLE canciones_artistas_kpop (
    id_cancion INT,
    id_artista INT,
    PRIMARY KEY (id_cancion, id_artista),
    FOREIGN KEY (id_cancion) REFERENCES kpop(id_cancion),
    FOREIGN KEY (id_artista) REFERENCES kpop_artistas(id_artista)
);

SELECT * FROM reggae;
SELECT * FROM reggae_artistas;
SELECT * FROM canciones_artistas_reggae;

SELECT * FROM ska;
SELECT * FROM ska_artistas;
SELECT * FROM canciones_artistas_ska;

SELECT * FROM flamencopop;
SELECT * FROM flamencopop_artistas;
SELECT * FROM canciones_artistas_flamencopop;

SELECT * FROM kpop;
SELECT * FROM kpop_artistas;
SELECT * FROM canciones_artistas_kpop;

