# Algafood (Nome melhor a ser definido)


Este projeto está sendo feito acompanhando as aulas de Springboot da Algaworks. Não pretendo 
realizar algo muito diferente do que é apresentado porque já tenho outras ideias em mente que não se 
encaixam muito nesta idéia.

Pretendo finalizar o curso e completar este projeto para aprender maiss sobre o javão da massa e o Spring,
mas é provável eu achar este projeto muito legal e implementar melhorias/features.

Neste versão existe apenas uma pequena estrutura padrão de projeto e adoção do padrão de repository
(falta implementar controllers para fazer via requisição). 

 ## Como rodar o projeto:

### 1. Instalar as dependências do maven no projeto
### 2. Definir as variáveis de conexão ao Database
    Edite o arquivo src/main/resources/application.yml
    - DB_HOST=host
    - DB_PORT=port
    - DB_NAME=name
    - DB_USER=user
    - DB_PASSWORD=password

    - jpa.generate-ddl: true | False --> Flag para gerar os schemas do banco
    - jpa.hibernate.ddl-auto: Create | Drop | none --> Flag para Drop e create de tabelas no início da aplicação
    - jpa.show-sql: true | false --> Flag para exibir sql no log

