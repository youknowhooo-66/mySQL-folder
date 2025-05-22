DROP DATABASE Consultas;

CREATE DATABASE Consultas;
USE Consultas;

CREATE TABLE cliente (
id_cliente INT NOT NULL AUTO_INCREMENT,
nome VARCHAR(45),
cidade VARCHAR(45),
PRIMARY KEY (id_cliente)
);

CREATE TABLE acompanhamento (
id_acompanhamento INT NOT NULL AUTO_INCREMENT,
situacao VARCHAR (45),
PRIMARY KEY (id_acompanhamento)
);

CREATE TABLE pedido (
id_pedido INT NOT NULL AUTO_INCREMENT,
data_pedido DATE,
valor DECIMAL (8,2),
cliente_id INT,
acompanhamento_id INT,
PRIMARY KEY (id_pedido),
FOREIGN KEY (cliente_id) REFERENCES cliente (id_cliente),
FOREIGN KEY (acompanhamento_id) REFERENCES acompanhamento (id_acompanhamento)
);

INSERT INTO cliente (id_cliente, nome, cidade) VALUES
(1, 'João', 'Macaé'),
(2, 'Carlos', 'Salvador'),
(3, 'Maria', 'Niteroi'),
(4, 'Ana', 'Campinas'),
(5, 'Marcos', 'Santos');

INSERT INTO acompanhamento (id_acompanhamento, situacao) VALUES
(1, 'Registrado'),
(2, 'Em transporte'),
(3, 'Entregue');

INSERT INTO pedido (id_pedido, data_pedido, valor, cliente_id, acompanhamento_id) VALUES
(1, '2024-09-24', 250.00, 2, 1),
(2, '2024-09-25', 150.00, 4, 2),
(3, '2024-09-25', 450.00, 1, 3);



SELECT * FROM Cliente;
SELECT * FROM Acompanhamento;
SELECT * FROM Pedido;

SELECT * FROM pedido JOIN cliente ON pedido.cliente_id = cliente.id_cliente;
 
SELECT * FROM pedido 
JOIN cliente 
ON pedido.cliente_id = cliente.id_cliente 
JOIN acompanhamento 
ON pedido.acompanhamento_id = acompanhamento.id_acompanhamento;

SELECT pedido.id_pedido, pedido.data_pedido, cliente.nome, acompanhamento.situacao FROM pedido 
JOIN cliente 
ON pedido.cliente_id = cliente.id_cliente 
JOIN acompanhamento 
ON pedido.acompanhamento_id = acompanhamento.id_acompanhamento;

CREATE VIEW vw_consulta_pedido_situacao AS
SELECT pedido.id_pedido, pedido.data_pedido, cliente.nome, acompanhamento.situacao
FROM pedido 
JOIN cliente ON pedido.cliente_id = cliente.id_cliente 
JOIN acompanhamento ON pedido.acompanhamento_id = acompanhamento.id_acompanhamento;

SELECT * FROM pedido WHERE cliente_id NOT IN (SELECT id_cliente FROM cliente);
SELECT * FROM pedido WHERE acompanhamento_id NOT IN (SELECT id_acompanhamento FROM acompanhamento);
SELECT * FROM pedido WHERE cliente_id IS NULL OR acompanhamento_id IS NULL;

CREATE DATABASE atv_avaliativa;
USE atv_avaliativa;

CREATE TABLE aluno (
id_aluno INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR (100)
);

CREATE TABLE curso (
id_curso INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR (100),
duracao INT
);

CREATE TABLE inscricao (
id_inscricao INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
dt_inscricao DATE,
aluno_id INT NOT NULL,
curso_id INT,
FOREIGN KEY (curso_id) REFERENCES curso(id_curso),
FOREIGN KEY (aluno_id) REFERENCES aluno(id_aluno)
);

CREATE TABLE mensalidade (
id_mensalidade INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
inscricao_id INT,
dt_vencimento DATE,
valor DECIMAL(8,2),
status_pagamento ENUM ('PAGO', 'NÃO PAGO'),
FOREIGN KEY (inscricao_id) REFERENCES inscricao(id_inscricao)
);

INSERT INTO aluno (id_aluno, nome)
VALUES 
(1, 'João'),
(2, 'Maria'),
(3, 'Pedro'),
(4, 'Ana'),
(5, 'Lucas');

INSERT INTO curso (id_curso, nome, duracao)
VALUES 
(1, 'Matemática', 12),
(2, 'História', 10),
(3, 'Física', 8),
(4, 'Química', 6),
(5, 'Biologia', 9);

INSERT INTO inscricao (id_inscricao, aluno_id, dt_inscricao, curso_id)
VALUES
(1, 4, '2020-01-02', 4),
(2, 3, '2020-01-10', 5),
(3, 2, '2020-01-02', 2),
(4, 4, '2020-06-02', 4),
(5, 3, '2020-06-10', 3),
(6, 2, '2020-06-02', 2);

INSERT INTO mensalidade (id_mensalidade, inscricao_id, dt_vencimento, valor, status_pagamento)
VALUES
(1, 1, '2020-01-10', 550, 'PAGO'),
(2, 1, '2020-01-10', 540, 'PAGO'),
(3, 2, '2020-01-10', 530, 'PAGO'),
(4, 4, '2020-06-10', 580, 'NÃO PAGO'),
(5, 4, '2020-06-10', 570, 'NÃO PAGO'),
(6, 5, '2020-06-10', 560, 'NÃO PAGO');

SELECT inscricao.aluno_id, SUM(mensalidade.valor) AS total_mensalidades
FROM mensalidade
JOIN inscricao ON mensalidade.inscricao_id = inscricao.Id_inscricao
GROUP BY inscricao.aluno_id;

SELECT SUM(valor) AS total_nao_pago
FROM mensalidade
WHERE status_pagamento = 'Não Pago';
