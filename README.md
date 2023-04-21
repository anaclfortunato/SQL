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
  
    Também foi incluso uma tabela contendo serviços e valores oferecidos pela clínica.
    
 Escopo de tabelas com descrição de sua estrutura (coluna, tipo de dado e tipo de chave):
 
![tabelas](https://user-images.githubusercontent.com/131414411/233517221-4c01dc2d-3a7d-4858-8887-00c7044989bd.png)

Apesar de saber que no dia a dia pode ser necessário mais informações do que aqui presente, para criação do projeto foi escolhido as mais 
essenciais que permitem o embasamento necessário para algumas análises. 

## Script de criação de objetos do banco de dados

Após definir a estrutura das tabelas, foi criado um script contendo o schema onde será inserido o banco de dados e estutura das tabelas nele 
presente. 
        `Arquivo: db_clinica_vet.sql`
        
