
CREATE DATABASE familia;

USE familia;

CREATE TABLE filho(
id_filho INT NOT NULL AUTO_INCREMENT,
nome_filho VARCHAR(45),
PRIMARY KEY (id_filho)
);

CREATE TABLE pai(
id_pai INT NOT NULL AUTO_INCREMENT,
nome_pai VARCHAR(45),
filho_id INT,
FOREIGN KEY (filho_id)
references filho (id_filho),
PRIMARY KEY (id_pai)
);

INSERT INTO filho
(nome_filho)
VALUES
('Joaozinho'),
('Mariazinha'),
('Carlinha'),
('Aninha');

INSERT INTO pai
(nome_pai, filho_id)
VALUES
('Antonio', 4),
('Antonio', 3),
('Carlos', 2);

INSERT INTO pai
(nome_pai)
VALUES
('Mateus');

SELECT * FROM filho;
SELECT * FROM pai;

SELECT pai.nome_pai, filho.nome_filho FROM pai
JOIN filho ON filho.id_filho = pai.filho_id;

SELECT pai.nome_pai, filho.nome_filho FROM pai
RIGHT JOIN filho ON filho.id_filho = pai.filho_id;

SELECT pai.nome_pai, filho.nome_filho FROM pai
LEFT JOIN filho ON filho.id_filho = pai.filho_id;

CREATE VIEW fulljoin AS
SELECT pai.nome_pai, filho.nome_filho FROM pai
LEFT JOIN filho ON filho.id_filho = pai.filho_id
UNION
SELECT pai.nome_pai, filho.nome_filho FROM pai
RIGHT JOIN filho ON filho.id_filho = pai.filho_id;