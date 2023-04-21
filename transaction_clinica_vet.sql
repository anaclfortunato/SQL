-- Banco de dados a ser utilizado 
USE db_clinica_vet; 

-- Primeira tabela a ser usada na transação é a tabela veterinario fazendo a inserção de 2 novos registros 
START TRANSACTION; 
INSERT INTO veterinario (id_mv, nome_mv, telefone_mv, email_mv, cpf_mv, crmv, especialidade) 
VALUES (5, "Gabriel Landin", 11967691719, "gabriel.landin@gmail.com", 36798452106, "39232SP", "clínica de pequenos animais");
INSERT INTO veterinario (id_mv, nome_mv, telefone_mv, email_mv, cpf_mv, crmv, especialidade) 
VALUES (6, "Larissa Marin", 11954348864, "larissa.marin@gmail.com", 40895677390, "42300SP", "medicina felina");

-- Não foi feito eliminação de registros, pois dará erro já que os dados dessa tabela são FK em outras tabelas do DB
-- A inserção dos dados na tabela veterinario com o id_mv se faz necessária mesmo que ele seja AUTOINCREMENT, pois quando é feito o ROLLBACK os id_mv saem de ordem 

-- Para visualizar os dados inseridos
SELECT * FROM veterinario; 

-- Caso queira que a ação de inserção seja desfeita
ROLLBACK; 

-- Para confirmar a inserção dos dados de forma definitiva na tabela 
COMMIT; 

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Banco de dados a ser utilizado 
USE db_clinica_vet; 

-- Segunda tabela a ser usada na transação é a tabela cliente fazendo a inserção de 8 novos registros junto a 2 savepoints
START TRANSACTION; 
INSERT INTO cliente (id_cliente, nome_cliente, endereco_cliente, telefone_cliente, email_cliente, cpf_cliente) 
VALUES (54, "Alicia Mills", "Sucre Boulevard 1368", 11987181690, "alicia.mills@hotmail.com", 21204805240);
INSERT INTO cliente (id_cliente, nome_cliente, endereco_cliente, telefone_cliente, email_cliente, cpf_cliente) 
VALUES (55, "Suzanne Nichols", "Hunuco Boulevard 401", 11984930106, "suzanne.nichols@hotmail.com", 27818859831);
INSERT INTO cliente (id_cliente, nome_cliente, endereco_cliente, telefone_cliente, email_cliente, cpf_cliente) 
VALUES (56, "Michele Grant", "Lincoln Parkway 368", 11973420576, "michele.grant@hotmail.com", 29874073190);
INSERT INTO cliente (id_cliente, nome_cliente, endereco_cliente, telefone_cliente, email_cliente, cpf_cliente) 
VALUES (57, "Annette Olson", "Chapra Drive 500", 11916575663, "annette.olson@hotmail.com", 44455939236);
SAVEPOINT cliente_1;
INSERT INTO cliente (id_cliente, nome_cliente, endereco_cliente, telefone_cliente, email_cliente, cpf_cliente) 
VALUES (58, "Sandra Martin", "Salinas Street 1445", 11980340589, "sandra.martin@gmail.com", 34311438125);
INSERT INTO cliente (id_cliente, nome_cliente, endereco_cliente, telefone_cliente, email_cliente, cpf_cliente) 
VALUES (59, "Ruth Martinez", "Acua Parkway 791", 11904687909, "ruth.martinez@gmail.com", 42108573482);
INSERT INTO cliente (id_cliente, nome_cliente, endereco_cliente, telefone_cliente, email_cliente, cpf_cliente) 
VALUES (60, "Sandra Kilmer", "Tama Street 651", 11985856084, "sandra.kilmer@hotmail.com", 47579755890);
INSERT INTO cliente (id_cliente, nome_cliente, endereco_cliente, telefone_cliente, email_cliente, cpf_cliente) 
VALUES (61, "Tom Miranda", "Munger Lane 210", 11954206891, "tom.miranda@hotmail.com", 11826712844);
SAVEPOINT cliente_2;

-- A inserção dos dados na tabela cliente com o id_cliente se faz necessária mesmo que ele seja AUTOINCREMENT, pois quando é feito o ROLLBACK os id_cliente saem de ordem 

-- Para visualizar os dados inseridos
SELECT * FROM cliente; 

-- Caso queira que a ação de inserção de todos os dados seja desfeita
ROLLBACK;

-- Caso queira que a ação de inserção dos dados até o primeiro savepoint seja desfeita
ROLLBACK TO SAVEPOINT cliente_1; 

-- Para apagar o primeiro savepoint que foi inserido
RELEASE SAVEPOINT cliente_1;

-- Para confirmar a inserção dos dados de forma definitiva na tabela 
COMMIT; 