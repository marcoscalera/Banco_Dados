USE a03_t01;

CREATE TABLE tb_cidades -- tabela de cidades
(
	id_cidade int NOT NULL IDENTITY PRIMARY KEY,
	cidade varchar(30) NOT NULL,
	populacao int NOT NULL,
	fundacao datetime NOT NULL,
	id_uf int NOT NULL,
	id_end int NOT NULL,
	CONSTRAINT id_uf FOREIGN KEY (id_uf)
		REFERENCES tb_uf(id_uf)
)

INSERT INTO tb_cidades
(cidade, populacao, fundacao, id_uf, id_end)
VALUES
('Matão', 2000, 09/09/2000, 21, 1),
('Araraquara', 2002, 01/09/2000, 21, 2),
('Limeira', 2000, 09/09/2000, 21, 3),
('Palmas', 2000, 09/09/2000, 8, 4),
('Rio Verde', 2000, 09/09/2000, 27, 5);

SELECT * FROM tb_cidades;
SELECT * FROM tb_uf;
SELECT * FROM tb_end;

CREATE TABLE tb_uf -- tabela de estados
(
	id_uf int NOT NULL IDENTITY PRIMARY KEY,
	uf varchar(2) NOT NULL,
	nome varchar(30) NOT NULL
)

INSERT INTO tb_uf
(nome, uf)
VALUES
('Rondônia', 'RO'),
('Acre', 'AC'),
('Amazonas', 'AM'),
('Roraima', 'RR'),
('Pará', 'PA'),
('Amapá', 'AP'),
('Tocantins', 'TO'),
('Maranhão', 'MA'),
('Piauí', 'PI'),
('Ceará	', 'CE'),
('Rio Grande do Norte', 'RN'),
('Paraíba', 'PB'),
('Pernambuco', 'PE'),
('Alagoas', 'AL'),
('Sergipe', 'SE'),
('Bahia', 'BA'),
('Minas Gerais', 'MG'),
('Espírito Santo', 'ES'),
('Rio de Janeiro', 'RJ'),
('São Paulo', 'SP'),
('Paraná', 'PR'),
('Santa Catarina', 'SC'),
('Rio Grande do Sul', 'RS'),
('Mato Grosso do Sul', 'MS'),
('Mato Grosso', 'MT'),
('Goiás', 'GO'),
('Distrito Federal', 'DF');

TRUNCATE TABLE tb_end -- reset na tabela

CREATE TABLE tb_end -- tabela de endereco
(
	id_end int NOT NULL IDENTITY PRIMARY KEY,
    logradouro varchar(200) NOT NULL,
	numero  varchar(40) NOT NULL,
	id_cidade int NOT NULL FOREIGN KEY REFERENCES tb_cidades(id_cidade)
)

INSERT INTO tb_end
(logradouro, numero, id_cidade)
VALUES
('Rua Teste', 22, 1),
('Rua Gerso', 50, 2),
('Rua Pedro', 30, 3),
('Rua Pepo', 10, 4),
('Rua Bibo', 05, 5);