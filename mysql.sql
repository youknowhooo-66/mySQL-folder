CREATE DATABASE estacionamento_XPTO;
USE estacionamento_XPTO;

CREATE TABLE ticket (
id_ticket INT NOT NULL AUTO_INCREMENT,
codigo_barra INT,
PRIMARY KEY (id_ticket)
);

CREATE TABLE estacionamento (
id_estacionamento INT NOT NULL AUTO_INCREMENT,
nome VARCHAR(45),
CNPJ BIGINT(14),
ticket_id INT,
PRIMARY KEY (id_estacionamento),
FOREIGN KEY (ticket_id)
REFERENCES ticket (id_ticket)
);

CREATE TABLE setor (
id_setor INT NOT NULL AUTO_INCREMENT,
nome VARCHAR(45),
descricao VARCHAR(45),
estacionamento_id INT,
PRIMARY KEY (id_setor),
FOREIGN KEY (estacionamento_id)
REFERENCES estacionamento (id_estacionamento)
);


CREATE TABLE vaga (
id_vaga INT NOT NULL AUTO_INCREMENT,
numero_vagas INT,
setor_id INT,
PRIMARY KEY (id_vaga),
FOREIGN KEY (setor_id)
REFERENCES setor (id_setor)
);

