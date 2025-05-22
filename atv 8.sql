CREATE DATABASE PostoCombustivel;
USE PostoCombustivel;

CREATE TABLE Veiculo (
    id INT PRIMARY KEY AUTO_INCREMENT,
    placa VARCHAR(10) UNIQUE NOT NULL,
    modelo VARCHAR(50) NOT NULL
);

CREATE TABLE Posto (
    id INT PRIMARY KEY AUTO_INCREMENT,
    estoque DECIMAL(10,2) NOT NULL
);

CREATE TABLE Abastecimento (
    id INT PRIMARY KEY AUTO_INCREMENT,
    veiculo_id INT NOT NULL,
    posto_id INT NOT NULL,
    quantidade DECIMAL(10,2) NOT NULL,
    preco_total DECIMAL(10,2) GENERATED ALWAYS AS (quantidade * 6.50) STORED,
    data_abastecimento DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (veiculo_id) REFERENCES Veiculo(id),
    FOREIGN KEY (posto_id) REFERENCES Posto(id)
);

DELIMITER $$

CREATE TRIGGER VerificaEstoqueAntesDeAbastecer
BEFORE INSERT ON Abastecimento
FOR EACH ROW
BEGIN
    DECLARE estoque_atual DECIMAL(10,2);
    SELECT estoque INTO estoque_atual FROM Posto WHERE id = NEW.posto_id;
    
    IF NEW.quantidade > estoque_atual THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Estoque insuficiente para realizar o abastecimento.';
    ELSE
        UPDATE Posto SET estoque = estoque - NEW.quantidade WHERE id = NEW.posto_id;
    END IF;
END$$

DELIMITER ;

INSERT INTO Posto (estoque) VALUES (1000.00); -- Inicializa o posto com 1000 litros de gasolina
