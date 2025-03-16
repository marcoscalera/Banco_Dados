-- 1) Crie o banco que represente uma lojinha de esculturas
-- 2) Crie uma estrutura com 3 tabelas relacionadas que com Clientes, Produtos e Vendas. Sempre 1 produto apenas por venda.
--	 a) Clientes devem ter: nome, nascimento e sexo
--	 b) Produtos devem ter: descrição, valor e peso
--	 c) Venda deve ter data e hora da venda e os demais campos necessários

CREATE DATABASE a04_t01;

USE a04_t01;

CREATE TABLE tb_clientes
(
	id_cliente int NOT NULL IDENTITY PRIMARY KEY,
	nome varchar(30) NOT NULL,
	sexo bit NOT NULL,
	nascimento datetime2 NOT NULL
)

CREATE TABLE tb_produtos 
(
	id_produto int NOT NULL IDENTITY PRIMARY KEY,
	descricao varchar(100) NOT NULL,
	peso_kg float NOT NULL,
	valor money NOT NULL
)

CREATE TABLE tb_venda
(
	id_produto int NOT NULL,
	id_cliente int NOT NULL,
	id_venda int NOT NULL IDENTITY PRIMARY KEY,
	data_venda datetime2 NOT NULL,

	CONSTRAINT id_produto FOREIGN KEY (id_produto)
		REFERENCES tb_produtos (id_produto),
	
	CONSTRAINT id_cliente FOREIGN KEY (id_cliente)
		REFERENCES tb_clientes (id_cliente)
)

SELECT * FROM tb_clientes;
SELECT * FROM tb_produtos;
SELECT * FROM tb_venda;

INSERT INTO tb_clientes 
(nome, sexo, nascimento)
VALUES
('Ronaldo', 1, '09/09/2000'),
('Roberta', 0, '19/09/1999'),
('Jubliscleide', 0, '12/01/2004'),
('Josdolfo', 1, '02/11/2009')

INSERT INTO tb_produtos
(descricao, peso_kg, valor)
VALUES 
('Sarcógrafo de Ramsés II', 2000, 1000000),
('Olho de Odin semi-novo (usado uma vez)', 1, 200),
('Estátua do Luva de Pedreiro: Mármore Tamanho Real', 80, 5050),
('Troféu de Ouro da Copa do Mundo: 2022 Edition', 5, 20000)

INSERT INTO tb_venda
(id_produto, id_cliente, data_venda)
VALUES 
(2, 1, '20/08/2000 09:20:30'),
(3, 4, '02/10/2004 05:40:30'),
(4, 3, '10/05/2000 19:24:30'),
(1, 2, '20/03/2000 18:20:30')
