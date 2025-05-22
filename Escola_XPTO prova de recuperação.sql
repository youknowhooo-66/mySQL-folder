CREATE DATABASE Escola_XPTO;
USE Escola_XPTO;

CREATE TABLE aluno (
Id_aluno INT,
nome VARCHAR(45),
PRIMARY KEY (Id_aluno)
);

CREATE TABLE disciplina (
Id_disciplina INT,
nome VARCHAR(45),
qtd_créditos INT,
PRIMARY KEY (Id_disciplina)
);

CREATE TABLE turma (
Id_turma INT,
disciplina_id INT,
turno VARCHAR(45),
PRIMARY KEY (Id_turma),
FOREIGN KEY (disciplina_id) REFERENCES disciplina (Id_disciplina)
);

CREATE TABLE inscricao (
Id_inscricao INT,
aluno_id INT,
dt_inscricao DATE,
turma_id INT,
PRIMARY KEY (Id_inscricao),
FOREIGN KEY (aluno_id) REFERENCES aluno(Id_aluno),
FOREIGN KEY (turma_id) REFERENCES turma(Id_turma)
);

CREATE TABLE mensalidade (
Id_mensalidade INT,
inscricao_id INT,
dt_vencimento DATE,
Valor DECIMAL,
status_pagamento ENUM ('Pago', 'Não Pago'),
PRIMARY KEY (Id_mensalidade),
FOREIGN KEY (inscricao_id) REFERENCES inscricao(Id_inscricao)
);

USE Escola_XPTO;

INSERT INTO aluno (Id_aluno, nome) VALUES
(1, 'João Silva'),
(2, 'Maria Oliveira'),
(3, 'Pedro Santos'),
(4, 'Ana Costa'),
(5, 'Lucas Lima');

INSERT INTO disciplina (Id_disciplina, nome, qtd_créditos) VALUES
(1, 'Matemática', 4),
(2, 'Português', 3),
(3, 'História', 2),
(4, 'Geografia', 3),
(5, 'Física', 4);

INSERT INTO turma (Id_turma, disciplina_id, turno) VALUES
(1, 1, 'Manhã'),
(2, 2, 'Tarde'),
(3, 3, 'Noite'),
(4, 4, 'Manhã'),
(5, 5, 'Tarde');

INSERT INTO inscricao (Id_inscricao, dt_inscricao, aluno_id, turma_id) VALUES
(1,'2020-01-02',4,1),
(2,'2020-01-02',3,2),
(3,'2020-01-02',2,3),
(4,'2020-06-02',4,1),
(5,'2020-06-02',3,2),
(6,'2020-06-02',2,3),
(7,'2020-06-02',null,null);

INSERT INTO mensalidade (Id_mensalidade, dt_vencimento, Valor, status_pagamento, inscricao_id) VALUES
(1,'2020-01-10',550,'Pago',1),
(2,'2020-01-10',540,'Pago',2),
(3,'2020-01-10',530,'Pago',3),
(4,'2020-06-10',580,'Não pago',4),
(5,'2020-06-10',570,'Não pago',5),
(6,'2020-06-10',560,'Não pago',6);

SELECT * FROM inscricao
JOIN mensalidade ON inscricao.Id_inscricao = mensalidade.inscricao_id
WHERE mensalidade.status_pagamento = 'Pago';

SELECT inscricao_id, dt_vencimento, Valor
FROM mensalidade
ORDER BY Valor DESC;

SELECT inscricao.*, aluno.nome
FROM inscricao
JOIN aluno ON inscricao.aluno_id = aluno.Id_aluno;

SELECT inscricao.*, aluno.nome
FROM inscricao
LEFT JOIN aluno ON inscricao.aluno_id = aluno.Id_aluno;

SELECT inscricao.*, turma.turno
FROM inscricao
RIGHT OUTER JOIN turma ON inscricao.turma_id = turma.Id_turma;

SELECT inscricao.*, aluno.nome
FROM inscricao
LEFT JOIN aluno ON inscricao.aluno_id = aluno.Id_aluno
UNION ALL
SELECT inscricao.*, aluno.nome
FROM inscricao
RIGHT JOIN aluno ON inscricao.aluno_id = aluno.Id_aluno
WHERE inscricao.aluno_id IS NULL;
