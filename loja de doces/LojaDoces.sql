CREATE DATABASE loja_doces;

USE loja_doces;

CREATE TABLE tb_clientes
(
	id_cliente int NOT NULL IDENTITY PRIMARY KEY,
	nome varchar(30) NOT NULL,
	sexo bit NOT NULL,
	nascimento date NOT NULL
)

CREATE TABLE tb_produtos 
(
	id_produto int NOT NULL IDENTITY PRIMARY KEY,
	descricao varchar(100) NOT NULL,
	peso float NOT NULL,
	valor decimal(10,2) NOT NULL
)

CREATE TABLE tb_vendas
(
	id_venda int NOT NULL IDENTITY PRIMARY KEY,
	id_cliente int NOT NULL,
	data_hora datetime NOT NULL,
	valor_total decimal(10,2) NOT NULL,
	FOREIGN KEY (id_cliente) REFERENCES tb_clientes(id_cliente)
)

CREATE TABLE tb_itens_venda 
(
	id_item_venda int NOT NULL IDENTITY PRIMARY KEY,
	id_venda int NOT NULL,
	id_produto int NOT NULL,
	quantidade int NOT NULL,
	valor_unidade decimal(10,2) NOT NULL,
	FOREIGN KEY (id_venda) REFERENCES tb_vendas(id_venda),
	FOREIGN KEY (id_produto) REFERENCES tb_produtos(id_produto)
)

INSERT INTO tb_clientes(nome, nascimento, sexo)
VALUES 
('Leo Jahu', '1500-08-20', 0),
('Gerso Rodrigo', '1995-03-10', 0),
('Ana DeideCosta', '2000-11-25', 1),
('Pedro Arrocha', '1978-07-30', 0);

INSERT INTO tb_produtos(descricao, valor, peso)
VALUES 
('Beijinho', 2.00, 0.04),
('Cajuzinho', 2.50, 0.05),
('Olho de Sogra', 3.00, 0.06),
('Bem Casado', 1.50, 0.03),
('Pudim', 5.00, 0.20);

INSERT INTO tb_vendas(id_cliente, data_hora, valor_total)
VALUES (1, GETDATE(), 11.50); 

INSERT INTO tb_itens_venda(id_venda, id_produto, quantidade, valor_unidade)
VALUES 
(1, 1, 3, 2.50), 
(1, 2, 2, 2.00); 

SELECT * FROM tb_clientes;
SELECT * FROM tb_produtos;
SELECT * FROM tb_vendas;
SELECT * FROM tb_itens_venda;