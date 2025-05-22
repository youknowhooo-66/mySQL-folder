DROP TABLE IF EXISTS Pedido;
DROP TABLE IF EXISTS Livro;
DROP TABLE IF EXISTS Financiador;
DROP TABLE IF EXISTS Editora;
DROP TABLE IF EXISTS Autor;
DROP TABLE IF EXISTS Cliente;

CREATE DATABASE livraria;
USE livraria;

CREATE TABLE Autor (
    ID_Autor INT PRIMARY KEY,
    Nome_Autor VARCHAR(100) NOT NULL,
    RG_Autor VARCHAR(20)
);

CREATE TABLE Cliente (
    ID_Cliente INT PRIMARY KEY,
    Nome_Cliente VARCHAR(100) NOT NULL,
    RG_Cliente VARCHAR(20),
    CPF_Cliente VARCHAR(20)
);

CREATE TABLE Editora (
    ID_Editora INT PRIMARY KEY,
    NomeFantasia_Editora VARCHAR(100) NOT NULL,
    RazaoSocial_Editora VARCHAR(100),
    Endereco_Editora VARCHAR(255),
    Telefone_Editora VARCHAR(20)
);

CREATE TABLE Financiador (
    ID_Financiador INT PRIMARY KEY,
    Nome_Financiador VARCHAR(100) NOT NULL,
    CNPJ_Financiador VARCHAR(20)
);

CREATE TABLE Livro (
    ID_Livro INT PRIMARY KEY,
    Titulo_Livro VARCHAR(200) NOT NULL,
    Preco_Livro DECIMAL(10, 2),
    Categoria_Livro VARCHAR(100),
    ISBN_Livro VARCHAR(50),
    ID_Editora INT,
    ID_Autor INT,
    ID_Financiador INT,
    CONSTRAINT fk_editora FOREIGN KEY (ID_Editora) REFERENCES Editora(ID_Editora) ON DELETE RESTRICT,
    CONSTRAINT fk_autor FOREIGN KEY (ID_Autor) REFERENCES Autor(ID_Autor) ON DELETE RESTRICT,
    CONSTRAINT fk_financiador FOREIGN KEY (ID_Financiador) REFERENCES Financiador(ID_Financiador) ON DELETE RESTRICT
);

CREATE TABLE Pedido (
    ID_Pedido INT PRIMARY KEY,
    ID_Livro INT,
    ID_Cliente INT,
    Qtd_Pedido INT,
    CONSTRAINT fk_pedido_livro FOREIGN KEY (ID_Livro) REFERENCES Livro(ID_Livro) ON DELETE RESTRICT,
    CONSTRAINT fk_pedido_cliente FOREIGN KEY (ID_Cliente) REFERENCES Cliente(ID_Cliente) ON DELETE RESTRICT
);


INSERT INTO Autor (ID_Autor, Nome_Autor, RG_Autor) VALUES
    (1, 'Autor A', 'RG001'),
    (2, 'Autor B', 'RG002'),
    (3, 'Autor C', 'RG003'),
    (4, 'Autor D', 'RG004'),
    (5, 'Autor E', 'RG005');


INSERT INTO Cliente (ID_Cliente, Nome_Cliente, RG_Cliente, CPF_Cliente) VALUES
    (1, 'Cliente 1', 'RG1001', 'CPF1001'),
    (2, 'Cliente 2', 'RG1002', 'CPF1002'),
    (3, 'Cliente 3', 'RG1003', 'CPF1003'),
    (4, 'Cliente 4', 'RG1004', 'CPF1004'),
    (5, 'Cliente 5', 'RG1005', 'CPF1005');


INSERT INTO Editora (ID_Editora, NomeFantasia_Editora, RazaoSocial_Editora, Endereco_Editora, Telefone_Editora) VALUES
    (1, 'Editora Alfa', 'Razao Alfa', 'Rua A, 123', '1111-1111'),
    (2, 'Editora Beta', 'Razao Beta', 'Rua B, 456', '2222-2222'),
    (3, 'Editora Gamma', 'Razao Gamma', 'Rua C, 789', '3333-3333'),
    (4, 'Editora Delta', 'Razao Delta', 'Rua D, 101', '4444-4444'),
    (5, 'Editora Epsilon', 'Razao Epsilon', 'Rua E, 112', '5555-5555');

INSERT INTO Financiador (ID_Financiador, Nome_Financiador, CNPJ_Financiador) VALUES
    (1, 'Financiador X', 'CNPJ001'),
    (2, 'Financiador Y', 'CNPJ002'),
    (3, 'Financiador Z', 'CNPJ003'),
    (4, 'Financiador W', 'CNPJ004'),
    (5, 'Financiador V', 'CNPJ005');


INSERT INTO Livro (ID_Livro, Titulo_Livro, Preco_Livro, Categoria_Livro, ISBN_Livro, ID_Editora, ID_Autor, ID_Financiador) VALUES
    (1, 'Livro 1', 29.90, 'Ficção', 'ISBN001', 1, 1, 1),
    (2, 'Livro 2', 39.90, 'Policial', 'ISBN002', 2, 2, 2),
    (3, 'Livro 3', 49.90, 'Romance', 'ISBN003', 3, 3, 3),
    (4, 'Livro 4', 59.90, 'Autoajuda', 'ISBN004', 4, 4, 4),
    (5, 'Livro 5', 19.90, 'Tecnologia', 'ISBN005', 5, 5, 5);


INSERT INTO Pedido (ID_Pedido, ID_Livro, ID_Cliente, Qtd_Pedido) VALUES
    (1, 1, 1, 2),
    (2, 2, 2, 1),
    (3, 3, 3, 3),
    (4, 4, 4, 1),
    (5, 5, 5, 2);


SELECT * FROM Autor;
SELECT * FROM Cliente;
SELECT * FROM Editora;
SELECT * FROM Financiador;
SELECT * FROM Livro;
SELECT * FROM Pedido;