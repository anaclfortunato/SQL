-- Criação de função no banco de dados da clínica veterinária 

-- - Retorna 'tipo de consulta, nome paciente, nome cliente' de acordo com data, hora e medico veterinário da consulta

CREATE DEFINER=`root`@`localhost` FUNCTION `consulta_marcada`(data DATE, hora VARCHAR (5), id INT) 
RETURNS varchar(100)
READS SQL DATA
BEGIN
	RETURN (SELECT CONCAT('', tipo_consulta, ', paciente ', nome_paciente, ', cliente ', nome_cliente)
	FROM consulta c 
    	INNER JOIN paciente p ON (c.id_paciente = p.id_paciente) 
    	INNER JOIN cliente l ON (p.id_cliente = l.id_cliente)
	WHERE data_consulta = data AND hora_consulta = hora AND id_mv = id);
END

-- Exemplo de uso: SELECT consulta_marcada ('2022-10-10', '18:00', 2);

-- End of file.
