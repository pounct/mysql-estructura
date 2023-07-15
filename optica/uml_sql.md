
class-diagram-Cul d'Ampolla
uml :
![image](https://github.com/pounct/mysql-estructura/assets/53088375/4c787d17-9d46-472a-ae2e-cbb232ecb765)


conceptor phpmyadmin:

![image](https://github.com/pounct/mysql-estructura/assets/53088375/295f13f4-ad93-4670-b56a-be46e65edcb1)


USE opticadb;
CREATE TABLE Empleat(
    id INT NOT NULL AUTO_INCREMENT,
    nom VARCHAR(40) NOT NULL,
    PRIMARY KEY(id)
); CREATE TABLE Marca(
    id INT NOT NULL AUTO_INCREMENT,
    nom VARCHAR(40) NOT NULL,
    PRIMARY KEY(id)
); CREATE TABLE Adreca(
    id INT NOT NULL AUTO_INCREMENT,
    carrer VARCHAR(100) NOT NULL,
    numero INTEGER NOT NULL,
    pis INTEGER NOT NULL,
    porta INTEGER NOT NULL,
    ciutat VARCHAR(40) NOT NULL,
    codiPostal INTEGER NOT NULL,
    pais VARCHAR(40) NOT NULL,
    PRIMARY KEY(id)
); CREATE TABLE Proveidor(
    id INT NOT NULL AUTO_INCREMENT,
    nom VARCHAR(40) NOT NULL,
    adrecaId INT NOT NULL,
    telefon INTEGER NOT NULL,
    fax INTEGER NOT NULL,
    nif VARCHAR(60) NOT NULL,
    PRIMARY KEY(id),
    INDEX ind(nom),
    FOREIGN KEY(adrecaId) REFERENCES Adreca(id)
); CREATE TABLE Compra(
    id INT NOT NULL AUTO_INCREMENT,
    dataC VARCHAR(10) NOT NULL,
    preuTotal REAL NOT NULL,
    poveidorId INT NOT NULL,
    PRIMARY KEY(id),
    INDEX ind(dataC),
    FOREIGN KEY(poveidorId) REFERENCES Proveidor(id)
); CREATE TABLE CLIENT(
    id INT NOT NULL AUTO_INCREMENT,
    nom VARCHAR(40) NOT NULL,
    adrecaId INT NOT NULL,
    telefon INTEGER NOT NULL,
    email VARCHAR(60) NOT NULL,
    dataRegistre VARCHAR(10) NOT NULL,
    PRIMARY KEY(id),
    INDEX ind(nom),
    FOREIGN KEY(adrecaId) REFERENCES Adreca(id)
); CREATE TABLE Venta(
    id INT NOT NULL AUTO_INCREMENT,
    dataV VARCHAR(10) NOT NULL,
    clientId INT NOT NULL,
    empleatId INT NOT NULL,
    preuTotal REAL NOT NULL,
    PRIMARY KEY(id),
    INDEX ind(dataV),
    FOREIGN KEY(clientId) REFERENCES CLIENT(id),
    FOREIGN KEY(empleatId) REFERENCES Empleat(id)
); CREATE TABLE Ulleres(
    id INT NOT NULL AUTO_INCREMENT,
    graduacioVidres INT NOT NULL,
    tipusMuntura VARCHAR(40) NOT NULL,
    colorMuntura VARCHAR(40) NOT NULL,
    ColorVidre VARCHAR(40) NOT NULL,
    preu REAL NOT NULL,
    marcaId INT NOT NULL,
    compraId INT NOT NULL,
    ventaId INT,
    PRIMARY KEY(id),
    INDEX ind(compraId),
    FOREIGN KEY(compraId) REFERENCES Compra(id) ON DELETE CASCADE,
    FOREIGN KEY(marcaId) REFERENCES Marca(id),
    FOREIGN KEY(ventaId) REFERENCES Venta(id)
);
----> a llenar**

INSERT INTO t1 (v1, v2) VALUES(256, 256);


