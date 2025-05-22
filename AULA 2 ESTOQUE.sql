CREATE DATABASE estoque;
USE estoque;

CREATE TABLE categoria (
id_categoria INT NOT NULL AUTO_INCREMENT,
descricao VARCHAR(45),
PRIMARY KEY (id_categoria)
);

CREATE TABLE fornecedor (
id_fornecedor INT NOT NULL AUTO_INCREMENT,
nome VARCHAR (45),
nacionalidade VARCHAR(45),
PRIMARY KEY (id_fornecedor)
);

CREATE TABLE peca (
id_peca INT NOT NULL AUTO_INCREMENT,
nome VARCHAR (45),
peso INT,
ano_fabricacao DATE,
fornecedor_id INT UNSIGNED,
categoria_id INT,
PRIMARY KEY (id_peca),
FOREIGN KEY (categoria_id) REFERENCES categoria (id_categoria),
FOREIGN KEY (fornecedor_id) REFERENCES fornecedor (id_fornecedor)
);
