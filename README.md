# mysql-estructura
![class-diagram-Cul d'Ampolla](https://github.com/pounct/mysql-estructura/assets/53088375/7be95fed-d35a-48d5-b7a6-ec9eba675600)



CREATE DATABASE opticadb;

USE opticadb;

CREATE TABLE Ulleres
(
    id int NOT NULL AUTO_INCREMENT,
    graduacioVidres int NOT NULL,
    tipusMuntura String NOT NULL,
    colorMuntura String NOT NULL,
    ColorVidre String NOT NULL,
    preu Real NOT NULL,
    marca int NOT NULL,
    compra int NOT NULL,
    venta int,
    PRIMARY KEY (id)  
);

CREATE TABLE Marca
(
    id Integer NOT NULL,
    nom String NOT NULL,
    PRIMARY KEY (id) 
);

CREATE TABLE Compra
(
    id Integer NOT NULL,
    data String NOT NULL,
    preuTotal Real NOT NULL,
    poveidor int NOT NULL,
    PRIMARY KEY (id) 
);

CREATE TABLE Client
(
    identificador Integer NOT NULL,
    nom String NOT NULL,
    cognoms String NOT NULL,
    adreca int NOT NULL,
    codiPostal Integer NOT NULL,
    localitat String NOT NULL,
    provincia String NOT NULL,
    telefon Integer NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE Venta
(
    id Integer NOT NULL,
    data String NOT NULL,
    client int NOT NULL,
    preuTotal Real NOT NULL
    PRIMARY KEY (id)
);

CREATE TABLE Client
(
    id Integer NOT NULL,
    nom String NOT NULL,
    adreca int NOT NULL,
    telefon Integer NOT NULL,
    email String NOT NULL,
    dataRegistre String NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE Empleat
(
    id Integer NOT NULL,
    nom String NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE Proveidor
(
    id Integer NOT NULL,
    nom String NOT NULL,
    adreca int NOT NULL,
    telefon Integer NOT NULL,
    fax Integer NOT NULL,
    nif String NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE Adreca
(
    id Integer NOT NULL,
    carrer String NOT NULL,
    numero Integer NOT NULL,
    pis Integer NOT NULL,
    porta Integer NOT NULL,
    ciutat String NOT NULL,
    codiPostal Integer NOT NULL,
    pais String NOT NULL,
    PRIMARY KEY (id)
);

----> a llenar

