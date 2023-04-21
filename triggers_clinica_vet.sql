-- Criação de triggers para banco de dados clínica veterinária
-- Tabelas criadas para armazenar informações dos triggers: novo_pagamento e peso_anterior
-- Triggers: tr_add_pagamento e tr_alter_peso

-- Schema a ser utilizado 
USE db_clinica_vet; 

-- Trigger BEFORE que armazena valor de pagamento novo após inserí-lo na tabela pagamento
-- Também inclui um id_novo de cada pagamento, data, hora e usuário que registrou novo pagamento

-- Tabela que irá armazenar novo pagamento 

CREATE TABLE novo_pagamento (
	id_novo INT NOT NULL AUTO_INCREMENT, 
	valor_pagamento DECIMAL (5,2) NOT NULL,
    	data_pagamento DATE NOT NULL,
    	hora_pagamento TIME NOT NULL,
    	usuario_pagamento VARCHAR (50) NOT NULL,    
	PRIMARY KEY (id_novo)
);

-- Criação do trigger que irá armazenar na tabela novo_pagamento o valor do pagamento após inserção de registro na tabela pagamento

CREATE TRIGGER `tr_add_pagamento`
BEFORE INSERT ON `pagamento`
FOR EACH ROW
INSERT INTO `novo_pagamento` (valor_pagamento, data_pagamento, hora_pagamento, usuario_pagamento) 
VALUES (NEW.valor_pagamento, CURRENT_DATE(), CURRENT_TIME(), USER());

-- Exemplo de inserção de novo pagamento 

INSERT INTO pagamento (data_consulta, id_cliente, valor_pagamento, forma_pagamento) VALUES ("2023-04-19", 2, 80, "CD");

-- Como chamar a tabela novo_pagamento e ver o que foi inserido

SELECT * FROM novo_pagamento;
---------------------------------------------------------------------------------------------------------------------------------------
-- Trigger que armazena peso anterior do animal depois que o altera na tabela paciente
-- Também inclui id_paciente, nome_paciente, id_cliente, data, hora e usuário que fez última atualização 

-- Tabela que irá armazenar o peso anterior do animal 
-- Uso de um id_alteracao, pois assim fica possível alterar mais de uma vez o peso do mesmo animal não usando id_paciente como PK

CREATE TABLE peso_anterior (
	id_alteracao INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	id_paciente INT NOT NULL,
    	nome_paciente VARCHAR (50) NOT NULL, 
    	id_cliente INT NOT NULL,
    	peso DECIMAL (5,2) NOT NULL,
    	data_alteracao DATE NOT NULL,
    	hora_alteracao TIME NOT NULL, 
    	usuario_alteracao VARCHAR(50) NOT NULL
); 

-- Criação do trigger que irá armazenar na tabela peso_anterior o peso após modificação 

CREATE TRIGGER `tr_alter_peso`
AFTER UPDATE ON `paciente`
FOR EACH ROW 
INSERT INTO `peso_anterior` (id_paciente, nome_paciente, id_cliente, peso, data_alteracao, hora_alteracao, usuario_alteracao) 
VALUES (OLD.id_paciente, OLD.nome_paciente, OLD.id_cliente, OLD.peso, CURRENT_DATE(), CURRENT_TIME(), USER());

-- Exemplo de modificação de peso para determinado id_paciente

UPDATE paciente SET peso = 8.5 WHERE id_paciente = 1;

-- Como chamar a tabela peso_anterior e ver o peso anterior que foi armazenado após modificação

SELECT * FROM peso_anterior;

-- End of file.
