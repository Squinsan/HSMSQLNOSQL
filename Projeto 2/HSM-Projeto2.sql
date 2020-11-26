CREATE DATABASE HSM;

USE HSM;

CREATE TABLE Cliente(
ID int PRIMARY KEY not null auto_increment unique,
Nome varchar(60) not null,
Telefone varchar(20) unique,
LimiteCredito double not null,
ID_STATUS int not null
);

CREATE TABLE StatusCliente(
ID int PRIMARY KEY not null auto_increment unique,
Nome varchar(20) not null
);

CREATE TABLE Pedido(
ID int PRIMARY KEY not null auto_increment unique,
Nome varchar(15) not null,
Preco double not null,
DataRealizacao date not null
);

CREATE TABLE Categoria(
ID int PRIMARY KEY not null auto_increment unique,
Nome varchar(30) not null
);

CREATE TABLE Produto(
ID int PRIMARY KEY not null auto_increment unique,
Nome varchar(30) not null,
ID_CATEGORIA int not null
);
CREATE TABLE Pedido_Contem_Produto(
ID_PEDIDO int not null,
ID_PRODUTO int not null,
Quantidade int not null
);

ALTER TABLE Cliente ADD CONSTRAINT ID_STATUS FOREIGN KEY (ID) REFERENCES StatusCliente(ID);

ALTER TABLE Produto ADD CONSTRAINT ID_CATEGORIA FOREIGN KEY (ID) REFERENCES Categoria(ID);

ALTER TABLE Pedido_Contem_Produto ADD CONSTRAINT ID_PEDIDO FOREIGN KEY (ID_PEDIDO) REFERENCES Pedido(ID);

ALTER TABLE Pedido_Contem_Produto ADD CONSTRAINT ID_PRODUTO FOREIGN KEY (ID_PRODUTO) REFERENCES Produto(ID);