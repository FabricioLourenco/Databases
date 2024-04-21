/*ATIVIDADES AULA BANCO DIA 18/04/2024*/


/* 1) Inserir um novo cliente em tabela_de_cliente, se caso CPF do ja existir, retornar msg
"Cliente ja possui cadastro ". Senão "Cliente cadastrado com sucesso" */

DELIMITER //

CREATE FUNCTION cadastrar_cliente(
    p_cpf VARCHAR(11),
    p_nome VARCHAR(100),
    p_endereco1 VARCHAR(150),
    p_endereco2 VARCHAR(150),
    p_bairro VARCHAR(50),
    p_cidade VARCHAR(50),
    p_estado VARCHAR(2),
    p_cep VARCHAR(8),
    p_data_nascimento DATE,
    p_idade SMALLINT,
    p_sexo VARCHAR(1),
    p_limite_credito FLOAT,
    p_volume_compra FLOAT,
    p_primeira_compra BIT,
    p_total_pedidos INT
)
RETURNS VARCHAR(100)
BEGIN
    DECLARE cpf_count INT;
    
    -- Verifica se o CPF já existe na tabela_de_clientes
    SELECT COUNT(*) INTO cpf_count FROM tabela_de_clientes WHERE CPF = p_cpf;
    
    -- Se o CPF já existe, retorna a mensagem "Cliente já possui cadastro"
    IF cpf_count > 0 THEN
        RETURN 'Cliente já possui cadastro';
    ELSE
        -- Se o CPF não existe, insere o novo cliente na tabela_de_clientes
        INSERT INTO tabela_de_clientes (CPF, NOME, ENDERECO_1, ENDERECO_2, BAIRRO, CIDADE, ESTADO, CEP, DATA_DE_NASCIMENTO, IDADE, SEXO, LIMITE_DE_CREDITO, VOLUME_DE_COMPRA, PRIMEIRA_COMPRA, total_pedidos_realizados)
        VALUES (p_cpf, p_nome, p_endereco1, p_endereco2, p_bairro, p_cidade, p_estado, p_cep, p_data_nascimento, p_idade, p_sexo, p_limite_credito, p_volume_compra, p_primeira_compra, p_total_pedidos);
        RETURN 'Cliente cadastrado com sucesso';
    END IF;
END //

DELIMITER ;

CALL cadastrar_cliente('12345678901', 'Fulano de Tal', 'Rua A', 'Apto 101', 'Centro', 'Cidade A', 'AB', '12345678', '1990-01-01', 30, 'M', 1000.00, 0.0, 0, 0);

