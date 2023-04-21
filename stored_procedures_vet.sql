-- Criação de stored procedures no banco de dados da clínica veterinária 
-- Stored procedures: consultas_vet e cliente_paciente

-- Stored Procedure que retorna as consultas de determinado veterinário de acordo com seu id

CREATE PROCEDURE `consultas_vet` (IN id INT)
BEGIN 
	IF id IN (1,2,3,4) THEN
		SELECT * FROM consulta WHERE consulta.id_mv = id;
	ELSE 
		SELECT 'Não existe registros com esse ID' AS ERRO;	
	END IF;
END
------------------------
CALL consultas_vet (1);

-- Retorna todas as consultas de acordo com o id_mv solicitado se ele for 1, 2, 3 ou 4

CALL consultas_vet (7); 

-- Retorna mensagem de aviso caso id_mv não seja 1, 2, 3 ou 4 

-----------------------------------------------------------------------------------------------------------
-- Stored procedure que retorna a partir do nome do cliente e do paciente, os dados principais do paciente

CREATE DEFINER=`root`@`localhost` PROCEDURE `cliente_paciente`(IN cliente VARCHAR (100), paciente VARCHAR (30))
BEGIN
	SELECT nome_cliente, id_paciente, nome_paciente, especie, raca, sexo, pelagem FROM paciente p 
   	INNER JOIN cliente c ON (p.id_cliente = c.id_cliente)
	WHERE nome_cliente = cliente AND nome_paciente = paciente;
END
------------------------
CALL cliente_paciente ('Timothy Bunn', 'Oscar');

-- Retorna informaçãoes do Oscar, animal do Timothy Bunn 

CALL cliente_paciente ('Timothy Bunn', 'Xuxu');

-- Não irá retornar nada, pois um dos dados (nome do paciente) está incorreto 

-- End of file.
