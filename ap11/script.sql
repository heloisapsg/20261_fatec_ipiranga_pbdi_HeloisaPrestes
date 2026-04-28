-- escrever um proc que adiciona um item a um pedido
-- ele deve associar o item a um pedido e atualizar a data de modificação do pedido
CREATE OR REPLACE PROCEDURE sp_add_itens(
	OUT cod_pedido INT, 
	IN cod_item INT
) LANGUAGE plpgsql
AS $$
	--add item
	INSERT INTO tb_item_pedido(cod_item) VALUES (cod_item);
	SELECT LASTVAL() INTO cod_pedido;
	--update
	UPDATE tb_pedido SET data_modificacao = CURRENT_TIMESTAMP WHERE cod_pedido = cod_pedido; 
$$

--FAÇO UM BLOCO PORQUE VOU USAR VARIÁVEIS PARA ADD PEDIDO
-- DO $$
-- DECLARE
-- 	cod_pedido INT;
-- 	cod_cliente INT;
-- BEGIN	
-- 	SELECT c.cod_cliente FROM tb_cliente c
-- 	WHERE nome LIKE 'João da Silva' INTO cod_cliente;
-- 	CALL sp_criar_pedido(cod_pedido, cod_cliente);
-- 	RAISE NOTICE 'Código do Pedido gerado: %', cod_pedido;
-- END;
-- $$
-- SELECT * FROM tb_pedido;

-- CREATE OR REPLACE PROCEDURE sp_criar_pedido(
-- 	OUT cod_pedido INT,
-- 	IN cod_cliente INT) LANGUAGE plpgsql
-- AS $$
-- 	BEGIN
-- 	INSERT INTO tb_pedido(cod_cliente) VALUES (cod_cliente);
-- 	--pegar o código d pedido gerado e guardar na variável cod_pedido
-- 	SELECT LASTVAL() INTO cod_pedido;
-- 	END;
-- $$

-- CALL sp_cadastrar_cliente('João da Silva');
-- CALL sp_cadastrar_cliente('Maria Clara');

-- CREATE OR REPLACE PROCEDURE sp_cadastrar_cliente(
-- 	IN nome VARCHAR(50),
-- 	IN codigo INT DEFAULT NULL-- SE eu não passar nenhum valor, peço para gerar o código do cliente de maneira interna)
-- ) LANGUAGE plpgsql
-- AS $$
-- BEGIN
-- 	--se o c´digo for null, cadastrar apenas o nome, gerando automático
-- 	IF codigo IS NULL THEN
-- 		INSERT INTO tb_cliente(nome) VALUES(nome);
-- 	--caso contrario, cadastrar com o codigo recebido
-- 	ELSE
-- 		INSERT INTO tb_cliente(cod_cliente, nome) VALUES(codigo, nome);
-- 	END IF;
-- END;
-- $$

-- CREATE TABLE tb_item_pedido(
-- 	--surrogate key = uma PK não normal da tabela, criado pelo sistema
-- 	-- o natural seria: o cod item +  cod pedido
-- 	cod_item_pedido SERIAL PRIMARY KEY,
-- 	cod_item INT,
-- 	cod_pedido INT,
-- 	CONSTRAINT fk_item FOREIGN KEY (cod_item) REFERENCES tb_item(cod_item),
-- 	CONSTRAINT fk_pedido FOREIGN KEY (cod_pedido) REFERENCES tb_pedido(cod_pedido));

-- INSERT INTO tb_item(descricao, valor, cod_tipo)
-- VALUES ('Refrigerante', 10, 1),
-- 	   ('Suco', 8, 1),
-- 	   ('Hambúrguer', 55, 2),
-- 	   ('Batata Frita', 15, 2),
-- 	   ('Nuggets', 5, 2);
-- SELECT * FROM tb_item;

-- CREATE TABLE tb_item(
-- 	cod_item SERIAL PRIMARY KEY,
-- 	descricao VARCHAR (200) NOT NULL,
-- 	valor NUMERIC(10,2) NOT NULL,
-- 	cod_tipo INT NOT NULL,
-- 	CONSTRAINT fk_tipo_item FOREIGN KEY(cod_tipo) REFERENCES tb_tipo(cod_tipo));

-- CREATE TABLE tb_tipo(
-- 	cod_tipo SERIAL PRIMARY KEY,
-- 	descricao VARCHAR(200) NOT NULL);
-- INSERT INTO tb_tipo (descricao)
-- VALUES ('Bebida'),('Comida');

-- SELECT * FROM tb_tipo;


-- CREATE TABLE tb_pedido(
-- 	cod_pedido SERIAL PRIMARY KEY,
-- 	data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
-- 	data_modificacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
-- 	status VARCHAR DEFAULT 'aberto',
-- 	cod_cliente INT NOT NULL,
-- 	CONSTRAINT fk_cliente FOREIGN KEY (cod_cliente) REFERENCES
-- 	tb_cliente(cod_cliente));

-- CREATE TABLE tb_cliente(
-- 	cod_cliente SERIAL PRIMARY KEY,
-- 	nome VARCHAR(50) NOT NULL);