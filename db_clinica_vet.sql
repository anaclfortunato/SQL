-- Original data created by Ana Carolina Fortunato
-- Current schema by Ana Carolina Fortunato
-- Last modification: 2023-04-19 18:29:33

-- Criação do schema 

DROP DATABASE IF EXISTS db_clinica_vet;
CREATE DATABASE IF NOT EXISTS db_clinica_vet;
USE db_clinica_vet;

SELECT 'CREATING DATABASE CLINICA VET' as 'INFO';

DROP TABLE IF EXISTS cliente, 
					 paciente, 
                     veterinario,
                     estagiario, 
                     consulta, 
                     pagamento, 
                     tratamento, 
                     medicamento,
                     vacina;
				
-- Criação das tabelas 

-- Tabela: Cliente

CREATE TABLE CLIENTE (
	id_cliente int NOT NULL AUTO_INCREMENT,
	nome_cliente varchar (100) NOT NULL,
    cpf_cliente char (14) NOT NULL, 
	endereco_cliente varchar (100) NOT NULL, 
	telefone_cliente char (11) NOT NULL, 
	email_cliente varchar (40) NOT NULL, 
	PRIMARY KEY (id_cliente)
) ; 

-- Tabela: Paciente

CREATE TABLE PACIENTE (
	id_paciente int NOT NULL AUTO_INCREMENT, 
	nome_paciente varchar (30) NOT NULL, 
    id_cliente int NOT NULL,
	especie char (1) NOT NULL, 
	raca varchar (30) NOT NULL, 
	sexo char (1) NOT NULL, 
	pelagem varchar (30) NOT NULL, 
	data_nascimento date NOT NULL, 
	castrado boolean NOT NULL, 
	peso decimal (5,2) NOT NULL,
	PRIMARY KEY (id_paciente),
	FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente)
) ; 

-- Tabela: Veterinario

CREATE TABLE VETERINARIO (
	id_mv	int NOT NULL AUTO_INCREMENT, 
	nome_mv varchar (100) NOT NULL, 
	telefone_mv	char (11) NOT NULL, 
	email_mv varchar (40) NOT NULL, 
	cpf_mv char (14) NOT NULL, 
	crmv varchar (10) NOT NULL, 
	especialidade varchar (50) NOT NULL,
 	PRIMARY KEY (id_mv)
) ; 

-- Tabela: Estagiário

CREATE TABLE ESTAGIARIO (
	id_estagiario int NOT NULL AUTO_INCREMENT, 
	nome_estagiario varchar (100) NOT NULL, 
	telefone_estagiario char (11) NOT NULL, 
	email_estagiario varchar (40) NOT NULL, 
	cpf_estagiario char (14) NOT NULL, 
	instituicao_ensino varchar (100) NOT NULL,
	tipo_estagio varchar (20) NOT NULL, 
	PRIMARY KEY (id_estagiario)
) ; 

-- Tabela: Consulta 

CREATE TABLE CONSULTA (
	id_consulta	int NOT NULL AUTO_INCREMENT,
	data_consulta date NOT NULL, 
	hora_consulta char (5) NOT NULL,
	id_mv int NOT NULL, 
	id_estagiario int NOT NULL,
	tipo_consulta varchar (20) NOT NULL, 
	id_cliente int NOT NULL, 
	id_paciente int NOT NULL, 
	PRIMARY KEY (id_consulta),
	FOREIGN KEY (id_mv) REFERENCES veterinario (id_mv),
	FOREIGN KEY (id_estagiario) REFERENCES estagiario (id_estagiario),
	FOREIGN KEY (id_paciente) REFERENCES paciente (id_paciente),
    FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente)
) ; 

-- Tabela: Pagamento

CREATE TABLE PAGAMENTO (
	id_pagamento int NOT NULL AUTO_INCREMENT,
    data_consulta date NOT NULL, 
    id_cliente int NOT NULL, 
	valor_pagamento decimal (5,2) NOT NULL,
    forma_pagamento varchar (2) NOT NULL,
 	PRIMARY KEY (id_pagamento),
	FOREIGN KEY (id_cliente) REFERENCES consulta (id_cliente)
) ; 

-- Tabela: Tratamento 

CREATE TABLE TRATAMENTO (
	id_tratamento int NOT NULL AUTO_INCREMENT,
	id_consulta int NOT NULL, 
	id_mv int NOT NULL, 
	tipo_tratamento varchar (50) NOT NULL, 
	data_consulta date NOT NULL, 
	PRIMARY KEY (id_tratamento),
	FOREIGN KEY (id_mv, id_consulta) REFERENCES consulta (id_mv, id_consulta)	
) ; 

-- Tabela: Medicamento

CREATE TABLE MEDICAMENTO (
	id_medicamento int NOT NULL AUTO_INCREMENT, 
	nome_medicamento varchar (40) NOT NULL, 
    dosagem varchar (30) NOT NULL, 
	administracao varchar (40) NOT NULL, 
    frequencia char (3) NOT NULL, 
    tempo_uso int NOT NULL, 
	categoria varchar (40) NOT NULL, 
    id_tratamento int NOT NULL, 
	PRIMARY KEY (id_medicamento),
	FOREIGN KEY (id_tratamento) REFERENCES tratamento (id_tratamento)
) ; 

-- Tabela: Vacina 

CREATE TABLE VACINA (
	id_vacina int NOT NULL AUTO_INCREMENT,
    id_consulta int NOT NULL, 
	data_consulta date NOT NULL, 
	tipo_vacina varchar (10) NOT NULL, 
	lote_vacina varchar (10) NOT NULL, 
	data_revacina date NOT NULL, 
	PRIMARY KEY (id_vacina),
	FOREIGN KEY (id_consulta) REFERENCES consulta (id_consulta)
) ; 

-- Tabela Valores 

CREATE TABLE VALORES (
	servico varchar (20),
	valor decimal (5,2),
	PRIMARY KEY (servico)
) ;

-- End of file. 