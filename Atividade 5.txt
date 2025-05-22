CREATE DATABASE escola;
USE escola;

CREATE TABLE aluno (
Id_aluno INT,
nome VARCHAR(45),
PRIMARY KEY (Id_aluno)
);

CREATE TABLE curso (
Id_curso INT,
nome VARCHAR(45),
duracao INT,
PRIMARY KEY (Id_curso)
);

CREATE TABLE inscricao (
Id_inscricao INT,
aluno_id INT,
dt_inscricao DATE,
curso_id INT,
PRIMARY KEY (Id_inscricao),
FOREIGN KEY (aluno_id) REFERENCES aluno(Id_aluno),
FOREIGN KEY (curso_id) REFERENCES curso(Id_curso)
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

INSERT INTO aluno (Id_aluno, nome) VALUES
(1, 'João Silva'),
(2, 'Maria Oliveira'),
(3, 'Pedro Santos'),
(4, 'Ana Costa'),
(5, 'Lucas Lima');


INSERT INTO curso (Id_curso, nome, duracao) VALUES
(1, 'Engenharia de Software', 8),
(2, 'Ciência da Computação', 8),
(3, 'Sistemas de Informação', 8),
(4, 'Redes de Computadores', 6),
(5, 'Análise e Desenvolvimento de Sistemas', 6);


INSERT INTO inscricao (Id_inscricao, dt_inscricao, aluno_id, curso_id) VALUES
(1,'2020-01-02',4,1),
(2,'2020-01-02',3,2),
(3,'2020-01-02',2,3),
(4,'2020-06-02',4,1),
(5,'2020-06-02',3,2),
(6,'2020-06-02',2,3);


INSERT INTO mensalidade (Id_mensalidade, dt_vencimento, Valor, status_pagamento, inscricao_id) VALUES
(1,'2020-01-10',550,'Pago',1),
(2,'2020-01-10',540,'Pago',2),
(3,'2020-01-10',530,'Pago',3),
(4,'2020-06-10',580,'Não pago',4),
(5,'2020-06-10',570,'Não pago',5),
(6,'2020-06-10',560,'Não pago',6);

SELECT inscricao.aluno_id, SUM(mensalidade.Valor) AS soma_mensalidades
FROM inscricao
JOIN mensalidade ON inscricao.Id_inscricao = mensalidade.inscricao_id
GROUP BY inscricao.aluno_id;

SELECT SUM(Valor) AS soma_mensalidades_nao_pagas
FROM mensalidade
WHERE status_pagamento = 'Não Pago';

SELECT inscricao.aluno_id, AVG(mensalidade.Valor) AS valor_medio
FROM inscricao
JOIN mensalidade ON inscricao.Id_inscricao = mensalidade.inscricao_id
WHERE mensalidade.status_pagamento = 'Pago'
GROUP BY inscricao.aluno_id;

SELECT MAX(Valor) AS valor_maximo
FROM mensalidade;

SELECT MIN(Valor) AS valor_minimo
FROM mensalidade;

SELECT MIN(Valor) AS valor_minimo_nao_pago
FROM mensalidade
WHERE status_pagamento = 'Não Pago';

SELECT DISTINCT nome
FROM aluno;

SELECT nome
FROM aluno
GROUP BY nome;

SELECT SUM(Valor) AS soma_mensalidades_anteriores
FROM mensalidade
WHERE dt_vencimento < '2020-06-10';

SELECT SUM(Valor) AS soma_mensalidades_posteriores
FROM mensalidade
WHERE dt_vencimento > '2020-06-09';

SELECT SUM(Valor) AS soma_mensalidades_intervalo
FROM mensalidade
WHERE Id_mensalidade BETWEEN 2 AND 5;
