CREATE DATABASE LojaY;
USE LojaY;

CREATE TABLE representante (
id_representante INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(45),
cnpj BIGINT UNIQUE
);

CREATE TABLE produto (
id_produto INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(45),
codigo VARCHAR(45),
estoque INT
);

CREATE TABLE compra (
id_compra INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
data_horario DATETIME,
quantidade INT,
produto_id INT,
representante_id INT,
FOREIGN KEY (produto_id) REFERENCES produto (id_produto),
FOREIGN KEY (representante_id) REFERENCES representante (id_representante)
);

INSERT INTO representante (nome, cnpj) VALUES 
('Fausto Silva', 12345678901234),
('Fausto Silva', 52167843623051),
('Ana Julia', 23456789012345),
('Marcos Almeida', 34567890123456);

INSERT INTO produto (nome, codigo, estoque) VALUES 
('Macbook', 'NTB123', 10),
('Headset', 'MSE456', 50),
('Teclado', 'TCL789', 30),
('TV Samsung', 'MON101', 20),
('Impressora HD', 'IMP202', 15);

SELECT MAX(estoque) AS max_estoque FROM produto;
SELECT MIN(estoque) AS min_estoque FROM produto;

DELIMITER //

CREATE TRIGGER reduzir_estoque
BEFORE INSERT ON compra
FOR EACH ROW
BEGIN
    DECLARE estoque_atual INT;
    
    SELECT estoque INTO estoque_atual FROM produto WHERE id_produto = NEW.produto_id;
    
    IF estoque_atual < NEW.quantidade THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Erro: Estoque insuficiente para realizar a compra';
    ELSE
        UPDATE produto SET estoque = estoque - NEW.quantidade WHERE id_produto = NEW.produto_id;
    END IF;
END;

// DELIMITER ;

SHOW TRIGGERS FROM LojaY;

INSERT INTO compra (data_horario, quantidade, produto_id, representante_id) VALUES 
('2025-06-16 10:00:00', 2, 1, 1),
('2025-06-16 11:00:00', 1, 2, 1),
('2025-06-16 12:00:00', 3, 3, 2),
('2025-06-16 13:00:00', 2, 4, 2),
('2025-06-16 14:00:00', 1, 5, 3),
('2025-06-16 15:00:00', 2, 1, 3);

CREATE VIEW view_media_compra AS
SELECT produto_id, AVG(quantidade) AS media_quantidade
FROM compra
GROUP BY produto_id;

SELECT nome FROM representante;
SELECT DISTINCT nome FROM representante;
SELECT nome FROM representante GROUP BY nome;

