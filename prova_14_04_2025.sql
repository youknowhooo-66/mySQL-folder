CREATE DATABASE prova14_04_2025;
USE prova14_04_2025;

CREATE TABLE aluno (
id_aluno INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(45),
email VARCHAR(45),
cpf BIGINT UNIQUE
);

CREATE TABLE disciplina (
id_disciplina INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(45),
carga_horaria INT
);

CREATE TABLE turma (
id_turma INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
disciplina_id INT NOT NULL,
turno ENUM('Matutino','Vespertino','Noturno'),
FOREIGN KEY (disciplina_id)
REFERENCES disciplina(id_disciplina)
);

CREATE TABLE inscricao (
id_inscricao INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
aluno_id INT,
turma_id INT,
dt_inscricao DATE,
FOREIGN KEY (aluno_id)
REFERENCES aluno(id_aluno),
FOREIGN KEY (turma_id)
REFERENCES turma(id_turma)
);

CREATE TABLE mensalidade (
id_mensalidade INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
inscricao_id INT NOT NULL,
dt_vencimento DATE,
valor DECIMAL(8,2),
status_pagamento ENUM ('Fatura Paga', 'Em Débito'),
FOREIGN KEY (inscricao_id)
REFERENCES inscricao(id_inscricao)
);



INSERT INTO aluno (id_aluno, nome, email, cpf) VALUES
(1, 'Maycon Gibson Neves dos Santos', 'youknowhooo@icloud.com', 03480002277),
(2, 'Maria de Freitas Gonsálvez', 'Maria@icloud.com', 09845702244),
(3, 'Mauricio de Leila Litoral', 'Mauricio@icloud.com', 1259863455),
(4, 'Marvin Argora Sóvocê', 'Marvin@icloud.com', 04630092284),
(5, 'Max Stell Skywalker', 'Skywalker@icloud.com', 65430982277);


INSERT INTO disciplina (id_disciplina, nome, carga_horaria) VALUES
(1,'Matemática',200),
(2,'Física',190),
(3,'Química',170),
(4,'Geografia',150),
(5,'História',150);

INSERT INTO turma (id_turma, disciplina_id, turno) VALUES
(1,1,'Matutino'),
(2,2,'Vespertino'),
(3,3,'Noturno'),
(4,4,'Noturno'),
(5,5,'Matutino');

INSERT INTO inscricao (id_inscricao,dt_inscricao,aluno_id,turma_id) VALUES
(1,'2024-01-01',4,1),
(2,'2024-01-01',3,2),
(3,'2024-01-01',2,3),
(4,'2024-06-01',4,1),
(5,'2024-06-01',3,2),
(6,'2024-06-01',2,3);

INSERT INTO inscricao (id_inscricao,dt_inscricao) VALUES
(7,'2024-01-01');

INSERT INTO mensalidade (id_mensalidade, dt_vencimento, valor, status_pagamento, inscricao_id) VALUES
(1,'2024-01-05',600,'Fatura Paga',1),
(2,'2024-01-05',600,'Fatura Paga',2),
(3,'2024-01-05',600,'Fatura Paga',3),
(4,'2024-06-05',700,'Em Débito',4),
(5,'2024-06-05',700,'Em Débito',5),
(6,'2024-06-05',700,'Em Débito',6);


SELECT * FROM mensalidade WHERE status_pagamento = 'Em Débito';

SELECT inscricao_id, dt_vencimento, valor FROM mensalidade;

SELECT id_inscricao, dt_inscricao, valor
FROM mensalidade JOIN inscricao
ON mensalidade.inscricao_id = inscricao.id_inscricao;

SELECT inscricao.*, aluno.*
FROM inscricao
LEFT JOIN aluno ON inscricao.aluno_id = aluno.id_aluno;

SELECT inscricao.*, turma.*
FROM inscricao
RIGHT JOIN turma ON inscricao.turma_id = turma.id_turma;

SELECT inscricao.id_inscricao, aluno.nome, aluno.email, turma.turno
FROM inscricao
JOIN aluno ON inscricao.aluno_id = aluno.id_aluno
JOIN turma ON inscricao.turma_id = turma.id_turma;

SELECT inscricao.*, aluno.*
FROM inscricao
LEFT JOIN aluno ON inscricao.aluno_id = aluno.id_aluno
UNION
SELECT inscricao.*, aluno.*
FROM inscricao
RIGHT JOIN aluno ON inscricao.aluno_id = aluno.id_aluno;

SELECT inscricao.id_inscricao, aluno.nome AS 'Nome do Aluno', aluno.email AS 'Email do Aluno'
FROM inscricao
JOIN aluno ON inscricao.aluno_id = aluno.id_aluno;

CREATE VIEW vw_inscricao_aluno AS
SELECT inscricao.id_inscricao, aluno.nome AS 'Nome do Aluno', aluno.email AS 'Email do Aluno'
FROM inscricao
JOIN aluno ON inscricao.aluno_id = aluno.id_aluno;

DROP DATABASE prova14_04_2025;