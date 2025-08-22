CREATE DATABASE ConsumoAguaDB;

USE ConsumoAguaDB;

-- Tabla principal de registros de consumo
CREATE TABLE ConsumoAgua (
    id_consumo INT AUTO_INCREMENT PRIMARY KEY,
    fecha DATE NOT NULL,
    municipio VARCHAR(100) NOT NULL,
    usuario VARCHAR(100) NOT NULL,
    consumo_m3 DECIMAL(10,2) NOT NULL,
    observaciones TEXT
);

-- Opcional: tabla de usuarios si se necesita manejar aparte
CREATE TABLE Usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(150),
    tipo_usuario ENUM('Residencial','Comercial','Industrial') NOT NULL
);

-- Relación: cada consumo pertenece a un usuario
ALTER TABLE ConsumoAgua
ADD COLUMN id_usuario INT,
ADD CONSTRAINT fk_usuario
FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario);