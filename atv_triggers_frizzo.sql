CREATE DATABASE atv_trigger;
USE atv_trigger;

CREATE TABLE produtos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    preco DECIMAL(10,2),
    estoque INT
);

create trigger cadastrar_produtos 
after insert on produtos
for each row insert into log_eventos (id,data_evento,descricao)
values (NEW.id, NOW(), CONCAT('Inserindo produto:',NEW.nome,NEW.preco));

create trigger exclusao_produtos
before delete on produtos
for each row insert into log_eventos(id,data_evento,descricao)
values (OLD.id, NOW(), CONCAT('Exclusão do produto:',OLD.nome,OLD.preco));

CREATE TABLE clientes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    email VARCHAR(100) UNIQUE
);

create trigger cadastrar_clientes 
after insert on clientes 
for each row insert into log_eventos (id,data_evento,descricao)
values (NEW.id, NOW(), CONCAT('Cadastrando cliente:',NEW.nome,NEW.email));

create trigger exclusão_clientes
before delete on clientes
for each row insert into log_eventos (id,data_evento,descricao)
values(OLD.id, NOW(), CONCAT('Excluindo cliente:',OLD.nome,OLD.email));

CREATE TABLE log_eventos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    entidade VARCHAR(50),
    acao VARCHAR(20),
    descricao TEXT,
    data_evento DATETIME DEFAULT CURRENT_TIMESTAMP
);
