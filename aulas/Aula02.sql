--criar banco via ddl
CREATE DATABASE a02_t01;

-- selecionar banco
USE	a02_t01;

-- criar tabela
CREATE TABLE tb_mensagens
(
	id_mensagem int NOT NULL IDENTITY PRIMARY KEY,
	mensagem varchar(200) NOT NULL,
	datahora datetime2 NOT NULL
)

CREATE TABLE tb_testes
(
	id_teste int NOT NULL IDENTITY PRIMARY KEY,
	datacriacao date NOT NULL,
	valor decimal(6,2) NOT NULL,
	uf char(2) NOT NULL
)

-- inserir dados
INSERT INTO tb_mensagens
(mensagem, datahora) -- colunas
VALUES 
('INSERÇÃO MANUAL', '10/01/2020'); -- valores

INSERT INTO tb_mensagens
(mensagem, datahora)
VALUES
('linha 1', '2021/07/09'), -- virgula separa os registros
('linha 2', '2023/11/14');

-- visualizar dados
SELECT * FROM tb_mensagens; -- exibe todas

-- ALTERAR TABELA
ALTER TABLE tb_mensagens -- inclui a coluna
	ADD id_user int NULL;

ALTER TABLE tb_mensagens
	ALTER COLUMN id_user int NOT NULL; -- nao funciona pois ja tem dados nulos

ALTER TABLE tb_mensagens
	DROP COLUMN id_user; -- desfez a coluna

ALTER TABLE tb_mensagens
	ADD id_user int NOT NULL DEFAULT 1; -- cria a coluna com o valor padrao 1

-- crie uma msg como usuario 3

INSERT INTO tb_mensagens
(mensagem, datahora, id_user)
VALUES 
('mensagem do ronaldo', '10/01/1020', 3);

ALTER TABLE tb_mensagens
	ADD CONSTRAINT fk_user_msg FOREIGN KEY(id_user)
		REFERENCES tb_users(id_user);