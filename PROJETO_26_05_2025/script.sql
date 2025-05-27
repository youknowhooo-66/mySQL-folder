CREATE DATABASE cadastro_estudantes;

USE cadastro_estudantes;

CREATE TABLE dados_estudantes (
id_estudante INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(45),
matricula VARCHAR(45)
);