# 🎶 MusicStream: Análisis de Popularidad Musical en la Era Digital

**Proyecto académico del Módulo 2: SQL - Bootcamp Adalab (Promo 52 - Julia Salander)**

## 📌 Introducción

Este proyecto nace a partir de una solicitud de una productora de grandes festivales, interesada en identificar los **artistas más populares en géneros musicales de nicho** como *flamenco pop, reggae, ska y K-pop* entre los años **2013 y 2017**, coincidiendo con el inicio de la asistencia masiva del target millennial a este tipo de eventos.

A través de APIs, bases de datos y consultas SQL, desarrollamos un sistema que permite **analizar la evolución musical de estos géneros** y descubrir **artistas y canciones más populares** para orientar una gira musical estratégica.

## 🎯 Objetivos

- Consolidar conocimientos en **Python** y **SQL**.
- Diseñar y construir una **base de datos relacional**.
- Implementar un **sistema de extracción, limpieza, almacenamiento y análisis de datos** musicales.
- Aplicar metodologías ágiles como **Scrum** en un trabajo colaborativo.
- Presentar resultados relevantes a partir de **consultas SQL avanzadas**.

## 🧠 Fases del Proyecto

### 1. Extracción de Datos
- APIs utilizadas: **Spotify** y **Last.fm**.
- Autenticación con claves y tokens necesarios.
- Extracción de:
  - Artistas.
  - Géneros musicales.
  - Tipo de contenido (canción o álbum).
  - Año de lanzamiento.
  - Estadísticas de popularidad.
  - Biografías y artistas similares.
- Uso de bucles `for` y funciones en `Python` para automatizar el proceso.
- Datos exportados en formatos `.csv` y `.xlsm`.

### 2. Limpieza y Organización
- Limpieza de datos con **Python (pandas)** en VSCode.
- Preparación de columnas clave (como fechas y valores duplicados).
- Eliminación de columnas innecesarias.

### 3. Diseño y Creación de la Base de Datos
- Herramienta: **MySQL Workbench**.
- Diseño de un modelo entidad-relación (ERD).
- Creación de tablas y relaciones lógicas.
- Inserción de datos automatizada con `mysql.connector`.

### 4. Análisis de Datos (Consultas SQL)
Consultas desarrolladas para responder a preguntas clave:
- ¿Cuál es el artista con más canciones en el top10 en ese periodo?
- ¿Qué género es el mejor valorado?
- ¿Cuál es la canción más popular?
- ¿Cuáles son los artistas más reconocidos?
- ¿Qué álbum fue el más valorado en ese periodo?

### 5. Presentación y Documentación
- Redacción del informe de resultados.
- Preparación de presentación final en **Canva**.
- Publicación del proyecto en **GitHub**.

## 🛠️ Herramientas y Tecnologías

- **Lenguajes:** Python, SQL
- **Bibliotecas:** `requests`, `spotipy`, `pandas`, `mysql.connector`
- **Bases de Datos:** MySQL Workbench
- **Entornos de trabajo:** VSCode, Jupyter Notebook
- **Ofimática:** Excel, Word, Canva
- **Control de versiones:** Git, GitHub
- **Metodología ágil:** SCRUM

## 📋 Metodología SCRUM

- Planificación por **sprints**.
- Roles definidos (Scrum Master: *Aida Bau*).
- Creación de backlog y definición de hitos.
- Daily meetings, sprint reviews y retrospectives.
- Documentación continua en GitHub.

## 👩‍💻 Equipo de Desarrollo

- **Aida Bau**
- **Inés García**
- **Aura Candela**
- **Irantzu Urkiola**

## 📚 Curso

**Adalab - Data Analyst Bootcamp**  
Módulo 2: Bases de Datos y SQL  
Promoción 52 – *Julia Salander*
