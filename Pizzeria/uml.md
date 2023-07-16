uml :

![Captura de pantalla 2023-07-16 023709](https://github.com/pounct/mysql-estructura/assets/53088375/dab1116f-a1c1-4ea3-b35e-cd7d96cb27aa)

phpmyadmin

![Captura de pantalla 2023-07-16 023915](https://github.com/pounct/mysql-estructura/assets/53088375/89ed69d1-260a-46f9-b2a4-613b0ce83b28)

estructura :

USE
    opticadb;
CREATE TABLE Provincia(
    id INT NOT NULL AUTO_INCREMENT,
    INDEX ind(id),
    nom VARCHAR(40) NOT NULL
); CREATE TABLE Localitat(
    id INT NOT NULL AUTO_INCREMENT,
    provinciaId INTEGER NOT NULL,
    nom VARCHAR(40) NOT NULL,
    PRIMARY KEY(id),
    INDEX ind(id),
    FOREIGN KEY(provinciaId) REFERENCES Provincia(id)
); CREATE TABLE CLIENT(
    id INT NOT NULL AUTO_INCREMENT,
    nom VARCHAR(40) NOT NULL,
    cognoms VARCHAR(80) NOT NULL,
    adreca VARCHAR(151) NOT NULL,
    codiPostal INTEGER NOT NULL,
    telefon INTEGER NOT NULL,
    INDEX ind(id)
); CREATE TABLE Producte(
    id INT NOT NULL AUTO_INCREMENT,
    nom VARCHAR(40) NOT NULL,
    descripcio VARCHAR(250) NOT NULL,
    imatge VARCHAR(120) NOT NULL,
    preu REAL NOT NULL,
    INDEX ind(id)
); CREATE TABLE Hamburguesa(
    id INT NOT NULL AUTO_INCREMENT,
    categoria VARCHAR(10),
    PRIMARY KEY(id),
    INDEX ind(id),
    FOREIGN KEY(id) REFERENCES Producte(id)
); CREATE TABLE Pizza(
    id INT NOT NULL AUTO_INCREMENT,
    categoria VARCHAR(10),
    PRIMARY KEY(id),
    INDEX ind(id),
    FOREIGN KEY(id) REFERENCES Producte(id)
); CREATE TABLE Beguda(
    id INT NOT NULL AUTO_INCREMENT,
    categoria VARCHAR(10),
    PRIMARY KEY(id),
    INDEX ind(id),
    FOREIGN KEY(id) REFERENCES Producte(id)
); CREATE TABLE Botiga(
    id INT NOT NULL AUTO_INCREMENT,
    adreca VARCHAR(150) NOT NULL,
    codiPostal INTEGER NOT NULL,
    localitatId INTEGER NOT NULL,
    PRIMARY KEY(id),
    INDEX ind(id),
    FOREIGN KEY(localitatId) REFERENCES Localitat(id)
); CREATE TABLE Empleat(
    id INT NOT NULL AUTO_INCREMENT,
    nom VARCHAR(40) NOT NULL,
    cognoms VARCHAR(80) NOT NULL,
    nif VARCHAR(11) NOT NULL,
    telefon INTEGER NOT NULL,
    botigaId INT NOT NULL,
    PRIMARY KEY(id),
    INDEX ind(id),
    FOREIGN KEY(botigaId) REFERENCES Botiga(id)
); CREATE TABLE Comanda(
    id INT NOT NULL AUTO_INCREMENT,
    dataHora VARCHAR(19) NOT NULL,
    clientId INT NOT NULL,
    botigaId INT NOT NULL,
    preuTotal REAL NOT NULL,
    PRIMARY KEY(id),
    INDEX ind(id),
    FOREIGN KEY(clientId) REFERENCES CLIENT(id),
    FOREIGN KEY(botigaId) REFERENCES Botiga(id)
); CREATE TABLE liniaComanda(
    id INT NOT NULL AUTO_INCREMENT,
    comandaId INT NOT NULL,
    producteId INT NOT NULL,
    quantitat INTEGER NOT NULL,
    PRIMARY KEY(id),
    INDEX ind(id),
    FOREIGN KEY(comandaId) REFERENCES Comanda(id),
    FOREIGN KEY(producteId) REFERENCES Producte(id)
); CREATE TABLE Repartidor(
    id INT NOT NULL AUTO_INCREMENT,
    funcio VARCHAR(10),
    PRIMARY KEY(id),
    INDEX ind(id),
    FOREIGN KEY(id) REFERENCES Empleat(id)
); CREATE TABLE Lliurament(
    id INTEGER NOT NULL,
    nom VARCHAR(40) NOT NULL,
    comandaId INT NOT NULL,
    repartidorId INTEGER NOT NULL,
    PRIMARY KEY(id),
    INDEX ind(id),
    FOREIGN KEY(comandaId) REFERENCES Comanda(id),
    FOREIGN KEY(repartidorId) REFERENCES Repartidor(id)
); CREATE TABLE Cuiner(
    id INT NOT NULL AUTO_INCREMENT,
    funcio VARCHAR(10),
    PRIMARY KEY(id),
    INDEX ind(id),
    FOREIGN KEY(id) REFERENCES Empleat(id)
);
