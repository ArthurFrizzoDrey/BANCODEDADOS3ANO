-- Quando trabalhamos com bancos de dados relacionais, as informações geralmente ficam distribuídas em várias tabelas para evitar redundância e facilitar a organização dos dados.
-- O comando JOIN é utilizado para combinar registros de duas ou mais tabelas por meio de um relacionamento entre elas, geralmente utilizando chaves primárias (PRIMARY KEY) e chaves estrangeiras (FOREIGN KEY).
-- Por que utilizar JOIN?
-- Para descobrir:
-- Quem comprou?
-- Quem vendeu?
-- Qual produto foi vendido?

create database loja2;

use loja2;

CREATE TABLE clientes (
	id_cliente INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR (100) NOT NULL,
    cpf VARCHAR (15) NOT NULL,
    telefone VARCHAR (15) NOT NULL,
    cidade VARCHAR (50),
    estado VARCHAR (2)
);

CREATE TABLE marcas (
	id_marca INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE vendedores (
	id_vendedor INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(15)
);

CREATE TABLE produtos (
    id_produto INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    quantidade INT NOT NULL,
    valor DECIMAL(10,2) NOT NULL,
    fk_id_marca INT NOT NULL,
    FOREIGN KEY (fk_id_marca) REFERENCES marcas (id_marca)
);

CREATE TABLE vendas (
	id_venda INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    data_venda DATE NOT NULL,
    valor_venda DECIMAL(10,2),
    fk_id_cliente INT NOT NULL,
    fk_id_vendedor INT NOT NULL,
    fk_id_produto INT NOT NULL,
    FOREIGN KEY (fk_id_cliente) REFERENCES clientes (id_cliente),
    FOREIGN KEY (fk_id_vendedor) REFERENCES vendedores (id_vendedor),
    FOREIGN KEY (fk_id_produto) REFERENCES produtos (id_produto)
);

INSERT INTO clientes (nome, cpf, telefone, cidade, estado) VALUES
('João Silva', '11111111111', '46999990001', 'Capanema', 'PR'),
('Maria Souza', '11111111112', '46999990002', 'Realeza', 'PR'),
('Pedro Santos', '11111111113', '46999990003', 'Dois Vizinhos', 'PR'),
('Ana Oliveira', '11111111114', '46999990004', 'Francisco Beltrão', 'PR'),
('Lucas Almeida', '11111111115', '46999990005', 'Pato Branco', 'PR'),
('Fernanda Costa', '11111111116', '46999990006', 'Ampére', 'PR'),
('Carlos Pereira', '11111111117', '46999990007', 'Barracão', 'PR'),
('Juliana Martins', '11111111118', '46999990008', 'Planalto', 'PR'),
('Rafael Gomes', '11111111119', '46999990009', 'Santo Antônio do Sudoeste', 'PR'),
('Camila Rocha', '11111111120', '46999990010', 'Salto do Lontra', 'PR');

INSERT INTO marcas (nome) VALUES
('Dell'),
('HP'),
('Lenovo'),
('Asus'),
('Samsung'),
('Apple'),
('Intel'),
('AMD'),
('Logitech'),
('TP-Link');

INSERT INTO vendedores (nome, telefone) VALUES
('Marcos Silva', '46988880001'),
('Patrícia Costa', '46988880002'),
('Eduardo Souza', '46988880003'),
('Camila Martins', '46988880004'),
('Lucas Pereira', '46988880005');

INSERT INTO produtos (nome, quantidade, valor, fk_id_marca) VALUES
('Notebook Inspiron 15', 10, 3500.00, 1),
('Notebook Pavilion', 8, 4200.00, 2),
('Notebook IdeaPad 3', 12, 3200.00, 3),
('Notebook VivoBook', 15, 3800.00, 4),
('Smartphone Galaxy A55', 20, 2100.00, 5),
('iPhone 15', 5, 5500.00, 6),
('Processador Core i5', 18, 1300.00, 7),
('Processador Ryzen 5', 15, 1250.00, 8),
('Mouse Logitech MX', 20, 450.00, 9),
('Roteador Archer C6', 20, 350.00, 10),
('Notebook Inspiron 14', 8, 3300.00, 1),
('Notebook EliteBook', 6, 4500.00, 2),
('Monitor Lenovo 24', 10, 950.00, 3),
('Monitor Asus 27', 7, 1400.00, 4),
('Galaxy Tab A9', 12, 1800.00, 5),
('MacBook Air', 4, 8500.00, 6),
('Processador Core i7', 10, 2200.00, 7),
('Processador Ryzen 7', 8, 2100.00, 8),
('Teclado Logitech K120', 30, 120.00, 9),
('Roteador Deco M4', 15, 650.00, 10);

INSERT INTO vendas (data_venda, valor_venda, fk_id_cliente, fk_id_vendedor, fk_id_produto) VALUES
('2025-01-05',3500,1,1,1),
('2025-04-08',4200,2,2,2),
('2023-01-10',3200,3,3,3),
('2025-01-12',3800,4,4,4),
('2025-01-15',2100,5,5,5),
('2023-01-18',5500,6,1,6),
('2025-01-20',1300,7,2,7),
('2025-01-22',1250,8,3,8),
('2023-04-25',450,9,4,9),
('2025-01-28',350,10,5,10),

('2025-02-02',3300,1,2,11),
('2025-02-05',4500,2,3,12),
('2023-02-08',950,3,4,13),
('2025-02-10',1400,4,5,14),
('2025-04-12',1800,5,1,15),
('2025-02-15',8500,6,2,16),
('2025-02-18',2200,7,3,17),
('2023-02-20',2100,8,4,18),
('2025-04-22',120,9,5,19),
('2025-02-25',650,10,1,20),

('2025-03-02',3500,2,2,1),
('2025-04-04',4200,3,3,2),
('2023-03-06',3200,4,4,3),
('2025-03-08',3800,5,5,4),
('2025-04-10',2100,6,1,5),
('2025-03-12',5500,7,2,6),
('2025-05-15',1300,8,3,7),
('2023-03-18',1250,9,4,8),
('2025-05-20',450,10,5,9),
('2025-03-22',350,1,1,10),

('2025-04-02',3300,2,2,11),
('2025-06-05',4500,3,3,12),
('2023-04-08',950,4,4,13),
('2025-04-10',1400,5,5,14),
('2025-06-12',1800,6,1,15),
('2025-04-15',8500,7,2,16),
('2025-04-18',2200,8,3,17),
('2025-04-20',2100,9,4,18),
('2023-06-22',120,10,5,19),
('2025-04-25',650,1,1,20);

-- Exibir os clientes e suas compras
SELECT
    c.nome,
    v.data_venda,
    v.valor_venda
FROM clientes c
INNER JOIN vendas v
ON c.id_cliente = v.fk_id_cliente where c.nome = "Maria Souza"; 

-- Exibir os produtos vendidos
SELECT
    p.nome,
    v.data_venda,
    v.valor_venda
FROM produtos p
INNER JOIN vendas v
ON p.id_produto = v.fk_id_produto where v.valor_venda = 4200;

-- Exibir clientes e produtos vendidos
SELECT
    c.nome AS cliente,
    p.nome AS produto,
    v.valor_venda
FROM vendas v
INNER JOIN clientes c
    ON v.fk_id_cliente = c.id_cliente
INNER JOIN produtos p
    ON v.fk_id_produto = p.id_produto 
	where v.valor_venda >4500 order by v.valor_venda desc;
    
-- Exibir cliente, vendedor e produto vendido
SELECT
    c.nome AS cliente,
    vd.nome AS vendedor,
    p.nome AS produto,
    v.valor_venda
FROM vendas v
INNER JOIN clientes c
    ON v.fk_id_cliente = c.id_cliente
INNER JOIN vendedores vd
    ON v.fk_id_vendedor = vd.id_vendedor
INNER JOIN produtos p
    ON v.fk_id_produto = p.id_produto where p.nome like "p%" 
    order by v.valor_venda asc;
    
-- Exibir cliente, vendedor, produto e marca vendido
SELECT
    c.nome AS cliente,
    vd.nome AS vendedor,
    p.nome AS produto,
    m.nome AS marca,
    v.valor_venda,
    v.data_venda
FROM vendas v
INNER JOIN clientes c
    ON v.fk_id_cliente = c.id_cliente
INNER JOIN vendedores vd
    ON v.fk_id_vendedor = vd.id_vendedor
INNER JOIN produtos p
    ON v.fk_id_produto = p.id_produto
INNER JOIN marcas m
    ON p.fk_id_marca = m.id_marca where m.nome = "hp"
    order by v.valor_venda desc;
    