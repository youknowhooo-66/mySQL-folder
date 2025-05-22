CREATE DATABASE SistemaPedidos;
USE SistemaPedidos;

CREATE TABLE Pedido (
    id_pedido INT PRIMARY KEY AUTO_INCREMENT,
    data_horario DATETIME DEFAULT CURRENT_TIMESTAMP,
    tipo_entrega ENUM('Normal', 'Urgente') NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    quantidade INT NOT NULL,
    valor_total DECIMAL(10,2),
    valor_total_com_desconto DECIMAL(10,2)
);

DELIMITER $$

CREATE TRIGGER CalcularValoresPedido
BEFORE INSERT ON Pedido
FOR EACH ROW
BEGIN
    SET NEW.valor_total = NEW.preco * NEW.quantidade;
    SET NEW.valor_total_com_desconto = NEW.valor_total * 0.90; -- Aplicando 10% de desconto
END$$

DELIMITER ;

-- Exemplo de inserção de pedidos:
INSERT INTO Pedido (tipo_entrega, preco, quantidade) VALUES ('Urgente', 10, 6);
INSERT INTO Pedido (tipo_entrega, preco, quantidade) VALUES ('Normal', 150, 8);
INSERT INTO Pedido (tipo_entrega, preco, quantidade) VALUES ('Urgente', 130, 15);
INSERT INTO Pedido (tipo_entrega, preco, quantidade) VALUES ('Normal', 80, 3);
INSERT INTO Pedido (tipo_entrega, preco, quantidade) VALUES ('Urgente', 90, 4);
INSERT INTO Pedido (tipo_entrega, preco, quantidade) VALUES ('Normal', 15, 5);
