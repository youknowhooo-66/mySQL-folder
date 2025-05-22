CREATE DATABASE escola;
USE escola;

CREATE TABLE sala (
id_sala INT NOT NULL AUTO_INCREMENT,
nome_sala VARCHAR (45),
capacidade_de_sala INT,
PRIMARY KEY (id_sala)
);

CREATE TABLE turma (
id_turma INT NOT NULL AUTO_INCREMENT,
nome_turma VARCHAR (45),
periodo VARCHAR (45),
sala_id INT,
PRIMARY KEY (id_turma),
FOREIGN KEY (sala_id) REFERENCES sala (id_sala)
);

CREATE TABLE professor (
id_professor INT NOT NULL AUTO_INCREMENT,
nome_prof VARCHAR (45),
formacao_prof VARCHAR (45),
turma_id INT,
PRIMARY KEY (id_professor),
FOREIGN KEY (turma_id)
REFERENCES turma (id_turma)
);

CREATE TABLE aulas (
id_aulas INT NOT NULL AUTO_INCREMENT,
nome_aula VARCHAR (45),
professor_id INT,
PRIMARY KEY (id_aulas),
FOREIGN KEY (professor_id) REFERENCES professor (id_professor)
);
