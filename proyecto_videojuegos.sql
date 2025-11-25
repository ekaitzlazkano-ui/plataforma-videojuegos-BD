CREATE DATABASE videojuegos;
USE videojuegos;
CREATE TABLE pais(	cod_pai INT PRIMARY KEY,
					nombre VARCHAR(20) NOT NULL
);
CREATE TABLE categoria(	cod_cat INT PRIMARY KEY,
						nombre VARCHAR(50) NOT NULL
);
CREATE TABLE empresa(	cod_emp INT PRIMARY KEY,
						nombre VARCHAR(40) NOT NULL,
                        fecha_fundacion DATE,
                        cod_pai INT,
                        FOREIGN KEY (cod_pai) REFERENCES pais(cod_pai)
);
CREATE TABLE videojuego(	cod_vid INT PRIMARY KEY,
							titulo VARCHAR(200) NOT NULL,
							precio DECIMAL(6,2),
                            fecha_lanzamiento DATE,
                            valoracion DECIMAL (2,1),
                            cod_emp INT,
                            cod_cat INT,
                            FOREIGN KEY (cod_emp) REFERENCES empresa(cod_emp),
                            FOREIGN KEY (cod_cat) REFERENCES categoria(cod_cat)
);
CREATE TABLE usuario(	cod_usu INT PRIMARY KEY,
						nombre VARCHAR(20),
                        alias VARCHAR(20) UNIQUE NOT NULL,
                        email VARCHAR(60) UNIQUE NOT NULL,
                        fecha_registro DATE,
                        cod_pai INT,
                        FOREIGN KEY (cod_pai) REFERENCES pais(cod_pai)
);
CREATE TABLE logro(	cod_log INT PRIMARY KEY,
					nombre VARCHAR(300) NOT NULL,
                    cod_vid INT,
                    FOREIGN KEY (cod_vid) REFERENCES videojuego(cod_vid)
);
CREATE TABLE sesion(cod_ses INT PRIMARY KEY,
					fecha DATE,
                    hora_inicio	TIME,
                    tiempo_jugado TIME,
                    cod_vid INT,
                    cod_usu INT,
                    FOREIGN KEY (cod_vid) REFERENCES videojuego(cod_vid),
                    FOREIGN KEY (cod_usu) REFERENCES usuario(cod_usu)
);
CREATE TABLE reseña(	cod_res INT PRIMARY KEY,
						fecha DATE,
                        puntuacion DECIMAL(2,1),
                        comentario VARCHAR(300),
                        cod_vid INT,
                        cod_usu INT,
                        FOREIGN KEY (cod_vid) REFERENCES videojuego(cod_vid),
                        FOREIGN KEY (cod_usu) REFERENCES usuario(cod_usu)
);
CREATE TABLE logrado(	cod_log INT,
						cod_usu INT,
						fecha DATE,
                        PRIMARY KEY(cod_log, cod_usu),
                        FOREIGN KEY (cod_log) REFERENCES logro(cod_log),
                        FOREIGN KEY (cod_usu) REFERENCES usuario(cod_usu)
);
show tables from videojuegos;