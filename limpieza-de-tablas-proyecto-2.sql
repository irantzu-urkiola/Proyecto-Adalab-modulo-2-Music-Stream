-- Hemos limpiado la columna año, de tener día, mes y año, a solo años, en cada género

UPDATE flamencopop
SET año = LEFT(año, 4);
SELECT año FROM flamencopop;

UPDATE ska
SET año = LEFT(año, 4);
SELECT año FROM ska;

UPDATE reggae
SET año = LEFT(año, 4);
SELECT año FROM reggae;

UPDATE kpop
SET año = LEFT(año, 4);
SELECT año FROM kpop;

-- Eliminamos las columnas innecesarias para las querys

ALTER TABLE flamencopop
DROP COLUMN duracion;

ALTER TABLE flamencopop
DROP COLUMN numero_pista;

ALTER TABLE flamencopop
DROP COLUMN spotify_id;

ALTER TABLE flamencopop_artistas
DROP COLUMN biografia;

ALTER TABLE ska
DROP COLUMN duracion;

ALTER TABLE ska
DROP COLUMN numero_pista;

ALTER TABLE ska
DROP COLUMN spotify_id;

ALTER TABLE ska_artistas
DROP COLUMN biografia;

ALTER TABLE reggae
DROP COLUMN duracion;

ALTER TABLE reggae
DROP COLUMN numero_pista;

ALTER TABLE reggae
DROP COLUMN spotify_id;

ALTER TABLE reggae_artistas
DROP COLUMN biografia;

ALTER TABLE kpop
DROP COLUMN duracion;

ALTER TABLE kpop
DROP COLUMN numero_pista;

ALTER TABLE kpop
DROP COLUMN spotify_id;

ALTER TABLE kpop_artistas
DROP COLUMN biografia;
