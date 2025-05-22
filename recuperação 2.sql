CREATE DATABASE SistemaAuto;
USE SistemaAuto;

-- Criar tabela Cliente
CREATE TABLE Cliente (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL,
    dt_nascimento DATE NOT NULL
);

-- Criar tabela Marca
CREATE TABLE Marca (
    id_marca INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL
);

-- Criar tabela Veiculo
CREATE TABLE Veiculo (
    id_veiculo INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL,
    combustivel VARCHAR(45) NOT NULL,
    cliente_id INT,
    marca_id INT,
    FOREIGN KEY (cliente_id) REFERENCES Cliente(id_cliente),
    FOREIGN KEY (marca_id) REFERENCES Marca(id_marca)
);

-- Criar tabela Loja
CREATE TABLE Loja (
    id_loja INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL,
    rua VARCHAR(45) NOT NULL,
    cidade VARCHAR(45) NOT NULL,
    estado VARCHAR(45) NOT NULL,
    veiculo_id INT,
    FOREIGN KEY (veiculo_id) REFERENCES Veiculo(id_veiculo)
);

-- Inserção de registros
INSERT INTO Cliente (nome, dt_nascimento) VALUES 
('João Silva', '1990-05-20'),
('Maria Santos', '1985-07-15'),
('Carlos Oliveira', '2000-12-10');

INSERT INTO Marca (nome) VALUES 
('Renault'),
('BMW'),
('Audi');

INSERT INTO Veiculo (nome, combustivel, cliente_id, marca_id) VALUES 
('X1', 'Híbrido', 1, 2),
('X5', 'Gasolina', 2, 2),
('Clio', 'Flex', 1, 1),
('Q5', 'Gasolina', 2, 3),
('Sandero', 'Flex', 1, 1);

INSERT INTO Loja (nome, rua, cidade, estado, veiculo_id) VALUES 
('Auto Premium', 'Av. Paulista', 'São Paulo', 'SP', 1),
('Top Veículos', 'Rua das Flores', 'Curitiba', 'PR', 2),
('Car Market', 'Av. Brasil', 'Rio de Janeiro', 'RJ', 3);

-- Consultas SQL:

-- a) Liste os veículos, marca do cliente id 1
SELECT Veiculo.nome AS Veiculo, Marca.nome AS Marca
FROM Veiculo
JOIN Marca ON Veiculo.marca_id = Marca.id_marca
WHERE Veiculo.cliente_id = 1;

-- b) Liste todos os nomes de marcas do cliente id 2
SELECT DISTINCT Marca.nome
FROM Veiculo
JOIN Marca ON Veiculo.marca_id = Marca.id_marca
WHERE Veiculo.cliente_id = 2;

-- c) Realize um JOIN entre as tabelas Cliente, Veiculo e Marca
SELECT Cliente.nome AS Cliente, Veiculo.nome AS Veiculo, Marca.nome AS Marca
FROM Cliente
JOIN Veiculo ON Cliente.id_cliente = Veiculo.cliente_id
JOIN Marca ON Veiculo.marca_id = Marca.id_marca;

-- d) Realize um LEFT JOIN entre as tabelas Veiculo e Marca
SELECT Veiculo.nome AS Veiculo, Marca.nome AS Marca
FROM Veiculo
LEFT JOIN Marca ON Veiculo.marca_id = Marca.id_marca;

-- e) Realize um RIGHT JOIN entre as tabelas Cliente e Veiculo
SELECT Cliente.nome AS Cliente, Veiculo.nome AS Veiculo
FROM Cliente
RIGHT JOIN Veiculo ON Cliente.id_cliente = Veiculo.cliente_id;

-- f) Realize um FULL JOIN entre as tabelas Veiculo e Marca
SELECT Veiculo.nome AS Veiculo, Marca.nome AS Marca
FROM Veiculo
LEFT JOIN Marca ON Veiculo.marca_id = Marca.id_marca
UNION
SELECT Veiculo.nome AS Veiculo, Marca.nome AS Marca
FROM Veiculo
RIGHT JOIN Marca ON Veiculo.marca_id = Marca.id_marca;

-- g) Realize um JOIN entre as tabelas Veiculo e Marca, ordenando alfabeticamente
SELECT Veiculo.nome AS Veiculo, Marca.nome AS Marca
FROM Veiculo
JOIN Marca ON Veiculo.marca_id = Marca.id_marca
ORDER BY Veiculo.nome ASC;

-- h) Criar uma VIEW com o comando acima
CREATE VIEW vw_veiculo_marca AS
SELECT Veiculo.nome AS Veiculo, Marca.nome AS Marca
FROM Veiculo
JOIN Marca ON Veiculo.marca_id = Marca.id_marca
ORDER BY Veiculo.nome ASC;
