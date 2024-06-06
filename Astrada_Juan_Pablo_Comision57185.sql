DROP SCHEMA IF EXISTS FORMULA_1;
CREATE SCHEMA IF NOT EXISTS FORMULA_1;
USE FORMULA_1;

-- Tabla Pilotos : Detalla todos los pilotos que participaron en F1
DROP TABLE IF EXISTS Pilotos;
CREATE TABLE Pilotos (
    id_piloto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    nacionalidad VARCHAR(50) NOT NULL,
    equipo_actual VARCHAR(100) NOT NULL,
    carreras_ganadas INT NOT NULL,
    campeonatos_ganados INT NOT NULL
);

-- Tabla Equipos : Detalla todos los equipos que participaron en F1
DROP TABLE IF EXISTS Equipos;
CREATE TABLE Equipos (
    id_equipo INT AUTO_INCREMENT PRIMARY KEY,
    nombre_equipo VARCHAR(100) NOT NULL,
    pais_origen VARCHAR(50) NOT NULL,
    director VARCHAR(100) NOT NULL,
    anio_fundacion INT NOT NULL,
    campeonatos_ganados INT NOT NULL,
    sede VARCHAR(100) NOT NULL,
    chasis VARCHAR(100) NOT NULL
);

-- Tabla Circuitos : Detalla todos los circuitos de la categoria
DROP TABLE IF EXISTS Circuitos;
CREATE TABLE Circuitos (
    id_circuito INT AUTO_INCREMENT PRIMARY KEY,
    nombre_circuito VARCHAR(100) NOT NULL,
    pais VARCHAR(50) NOT NULL,
    longitud FLOAT NOT NULL,
    numero_curvas INT NOT NULL,
    anio_inauguracion INT NOT NULL,
    ciudad VARCHAR(100) NOT NULL,
    tipo VARCHAR(50) NOT NULL
);

-- Tabla Carreras : Detalla todos las carreras que se han realizado en F1
DROP TABLE IF EXISTS Carreras;
CREATE TABLE Carreras (
    id_carrera INT AUTO_INCREMENT PRIMARY KEY,
    id_circuito INT NOT NULL,
    id_temporada INT NOT NULL,
    fecha DATE NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    vueltas INT NOT NULL,
    distancia FLOAT NOT NULL,
    pole_position VARCHAR(100) NOT NULL,
    vuelta_rapida VARCHAR(100) NOT NULL,
    FOREIGN KEY (id_circuito) REFERENCES Circuitos(id_circuito),
    FOREIGN KEY (id_temporada) REFERENCES Temporadas(id_temporada)
);

-- Tabla Resultados : Detalla todos los resultados que se van obteniendo
DROP TABLE IF EXISTS Resultados;
CREATE TABLE Resultados (
    id_resultado INT AUTO_INCREMENT PRIMARY KEY,
    id_carrera INT NOT NULL,
    id_piloto INT NOT NULL,
    posicion INT NOT NULL,
    puntos FLOAT NOT NULL,
    tiempo VARCHAR(100) NOT NULL,
    vueltas_completadas INT NOT NULL,
    estado VARCHAR(50) NOT NULL,
    FOREIGN KEY (id_carrera) REFERENCES Carreras(id_carrera),
    FOREIGN KEY (id_piloto) REFERENCES Pilotos(id_piloto)
);

-- Tabla Temporadas : Detalla todas las temporadas realizadas en la categoria
DROP TABLE IF EXISTS Temporadas;
CREATE TABLE Temporadas (
    id_temporada INT AUTO_INCREMENT PRIMARY KEY,
    año YEAR NOT NULL,
    campeon_piloto INT NOT NULL,
    campeon_equipo INT NOT NULL,
    numero_carreras INT NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL,
    comentarios TEXT NOT NULL,
    FOREIGN KEY (campeon_piloto) REFERENCES Pilotos(id_piloto),
    FOREIGN KEY (campeon_equipo) REFERENCES Equipos(id_equipo)
);

-- Tabla GrandesPremios : Detalla todos grandprix corridos
DROP TABLE IF EXISTS GranPremios;
CREATE TABLE GranPremios (
    id_gran_premio INT AUTO_INCREMENT PRIMARY KEY,
    id_circuito INT NOT NULL,
    id_temporada INT NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    fecha DATE NOT NULL,
    vueltas INT NOT NULL,
    distancia FLOAT NOT NULL,
    pole_position VARCHAR(100) NOT NULL,
    vuelta_rapida VARCHAR(100) NOT NULL,
    FOREIGN KEY (id_circuito) REFERENCES Circuitos(id_circuito),
    FOREIGN KEY (id_temporada) REFERENCES Temporadas(id_temporada)
);

-- Tabla Clasificaciones : Detalla todos las clasificaciones corridas
DROP TABLE IF EXISTS Clasificaciones;
CREATE TABLE Clasificaciones (
    id_clasificacion INT AUTO_INCREMENT PRIMARY KEY,
    id_temporada INT NOT NULL,
    id_piloto INT NOT NULL,
    id_equipo INT NOT NULL,
    puntos FLOAT NOT NULL,
    posicion INT NOT NULL,
    victorias INT NOT NULL,
    podios INT NOT NULL,
    poles INT NOT NULL,
    FOREIGN KEY (id_temporada) REFERENCES Temporadas(id_temporada),
    FOREIGN KEY (id_piloto) REFERENCES Pilotos(id_piloto),
    FOREIGN KEY (id_equipo) REFERENCES Equipos(id_equipo)
);