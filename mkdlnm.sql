CREATE DATABASE escola
USE escola

CREATE TABLE turma (
    id_turma INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR (45),
    periodo VARCHAR (45),
    PRIMARY KEY (id_turma)
);