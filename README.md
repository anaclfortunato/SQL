![image](https://user-images.githubusercontent.com/131414411/233514507-d6569471-0583-432a-a2cf-4e9db82bd2ea.png)

# Projeto Final SQL 

Ao decorrer do curso de SQL, oferecido pela plataforma Coderhouse, para prática de conhecimentos apresentados foi desenvolvido diversas 
etapas relacionadas a criação, manipulação de dados e implementaçao de processos técnicos requeridos para a manutenção do banco de dados 
relacional de um modelo de negócio de escolha pessoal. No final, essas etapas de forma conjunta resultaram no projeto final, que seria o 
trabalho de conclusão de curso necessário para receber a certificação. 

Para confecção desse repositório algumas alterações foram feitas após o término do curso para que ficasse mais coerente e completo, porém nada 
que alterasse de forma total o que foi entregue anteriormente. 

## Modelo de Negócio 
O modelo de negócio escolhido foi Clínica Veterinária de pequenos animais, ou seja, que faz atendimento somente de cão e gato. Um banco de dados 
para esse tipo de negócio necessita de tabelas específicas com informações sobre funcionários, clientes e pacientes, consultas e pagamentos, além 
de controle de receituário, como quando é recomendado tratamento e quais medicamentos foram necessários. 

## Planejamento Inicial 

Antes de ser montado o script do banco de dados, foi necessário um planejamento sobre o que deveria compor de forma coerente o banco de dados para 
fazer sentido ao negócio e quais as relações presentes entre as tabelas.

Listagem de tabelas relacionais que compõem o projeto:

                • Cliente: dados pessoais do cliente;
        
                • Paciente: dados pessoais do paciente;
        
                • Veterinário: dados pessoais e profissionais dos médicos veterinários que trabalham na clínica;
        
                • Estagiário: dados pessoais e outros necessários para realização do estágio;
        
                • Consulta: dados sobre cada consulta realizada na clínica;
        
                • Pagamento: dados sobre o pagamento de cada consulta realizada;
        
                • Tratamento: dados sobre tratamento quando necessário;
        
                • Medicamento: dados sobre medicamentos passados em caso de tratamento;
        
                • Vacina: tipo específico de consulta que há necessidade de informações diferentes sobre protocolo vacinal iniciado. 

    Também foi incluso uma tabela Valores contendo serviços oferecidos pela clínica e seu determinado valor. 
    
 Escopo de tabelas com descrição de sua estrutura (coluna, tipo de dado e tipo de chave):
 
![tabelas](https://user-images.githubusercontent.com/131414411/233517221-4c01dc2d-3a7d-4858-8887-00c7044989bd.png)

Apesar de saber que no dia a dia pode ser necessário mais informações do que aqui presente, para criação do projeto foi escolhido as mais 
essenciais que permitem o embasamento necessário para algumas análises. 

## Script de criação de objetos do banco de dados

Após definir a estrutura das tabelas, foi criado um script contendo o schema onde será inserido o banco de dados e estutura das tabelas nele 
presente. O arquivo contendo o script pode ser acessado em [db_clinica_vet](https://github.com/anaclfortunato/SQL/blob/main/db_clinica_vet.sql).

Ao ser concluída a inserção do banco de dados relacional no servidor MySQL, podemos gerar um **diagrama entidade-relacionamento**, onde aparece de 
forma ilustrada através de um fluxograma as relações entre as tabelas e suas colunas. Além da tabela valores que não possui relação com outras tabelas. 

![diagrama_ER](https://user-images.githubusercontent.com/131414411/233524983-da5f511d-7ebc-4054-ae85-8b6b39cf25c9.png)

## Script de inserção de dados

Os dados criados para o atual projeto são fabricados. Alguns foram retirados de outros bancos de dados disponíveis no MySQL, ou gerados de forma 
aleatória utilizando recursos do Microsoft Excel, ou baseados em casos que vivenciei durante minha atuação como Medica Veterinária. No entanto, 
sua compilação foi feita de forma difusa.

Para o projeto foram criados dados correspondentes a uma semana de atendimento na Clínica Veterinária, fazendo com que a extensão dos dados seja 
pequena, porém para o objetivo do projeto a quantidade foi significativa. 

O arquivo contendo o script os dados a serem inseridos nas tabelas pode ser acessado em [dados_clinica_vet](https://github.com/anaclfortunato/SQL/blob/main/dados_clinica_vet.sql).

## Relatórios gerados com base nas informações armazenadas nas tabelas

No decorrer da rotina de uma Clínica Veterinária algumas análises são comuns de serem feitas, como relação entre cliente e paciente que irá 
passar em consulta, quais médicos veterinários e estagiários estarão presentes no atendimento, tratamentos receitados em caso de necessidade e 
que medicamentos fazem parte deste tratamento, protocolo vacinal e controle de estoque de vacinas usadas. Além do pagamento feito por a cada 
consulta que gera ao final um faturamento x para clínica que deve ser analisado. Em um caso real poderíamos ter também informações mais completas 
do atendimento, assim como controle de estoque de materiais e gastos presentes no dia a dia. 

Podemos fazer diferentes consultas, como `SELECT * FROM nome_tabela` que retorna de forma total os dados inseridos nas tabelas de forma total ou fazer 
manipulação dos dados para casos específicos quando necessário por meio de filtros (ex. WHERE) e diferentes funções (ex. função de agregração GROUP BY). 

Além das análises feitas de forma manual, foram criado views, stored procedures, funções e triggers para apoiar necessidades e operações a serem 
realizadas pela clínica.

### Views 

Uma view é um conjunto de resultados de uma tabela ou mais tabelas de um banco de dados. Também podemos defini-las como “tabela virtual” que é gerada 
a partir de uma ou mais tabelas de um banco de dados relacional. Entendemos como “conjunto de resultados de uma ou mais tabelas” o fato de a view só 
armazenar uma estrutura de consulta do tipo (SELECT * FROM...) sob um nome distintivo, e não a estrutura de campos e registros que mostra quando é 
executada.

São compostas pela mesma estrutura que uma tabela, ou seja, linhas e colunas. É executada como uma busca de tabela convencional. Inclusive pode adicionar 
funções condicionais a ela.E embora sejam utilizadas para mostrar dados combinando duas ou mais tabelas, em vez de ter que elaborar a consulta, as views 
também permitem a inserção, a eliminação e a atualização dos registros que mostram. Mesmo que este último fique condicionado às restrições de estrutura 
da view quando ela é criada.

Nesse projeto foram criadas três views descritas a seguir, o script de criação e exemplo de como fazer consulta com elas está disponível em [views_clinica_vet](https://github.com/anaclfortunato/SQL/blob/main/views_clinica_vet.sql):

              •	**retorno**: retorna o histórico de consultas marcadas como retorno feitas na clínica;
              •	**vacinacao**: retorna histórico da quantidade de vacinas aplicadas em canino (cachorro) e felino (gato);
              •	**faturamento**: retorna histórico de todos os atendimentos clínicos no mês 10/2022.
 
No caso do banco de dados atual, a view faturamento não teria tanta funcionalidade, já que tem apenas dados de uma semana de atendimento, porém em um 
caso real ajudaria a ter controle de quantas consultas clínicas são feitas por dia, sendo esse o controle dos atendimentos um dos focos principais de 
uma clínica veterinária. 

### Function 
Funções permitem criar uma rotina especifica que processe determinados parâmetros e retorna um resultado determinado. Cada função é basicamente uma 
peça do código que realiza uma operação determinada, é claro, para o que foi idealizada. Em alguns casos, a função espera um ou mais parâmetros a 
serem processados e, em outros casos, simplesmente são executadas para que devolvam um dado específico.

Foi criada no projeto uma função **consulta marcada**, a qual retorna ao inserir data, hora e id do médico veterinário, qual o tipo da consulta e nome 
do cliente e paciente atendidos. Seu script de criação e exemplo de uso pode ser acessado em [function_clinica_vet](https://github.com/anaclfortunato/SQL/blob/main/function_clinica_vet.sql). 
