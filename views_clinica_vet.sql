-- Criação de views para o banco de dados da clínica veterinária 
-- Views: retorno, vacinacao e faturamento 

USE db_clinica_vet;

-- Histórico de retornos feitos na clínica

CREATE OR REPLACE VIEW retorno AS (
	SELECT data_consulta, nome_cliente, nome_paciente, tipo_consulta
	FROM consulta c 
    	INNER JOIN cliente l ON (c.id_cliente = l.id_cliente)
	INNER JOIN paciente pa ON (pa.id_cliente = l.id_cliente)
	WHERE tipo_consulta LIKE "retorno%"
	ORDER BY data_consulta, nome_cliente);

SELECT * FROM retorno;
----------------------------------------------------------------------------------------------------------------------------
-- Histórico da quantidade de vacinas aplicadas em canino (cachorro) e felino (gato)

CREATE OR REPLACE VIEW vacinacao AS (
	SELECT especie, tipo_vacina, COUNT(tipo_vacina) AS qtd_vacinas 
    	FROM consulta c
   	INNER JOIN paciente p ON (c.id_paciente = p.id_paciente)
	INNER JOIN vacina v ON (v.id_consulta = c.id_consulta)
	WHERE tipo_consulta = "vacinação" 
    	GROUP BY tipo_vacina, especie
    	ORDER BY especie);
    
SELECT * FROM vacinacao;
----------------------------------------------------------------------------------------------------------------------------
-- Soma do faturamento diário da clínica 

CREATE OR REPLACE VIEW faturamento AS (
	SELECT data_consulta, SUM(valor_pagamento) AS faturamento_dia 
    	FROM pagamento 
    	GROUP BY data_consulta);

SELECT * FROM faturamento;
----------------------------------------------------------------------------------------------------------------------------
-- Histórico de todos os atendimentos clínicos no mês 10/2022 
-- Exemplo de uso de uma funcionalidade que se torna mais útil quando há dados de mais meses no banco de dados 

CREATE OR REPLACE VIEW historico_clinica AS (
	SELECT data_consulta, nome_mv, COUNT(tipo_consulta) AS consulta_clinica
	FROM consulta c JOIN veterinario v ON (c.id_mv = v.id_mv)
	WHERE tipo_consulta IN ('clínica', 'retorno clínica') AND MONTH(data_consulta) = 10 AND YEAR(data_consulta) = 2022
	GROUP BY data_consulta, nome_mv
    	ORDER by data_consulta);

SELECT * FROM historico_clinica;

-- End of file.
