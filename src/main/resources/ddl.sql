create table cidades (
    id bigint not null auto_increment,
    nome varchar(40) not null,
    estado_id bigint not null,
    primary key (id)
    ) engine=InnoDB DEFAULT charset=utf8;

create table cozinhas (
    id bigint not null auto_increment,
    nome varchar(30) not null,
    primary key (id)
    ) engine=InnoDB DEFAULT charset=utf8;


create table estados (
    id bigint not null auto_increment,
    nome varchar(30) not null,
    primary key (id)
    ) engine=InnoDB DEFAULT charset=utf8;

create table formas_pagamento (
    id bigint not null auto_increment,
    descricao varchar(30) not null,
    primary key (id)
    ) engine=InnoDB DEFAULT charset=utf8;

create table grupo_permissao (
    grupo_id bigint not null,
    permissao_id bigint not null
    ) engine=InnoDB DEFAULT charset=utf8;

create table grupos (
    id bigint not null auto_increment,
    nome varchar(60) not null,
    primary key (id)
    ) engine=InnoDB DEFAULT charset=utf8;

create table permissao (
    id bigint not null auto_increment,
    descricao varchar(255) not null,
    nome varchar(30) not null,
    primary key (id)
    ) engine=InnoDB DEFAULT charset=utf8;

create table produtos (
    id bigint not null auto_increment,
    ativo bit not null,
    descricao varchar(255) not null,
    nome varchar(40) not null,
    preco decimal(19,2) not null,
    restaurante_id bigint,
    primary key (id)
    ) engine=InnoDB DEFAULT charset=utf8;

create table restaurante_forma_pagamento (
    restaurante_id bigint not null,
    forma_pagamento_id bigint not null
    ) engine=InnoDB DEFAULT charset=utf8;

create table restaurantes (
    id bigint not null auto_increment,
    nome varchar(30) not null,
    taxa_frete decimal(19,2) not null,
    cozinha_id bigint not null,
    endereco_bairro varchar(255),
    endereco_cep varchar(255),
    endereco_complemento varchar(255),
    endereco_logradouro varchar(255),
    endereco_numero varchar(255),
    endereco_cidade_id bigint,
    created_at datetime not null,
    updated_at datetime not null,
    deleted_at datetime,
    primary key (id)
    ) engine=InnoDB DEFAULT charset=utf8;

create table usuario_grupo (
    usuario_id bigint not null,
    grupo_id bigint not null
    ) engine=InnoDB DEFAULT charset=utf8;

create table usuarios (
    id bigint not null auto_increment,
    email varchar(120) not null,
    nome varchar(60) not null,
    senha varchar(255) not null,
    created_at datetime not null,
    updated_at datetime not null,
    deleted_at datetime,
    primary key (id)
    ) engine=InnoDB DEFAULT charset=utf8;

alter table cidades add constraint fk_cidade_estado foreign key (estado_id) references estados (id);
alter table grupo_permissao add constraint fk_grupo_permissao foreign key (permissao_id) references permissao (id);
alter table grupo_permissao add constraint fk_grupo_permissao2 foreign key (grupo_id) references grupos (id);
alter table produtos add constraint fk_produto_restaurante foreign key (restaurante_id) references restaurantes (id);
alter table restaurante_forma_pagamento add constraint fk_restaurante_formaPagamento foreign key (forma_pagamento_id) references formas_pagamento (id);
alter table restaurante_forma_pagamento add constraint fk_formaPagamento_restaurante foreign key (restaurante_id) references restaurantes (id);
alter table restaurantes add constraint fk_restaurante_cozinha foreign key (cozinha_id) references cozinhas (id);
alter table restaurantes add constraint fk_restaurante_cidade foreign key (endereco_cidade_id) references cidades (id);
alter table usuario_grupo add constraint fk_usuario_grupo foreign key (grupo_id) references grupos (id);
alter table usuario_grupo add constraint fk_usuario_grupo2 foreign key (usuario_id) references usuarios (id);


insert into estados (id, nome) values (1, 'Minas Gerais');
insert into estados (id, nome) values (2, 'São Paulo');
insert into estados (id, nome) values (3, 'Ceará');
insert into cidades (id, nome, estado_id) values (1, 'Uberlândia', 1);
insert into cidades (id, nome, estado_id) values (2, 'Belo Horizonte', 1);
insert into cidades (id, nome, estado_id) values (3, 'São Paulo', 2);
insert into cozinhas (id, nome) values (1, 'Brasileira');
insert into cozinhas (id, nome) values (2, 'Americana');
insert into cozinhas (id, nome) values (3, 'Italiana');
insert into cozinhas (id, nome) values (4, 'Árabe');
insert into cozinhas (id, nome) values (5, 'Japonesa');
insert into cozinhas (id, nome) values (6, 'Argentina');;
insert into restaurantes (nome, taxa_frete, cozinha_id, created_at, updated_at) values ('Milani', 0, 1,utc_timestamp,UTC_TIMESTAMP);
insert into restaurantes (nome, taxa_frete, cozinha_id, created_at, updated_at) values ('Hamburghini', 5, 2,UTC_TIMESTAMP, UTC_TIMESTAMP);
insert into restaurantes (nome, taxa_frete, cozinha_id, created_at, updated_at) values ('Nonna Casa Italiana', 25, 3, UTC_TIMESTAMP, UTC_TIMESTAMP);
insert into restaurantes (nome, taxa_frete, cozinha_id, created_at, updated_at) values ('Habibs', 10, 4, UTC_TIMESTAMP, UTC_TIMESTAMP);
insert into restaurantes (nome, taxa_frete, cozinha_id, created_at, updated_at) values ('Yasui', 10, 5, UTC_TIMESTAMP, UTC_TIMESTAMP);
insert into restaurantes (nome, taxa_frete, cozinha_id, created_at, updated_at) values ('Java Steakhouse', 12, 3, utc_timestamp, utc_timestamp);
insert into restaurantes (nome, taxa_frete, cozinha_id, created_at, updated_at) values ('Lanchonete do Tio Sam', 11, 4, utc_timestamp, utc_timestamp);
insert into restaurantes (nome, taxa_frete, cozinha_id, created_at, updated_at) values ('Bar da Maria', 6, 4, utc_timestamp, utc_timestamp);
insert into formas_pagamento (id, descricao) values (1, 'Cartão de crédito');
insert into formas_pagamento (id, descricao) values (2, 'Cartão de débito');
insert into formas_pagamento (id, descricao) values (3, 'Dinheiro');
insert into restaurante_forma_pagamento (restaurante_id, forma_pagamento_id) values (1, 1), (1, 2), (1, 3), (2, 1), (2, 2), (2, 3), (3, 1), (3, 2), (3, 3), (4, 1), (4, 2), (4, 3), (5, 1), (5, 2), (5, 3), (6, 1), (6, 2), (6, 3);
insert into permissao (id, nome, descricao) values (1, 'CONSULTAR_COZINHAS', 'Permite consultar cozinhas');
insert into permissao (id, nome, descricao) values (2, 'EDITAR_COZINHAS', 'Permite editar cozinhas');
insert into produtos (nome, descricao, preco, ativo, restaurante_id) values ('Porco com molho agridoce', 'Deliciosa carne suína ao molho especial', 78.90, 1, 1);
insert into produtos (nome, descricao, preco, ativo, restaurante_id) values ('Camarão tailandês', '16 camarões grandes ao molho picante', 110, 1, 1);
insert into produtos (nome, descricao, preco, ativo, restaurante_id) values ('Salada picante com carne grelhada', 'Salada de folhas com cortes finos de carne bovina grelhada e nosso molho especial de pimenta vermelha', 87.20, 1, 2);
insert into produtos (nome, descricao, preco, ativo, restaurante_id) values ('Garlic Naan', 'Pão tradicional indiano com cobertura de alho', 21, 1, 3);
insert into produtos (nome, descricao, preco, ativo, restaurante_id) values ('Murg Curry', 'Cubos de frango preparados com molho curry e especiarias', 43, 1, 3);
insert into produtos (nome, descricao, preco, ativo, restaurante_id) values ('Bife Ancho', 'Corte macio e suculento, com dois dedos de espessura, retirado da parte dianteira do contrafilé', 79, 1, 4);
insert into produtos (nome, descricao, preco, ativo, restaurante_id) values ('T-Bone', 'Corte muito saboroso, com um osso em formato de T, sendo de um lado o contrafilé e do outro o filé mignon', 89, 1, 4);
insert into produtos (nome, descricao, preco, ativo, restaurante_id) values ('Sanduíche X-Tudo', 'Sandubão com muito queijo, hamburger bovino, bacon, ovo, salada e maionese', 19, 1, 5);
insert into produtos (nome, descricao, preco, ativo, restaurante_id) values ('Espetinho de Cupim', 'Acompanha farinha, mandioca e vinagrete', 8, 1, 6);
create table cidades (id bigint not null auto_increment, nome varchar(255) not null, estado_id bigint not null, primary key (id)) engine=InnoDB;
create table cozinhas (id bigint not null auto_increment, nome varchar(255) not null, primary key (id)) engine=InnoDB;
create table estados (id bigint not null auto_increment, nome varchar(255) not null, primary key (id)) engine=InnoDB;
create table formas_pagamento (id bigint not null auto_increment, descricao varchar(255) not null, primary key (id)) engine=InnoDB;
create table grupo_permissao (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB;
create table grupos (id bigint not null auto_increment, nome varchar(255) not null, primary key (id)) engine=InnoDB;
create table permissao (id bigint not null auto_increment, descricao varchar(255) not null, nome varchar(255) not null, primary key (id)) engine=InnoDB;
create table produtos (id bigint not null auto_increment, ativo bit not null, descricao varchar(255) not null, nome varchar(255) not null, preco decimal(19,2) not null, restaurante_id bigint, primary key (id)) engine=InnoDB;
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB;
create table restaurantes (id bigint not null auto_increment, created_at datetime not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255) not null, taxa_frete decimal(19,2) not null, updated_at datetime not null, cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB;
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB;
create table usuarios (id bigint not null auto_increment, created_at datetime not null, email varchar(255) not null, nome varchar(255) not null, senha varchar(255) not null, primary key (id)) engine=InnoDB;
alter table cidades add constraint FKdt0b3ronwpi1upsrhaeq6r69n foreign key (estado_id) references estados (id);
alter table grupo_permissao add constraint FKh21kiw0y0hxg6birmdf2ef6vy foreign key (permissao_id) references permissao (id);
alter table grupo_permissao add constraint FKs3g951jp8j9tc3r4jh1jieup foreign key (grupo_id) references grupos (id);
alter table produtos add constraint FKsl3jhd8nhd103c5nm6yocnnkx foreign key (restaurante_id) references restaurantes (id);
alter table restaurante_forma_pagamento add constraint FKf6v3wv0kyv035nyqbfmuxepo2 foreign key (forma_pagamento_id) references formas_pagamento (id);
alter table restaurante_forma_pagamento add constraint FKm6ricm3gnnj4e3ev82495metc foreign key (restaurante_id) references restaurantes (id);
alter table restaurantes add constraint FKgdtjhnl3atr87y5s0tcnr2i5q foreign key (cozinha_id) references cozinhas (id);
alter table restaurantes add constraint FKjxh9a5cs0ke85v1t0uh6p9shb foreign key (endereco_cidade_id) references cidades (id);
alter table usuario_grupo add constraint FKamq3pnpufgkcq9w2q30b23ooj foreign key (grupo_id) references grupos (id);
alter table usuario_grupo add constraint FKheegykchmkd1rguqwiscbf3gv foreign key (usuario_id) references usuarios (id);
insert into estados (id, nome) values (1, 'Minas Gerais');
insert into estados (id, nome) values (2, 'São Paulo');
insert into estados (id, nome) values (3, 'Ceará');
insert into cidades (id, nome, estado_id) values (1, 'Uberlândia', 1);
insert into cidades (id, nome, estado_id) values (2, 'Belo Horizonte', 1);
insert into cidades (id, nome, estado_id) values (3, 'São Paulo', 2);
insert into cozinhas (id, nome) values (1, 'Brasileira');
insert into cozinhas (id, nome) values (2, 'Americana');
insert into cozinhas (id, nome) values (3, 'Italiana');
insert into cozinhas (id, nome) values (4, 'Árabe');
insert into cozinhas (id, nome) values (5, 'Japonesa');
insert into cozinhas (id, nome) values (6, 'Argentina');;
insert into restaurantes (nome, taxa_frete, cozinha_id, created_at, updated_at) values ('Milani', 0, 1,utc_timestamp,UTC_TIMESTAMP);
insert into restaurantes (nome, taxa_frete, cozinha_id, created_at, updated_at) values ('Hamburghini', 5, 2,UTC_TIMESTAMP, UTC_TIMESTAMP);
insert into restaurantes (nome, taxa_frete, cozinha_id, created_at, updated_at) values ('Nonna Casa Italiana', 25, 3, UTC_TIMESTAMP, UTC_TIMESTAMP);
insert into restaurantes (nome, taxa_frete, cozinha_id, created_at, updated_at) values ('Habibs', 10, 4, UTC_TIMESTAMP, UTC_TIMESTAMP);
insert into restaurantes (nome, taxa_frete, cozinha_id, created_at, updated_at) values ('Yasui', 10, 5, UTC_TIMESTAMP, UTC_TIMESTAMP);
insert into restaurantes (nome, taxa_frete, cozinha_id, created_at, updated_at) values ('Java Steakhouse', 12, 3, utc_timestamp, utc_timestamp);
insert into restaurantes (nome, taxa_frete, cozinha_id, created_at, updated_at) values ('Lanchonete do Tio Sam', 11, 4, utc_timestamp, utc_timestamp);
insert into restaurantes (nome, taxa_frete, cozinha_id, created_at, updated_at) values ('Bar da Maria', 6, 4, utc_timestamp, utc_timestamp);
insert into formas_pagamento (id, descricao) values (1, 'Cartão de crédito');
insert into formas_pagamento (id, descricao) values (2, 'Cartão de débito');
insert into formas_pagamento (id, descricao) values (3, 'Dinheiro');
insert into restaurante_forma_pagamento (restaurante_id, forma_pagamento_id) values (1, 1), (1, 2), (1, 3), (2, 1), (2, 2), (2, 3), (3, 1), (3, 2), (3, 3), (4, 1), (4, 2), (4, 3), (5, 1), (5, 2), (5, 3), (6, 1), (6, 2), (6, 3);
insert into permissao (id, nome, descricao) values (1, 'CONSULTAR_COZINHAS', 'Permite consultar cozinhas');
insert into permissao (id, nome, descricao) values (2, 'EDITAR_COZINHAS', 'Permite editar cozinhas');
insert into produtos (nome, descricao, preco, ativo, restaurante_id) values ('Porco com molho agridoce', 'Deliciosa carne suína ao molho especial', 78.90, 1, 1);
insert into produtos (nome, descricao, preco, ativo, restaurante_id) values ('Camarão tailandês', '16 camarões grandes ao molho picante', 110, 1, 1);
insert into produtos (nome, descricao, preco, ativo, restaurante_id) values ('Salada picante com carne grelhada', 'Salada de folhas com cortes finos de carne bovina grelhada e nosso molho especial de pimenta vermelha', 87.20, 1, 2);
insert into produtos (nome, descricao, preco, ativo, restaurante_id) values ('Garlic Naan', 'Pão tradicional indiano com cobertura de alho', 21, 1, 3);
insert into produtos (nome, descricao, preco, ativo, restaurante_id) values ('Murg Curry', 'Cubos de frango preparados com molho curry e especiarias', 43, 1, 3);
insert into produtos (nome, descricao, preco, ativo, restaurante_id) values ('Bife Ancho', 'Corte macio e suculento, com dois dedos de espessura, retirado da parte dianteira do contrafilé', 79, 1, 4);
insert into produtos (nome, descricao, preco, ativo, restaurante_id) values ('T-Bone', 'Corte muito saboroso, com um osso em formato de T, sendo de um lado o contrafilé e do outro o filé mignon', 89, 1, 4);
insert into produtos (nome, descricao, preco, ativo, restaurante_id) values ('Sanduíche X-Tudo', 'Sandubão com muito queijo, hamburger bovino, bacon, ovo, salada e maionese', 19, 1, 5);
insert into produtos (nome, descricao, preco, ativo, restaurante_id) values ('Espetinho de Cupim', 'Acompanha farinha, mandioca e vinagrete', 8, 1, 6);
create table cidades (id bigint not null auto_increment, nome varchar(255) not null, estado_id bigint not null, primary key (id)) engine=InnoDB;
create table cozinhas (id bigint not null auto_increment, nome varchar(255) not null, primary key (id)) engine=InnoDB;
create table estados (id bigint not null auto_increment, nome varchar(255) not null, primary key (id)) engine=InnoDB;
create table formas_pagamento (id bigint not null auto_increment, descricao varchar(255) not null, primary key (id)) engine=InnoDB;
create table grupo_permissao (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB;
create table grupos (id bigint not null auto_increment, nome varchar(255) not null, primary key (id)) engine=InnoDB;
create table permissao (id bigint not null auto_increment, descricao varchar(255) not null, nome varchar(255) not null, primary key (id)) engine=InnoDB;
create table produtos (id bigint not null auto_increment, ativo bit not null, descricao varchar(255) not null, nome varchar(255) not null, preco decimal(19,2) not null, restaurante_id bigint, primary key (id)) engine=InnoDB;
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB;
create table restaurantes (id bigint not null auto_increment, created_at datetime not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255) not null, taxa_frete decimal(19,2) not null, updated_at datetime not null, cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB;
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB;
create table usuarios (id bigint not null auto_increment, created_at datetime not null, email varchar(255) not null, nome varchar(255) not null, senha varchar(255) not null, primary key (id)) engine=InnoDB;
alter table cidades add constraint FKdt0b3ronwpi1upsrhaeq6r69n foreign key (estado_id) references estados (id);
alter table grupo_permissao add constraint FKh21kiw0y0hxg6birmdf2ef6vy foreign key (permissao_id) references permissao (id);
alter table grupo_permissao add constraint FKs3g951jp8j9tc3r4jh1jieup foreign key (grupo_id) references grupos (id);
alter table produtos add constraint FKsl3jhd8nhd103c5nm6yocnnkx foreign key (restaurante_id) references restaurantes (id);
alter table restaurante_forma_pagamento add constraint FKf6v3wv0kyv035nyqbfmuxepo2 foreign key (forma_pagamento_id) references formas_pagamento (id);
alter table restaurante_forma_pagamento add constraint FKm6ricm3gnnj4e3ev82495metc foreign key (restaurante_id) references restaurantes (id);
alter table restaurantes add constraint FKgdtjhnl3atr87y5s0tcnr2i5q foreign key (cozinha_id) references cozinhas (id);
alter table restaurantes add constraint FKjxh9a5cs0ke85v1t0uh6p9shb foreign key (endereco_cidade_id) references cidades (id);
alter table usuario_grupo add constraint FKamq3pnpufgkcq9w2q30b23ooj foreign key (grupo_id) references grupos (id);
alter table usuario_grupo add constraint FKheegykchmkd1rguqwiscbf3gv foreign key (usuario_id) references usuarios (id);
insert into estados (id, nome) values (1, 'Minas Gerais');
insert into estados (id, nome) values (2, 'São Paulo');
insert into estados (id, nome) values (3, 'Ceará');
insert into cidades (id, nome, estado_id) values (1, 'Uberlândia', 1);
insert into cidades (id, nome, estado_id) values (2, 'Belo Horizonte', 1);
insert into cidades (id, nome, estado_id) values (3, 'São Paulo', 2);
insert into cozinhas (id, nome) values (1, 'Brasileira');
insert into cozinhas (id, nome) values (2, 'Americana');
insert into cozinhas (id, nome) values (3, 'Italiana');
insert into cozinhas (id, nome) values (4, 'Árabe');
insert into cozinhas (id, nome) values (5, 'Japonesa');
insert into cozinhas (id, nome) values (6, 'Argentina');;
insert into restaurantes (nome, taxa_frete, cozinha_id, created_at, updated_at) values ('Milani', 0, 1,utc_timestamp,UTC_TIMESTAMP);
insert into restaurantes (nome, taxa_frete, cozinha_id, created_at, updated_at) values ('Hamburghini', 5, 2,UTC_TIMESTAMP, UTC_TIMESTAMP);
insert into restaurantes (nome, taxa_frete, cozinha_id, created_at, updated_at) values ('Nonna Casa Italiana', 25, 3, UTC_TIMESTAMP, UTC_TIMESTAMP);
insert into restaurantes (nome, taxa_frete, cozinha_id, created_at, updated_at) values ('Habibs', 10, 4, UTC_TIMESTAMP, UTC_TIMESTAMP);
insert into restaurantes (nome, taxa_frete, cozinha_id, created_at, updated_at) values ('Yasui', 10, 5, UTC_TIMESTAMP, UTC_TIMESTAMP);
insert into restaurantes (nome, taxa_frete, cozinha_id, created_at, updated_at) values ('Java Steakhouse', 12, 3, utc_timestamp, utc_timestamp);
insert into restaurantes (nome, taxa_frete, cozinha_id, created_at, updated_at) values ('Lanchonete do Tio Sam', 11, 4, utc_timestamp, utc_timestamp);
insert into restaurantes (nome, taxa_frete, cozinha_id, created_at, updated_at) values ('Bar da Maria', 6, 4, utc_timestamp, utc_timestamp);
insert into formas_pagamento (id, descricao) values (1, 'Cartão de crédito');
insert into formas_pagamento (id, descricao) values (2, 'Cartão de débito');
insert into formas_pagamento (id, descricao) values (3, 'Dinheiro');
insert into restaurante_forma_pagamento (restaurante_id, forma_pagamento_id) values (1, 1), (1, 2), (1, 3), (2, 1), (2, 2), (2, 3), (3, 1), (3, 2), (3, 3), (4, 1), (4, 2), (4, 3), (5, 1), (5, 2), (5, 3), (6, 1), (6, 2), (6, 3);
insert into permissao (id, nome, descricao) values (1, 'CONSULTAR_COZINHAS', 'Permite consultar cozinhas');
insert into permissao (id, nome, descricao) values (2, 'EDITAR_COZINHAS', 'Permite editar cozinhas');
insert into produtos (nome, descricao, preco, ativo, restaurante_id) values ('Porco com molho agridoce', 'Deliciosa carne suína ao molho especial', 78.90, 1, 1);
insert into produtos (nome, descricao, preco, ativo, restaurante_id) values ('Camarão tailandês', '16 camarões grandes ao molho picante', 110, 1, 1);
insert into produtos (nome, descricao, preco, ativo, restaurante_id) values ('Salada picante com carne grelhada', 'Salada de folhas com cortes finos de carne bovina grelhada e nosso molho especial de pimenta vermelha', 87.20, 1, 2);
insert into produtos (nome, descricao, preco, ativo, restaurante_id) values ('Garlic Naan', 'Pão tradicional indiano com cobertura de alho', 21, 1, 3);
insert into produtos (nome, descricao, preco, ativo, restaurante_id) values ('Murg Curry', 'Cubos de frango preparados com molho curry e especiarias', 43, 1, 3);
insert into produtos (nome, descricao, preco, ativo, restaurante_id) values ('Bife Ancho', 'Corte macio e suculento, com dois dedos de espessura, retirado da parte dianteira do contrafilé', 79, 1, 4);
insert into produtos (nome, descricao, preco, ativo, restaurante_id) values ('T-Bone', 'Corte muito saboroso, com um osso em formato de T, sendo de um lado o contrafilé e do outro o filé mignon', 89, 1, 4);
insert into produtos (nome, descricao, preco, ativo, restaurante_id) values ('Sanduíche X-Tudo', 'Sandubão com muito queijo, hamburger bovino, bacon, ovo, salada e maionese', 19, 1, 5);
insert into produtos (nome, descricao, preco, ativo, restaurante_id) values ('Espetinho de Cupim', 'Acompanha farinha, mandioca e vinagrete', 8, 1, 6);
create table cidades (id bigint not null auto_increment, nome varchar(255) not null, estado_id bigint not null, primary key (id)) engine=InnoDB;
create table cozinhas (id bigint not null auto_increment, nome varchar(255) not null, primary key (id)) engine=InnoDB;
create table estados (id bigint not null auto_increment, nome varchar(255) not null, primary key (id)) engine=InnoDB;
create table formas_pagamento (id bigint not null auto_increment, descricao varchar(255) not null, primary key (id)) engine=InnoDB;
create table grupo_permissao (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB;
create table grupos (id bigint not null auto_increment, nome varchar(255) not null, primary key (id)) engine=InnoDB;
create table permissao (id bigint not null auto_increment, descricao varchar(255) not null, nome varchar(255) not null, primary key (id)) engine=InnoDB;
create table produtos (id bigint not null auto_increment, ativo bit not null, descricao varchar(255) not null, nome varchar(255) not null, preco decimal(19,2) not null, restaurante_id bigint, primary key (id)) engine=InnoDB;
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB;
create table restaurantes (id bigint not null auto_increment, created_at datetime not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255) not null, taxa_frete decimal(19,2) not null, updated_at datetime not null, cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB;
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB;
create table usuarios (id bigint not null auto_increment, created_at datetime not null, email varchar(255) not null, nome varchar(255) not null, senha varchar(255) not null, primary key (id)) engine=InnoDB;
alter table cidades add constraint FKdt0b3ronwpi1upsrhaeq6r69n foreign key (estado_id) references estados (id);
alter table grupo_permissao add constraint FKh21kiw0y0hxg6birmdf2ef6vy foreign key (permissao_id) references permissao (id);
alter table grupo_permissao add constraint FKs3g951jp8j9tc3r4jh1jieup foreign key (grupo_id) references grupos (id);
alter table produtos add constraint FKsl3jhd8nhd103c5nm6yocnnkx foreign key (restaurante_id) references restaurantes (id);
alter table restaurante_forma_pagamento add constraint FKf6v3wv0kyv035nyqbfmuxepo2 foreign key (forma_pagamento_id) references formas_pagamento (id);
alter table restaurante_forma_pagamento add constraint FKm6ricm3gnnj4e3ev82495metc foreign key (restaurante_id) references restaurantes (id);
alter table restaurantes add constraint FKgdtjhnl3atr87y5s0tcnr2i5q foreign key (cozinha_id) references cozinhas (id);
alter table restaurantes add constraint FKjxh9a5cs0ke85v1t0uh6p9shb foreign key (endereco_cidade_id) references cidades (id);
alter table usuario_grupo add constraint FKamq3pnpufgkcq9w2q30b23ooj foreign key (grupo_id) references grupos (id);
alter table usuario_grupo add constraint FKheegykchmkd1rguqwiscbf3gv foreign key (usuario_id) references usuarios (id);
insert into estados (id, nome) values (1, 'Minas Gerais');
insert into estados (id, nome) values (2, 'São Paulo');
insert into estados (id, nome) values (3, 'Ceará');
insert into cidades (id, nome, estado_id) values (1, 'Uberlândia', 1);
insert into cidades (id, nome, estado_id) values (2, 'Belo Horizonte', 1);
insert into cidades (id, nome, estado_id) values (3, 'São Paulo', 2);
insert into cozinhas (id, nome) values (1, 'Brasileira');
insert into cozinhas (id, nome) values (2, 'Americana');
insert into cozinhas (id, nome) values (3, 'Italiana');
insert into cozinhas (id, nome) values (4, 'Árabe');
insert into cozinhas (id, nome) values (5, 'Japonesa');
insert into cozinhas (id, nome) values (6, 'Argentina');;
insert into restaurantes (nome, taxa_frete, cozinha_id, created_at, updated_at) values ('Milani', 0, 1,utc_timestamp,UTC_TIMESTAMP);
insert into restaurantes (nome, taxa_frete, cozinha_id, created_at, updated_at) values ('Hamburghini', 5, 2,UTC_TIMESTAMP, UTC_TIMESTAMP);
insert into restaurantes (nome, taxa_frete, cozinha_id, created_at, updated_at) values ('Nonna Casa Italiana', 25, 3, UTC_TIMESTAMP, UTC_TIMESTAMP);
insert into restaurantes (nome, taxa_frete, cozinha_id, created_at, updated_at) values ('Habibs', 10, 4, UTC_TIMESTAMP, UTC_TIMESTAMP);
insert into restaurantes (nome, taxa_frete, cozinha_id, created_at, updated_at) values ('Yasui', 10, 5, UTC_TIMESTAMP, UTC_TIMESTAMP);
insert into restaurantes (nome, taxa_frete, cozinha_id, created_at, updated_at) values ('Java Steakhouse', 12, 3, utc_timestamp, utc_timestamp);
insert into restaurantes (nome, taxa_frete, cozinha_id, created_at, updated_at) values ('Lanchonete do Tio Sam', 11, 4, utc_timestamp, utc_timestamp);
insert into restaurantes (nome, taxa_frete, cozinha_id, created_at, updated_at) values ('Bar da Maria', 6, 4, utc_timestamp, utc_timestamp);
insert into formas_pagamento (id, descricao) values (1, 'Cartão de crédito');
insert into formas_pagamento (id, descricao) values (2, 'Cartão de débito');
insert into formas_pagamento (id, descricao) values (3, 'Dinheiro');
insert into restaurante_forma_pagamento (restaurante_id, forma_pagamento_id) values (1, 1), (1, 2), (1, 3), (2, 1), (2, 2), (2, 3), (3, 1), (3, 2), (3, 3), (4, 1), (4, 2), (4, 3), (5, 1), (5, 2), (5, 3), (6, 1), (6, 2), (6, 3);
insert into permissao (id, nome, descricao) values (1, 'CONSULTAR_COZINHAS', 'Permite consultar cozinhas');
insert into permissao (id, nome, descricao) values (2, 'EDITAR_COZINHAS', 'Permite editar cozinhas');
insert into produtos (nome, descricao, preco, ativo, restaurante_id) values ('Porco com molho agridoce', 'Deliciosa carne suína ao molho especial', 78.90, 1, 1);
insert into produtos (nome, descricao, preco, ativo, restaurante_id) values ('Camarão tailandês', '16 camarões grandes ao molho picante', 110, 1, 1);
insert into produtos (nome, descricao, preco, ativo, restaurante_id) values ('Salada picante com carne grelhada', 'Salada de folhas com cortes finos de carne bovina grelhada e nosso molho especial de pimenta vermelha', 87.20, 1, 2);
insert into produtos (nome, descricao, preco, ativo, restaurante_id) values ('Garlic Naan', 'Pão tradicional indiano com cobertura de alho', 21, 1, 3);
insert into produtos (nome, descricao, preco, ativo, restaurante_id) values ('Murg Curry', 'Cubos de frango preparados com molho curry e especiarias', 43, 1, 3);
insert into produtos (nome, descricao, preco, ativo, restaurante_id) values ('Bife Ancho', 'Corte macio e suculento, com dois dedos de espessura, retirado da parte dianteira do contrafilé', 79, 1, 4);
insert into produtos (nome, descricao, preco, ativo, restaurante_id) values ('T-Bone', 'Corte muito saboroso, com um osso em formato de T, sendo de um lado o contrafilé e do outro o filé mignon', 89, 1, 4);
insert into produtos (nome, descricao, preco, ativo, restaurante_id) values ('Sanduíche X-Tudo', 'Sandubão com muito queijo, hamburger bovino, bacon, ovo, salada e maionese', 19, 1, 5);
insert into produtos (nome, descricao, preco, ativo, restaurante_id) values ('Espetinho de Cupim', 'Acompanha farinha, mandioca e vinagrete', 8, 1, 6);
create table cidades (id bigint not null auto_increment, nome varchar(255) not null, estado_id bigint not null, primary key (id)) engine=InnoDB;
create table cozinhas (id bigint not null auto_increment, nome varchar(255) not null, primary key (id)) engine=InnoDB;
create table estados (id bigint not null auto_increment, nome varchar(255) not null, primary key (id)) engine=InnoDB;
create table formas_pagamento (id bigint not null auto_increment, descricao varchar(255) not null, primary key (id)) engine=InnoDB;
create table grupo_permissao (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB;
create table grupos (id bigint not null auto_increment, nome varchar(255) not null, primary key (id)) engine=InnoDB;
create table permissao (id bigint not null auto_increment, descricao varchar(255) not null, nome varchar(255) not null, primary key (id)) engine=InnoDB;
create table produtos (id bigint not null auto_increment, ativo bit not null, descricao varchar(255) not null, nome varchar(255) not null, preco decimal(19,2) not null, restaurante_id bigint, primary key (id)) engine=InnoDB;
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB;
create table restaurantes (id bigint not null auto_increment, created_at datetime not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255) not null, taxa_frete decimal(19,2) not null, updated_at datetime not null, cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB;
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB;
create table usuarios (id bigint not null auto_increment, created_at datetime not null, email varchar(255) not null, nome varchar(255) not null, senha varchar(255) not null, primary key (id)) engine=InnoDB;
alter table cidades add constraint FKdt0b3ronwpi1upsrhaeq6r69n foreign key (estado_id) references estados (id);
alter table grupo_permissao add constraint FKh21kiw0y0hxg6birmdf2ef6vy foreign key (permissao_id) references permissao (id);
alter table grupo_permissao add constraint FKs3g951jp8j9tc3r4jh1jieup foreign key (grupo_id) references grupos (id);
alter table produtos add constraint FKsl3jhd8nhd103c5nm6yocnnkx foreign key (restaurante_id) references restaurantes (id);
alter table restaurante_forma_pagamento add constraint FKf6v3wv0kyv035nyqbfmuxepo2 foreign key (forma_pagamento_id) references formas_pagamento (id);
alter table restaurante_forma_pagamento add constraint FKm6ricm3gnnj4e3ev82495metc foreign key (restaurante_id) references restaurantes (id);
alter table restaurantes add constraint FKgdtjhnl3atr87y5s0tcnr2i5q foreign key (cozinha_id) references cozinhas (id);
alter table restaurantes add constraint FKjxh9a5cs0ke85v1t0uh6p9shb foreign key (endereco_cidade_id) references cidades (id);
alter table usuario_grupo add constraint FKamq3pnpufgkcq9w2q30b23ooj foreign key (grupo_id) references grupos (id);
alter table usuario_grupo add constraint FKheegykchmkd1rguqwiscbf3gv foreign key (usuario_id) references usuarios (id);
insert into estados (id, nome) values (1, 'Minas Gerais');
insert into estados (id, nome) values (2, 'São Paulo');
insert into estados (id, nome) values (3, 'Ceará');
insert into cidades (id, nome, estado_id) values (1, 'Uberlândia', 1);
insert into cidades (id, nome, estado_id) values (2, 'Belo Horizonte', 1);
insert into cidades (id, nome, estado_id) values (3, 'São Paulo', 2);
insert into cozinhas (id, nome) values (1, 'Brasileira');
insert into cozinhas (id, nome) values (2, 'Americana');
insert into cozinhas (id, nome) values (3, 'Italiana');
insert into cozinhas (id, nome) values (4, 'Árabe');
insert into cozinhas (id, nome) values (5, 'Japonesa');
insert into cozinhas (id, nome) values (6, 'Argentina');;
insert into restaurantes (nome, taxa_frete, cozinha_id, created_at, updated_at) values ('Milani', 0, 1,utc_timestamp,UTC_TIMESTAMP);
insert into restaurantes (nome, taxa_frete, cozinha_id, created_at, updated_at) values ('Hamburghini', 5, 2,UTC_TIMESTAMP, UTC_TIMESTAMP);
insert into restaurantes (nome, taxa_frete, cozinha_id, created_at, updated_at) values ('Nonna Casa Italiana', 25, 3, UTC_TIMESTAMP, UTC_TIMESTAMP);
insert into restaurantes (nome, taxa_frete, cozinha_id, created_at, updated_at) values ('Habibs', 10, 4, UTC_TIMESTAMP, UTC_TIMESTAMP);
insert into restaurantes (nome, taxa_frete, cozinha_id, created_at, updated_at) values ('Yasui', 10, 5, UTC_TIMESTAMP, UTC_TIMESTAMP);
insert into restaurantes (nome, taxa_frete, cozinha_id, created_at, updated_at) values ('Java Steakhouse', 12, 3, utc_timestamp, utc_timestamp);
insert into restaurantes (nome, taxa_frete, cozinha_id, created_at, updated_at) values ('Lanchonete do Tio Sam', 11, 4, utc_timestamp, utc_timestamp);
insert into restaurantes (nome, taxa_frete, cozinha_id, created_at, updated_at) values ('Bar da Maria', 6, 4, utc_timestamp, utc_timestamp);
insert into formas_pagamento (id, descricao) values (1, 'Cartão de crédito');
insert into formas_pagamento (id, descricao) values (2, 'Cartão de débito');
insert into formas_pagamento (id, descricao) values (3, 'Dinheiro');
insert into restaurante_forma_pagamento (restaurante_id, forma_pagamento_id) values (1, 1), (1, 2), (1, 3), (2, 1), (2, 2), (2, 3), (3, 1), (3, 2), (3, 3), (4, 1), (4, 2), (4, 3), (5, 1), (5, 2), (5, 3), (6, 1), (6, 2), (6, 3);
insert into permissao (id, nome, descricao) values (1, 'CONSULTAR_COZINHAS', 'Permite consultar cozinhas');
insert into permissao (id, nome, descricao) values (2, 'EDITAR_COZINHAS', 'Permite editar cozinhas');
insert into produtos (nome, descricao, preco, ativo, restaurante_id) values ('Porco com molho agridoce', 'Deliciosa carne suína ao molho especial', 78.90, 1, 1);
insert into produtos (nome, descricao, preco, ativo, restaurante_id) values ('Camarão tailandês', '16 camarões grandes ao molho picante', 110, 1, 1);
insert into produtos (nome, descricao, preco, ativo, restaurante_id) values ('Salada picante com carne grelhada', 'Salada de folhas com cortes finos de carne bovina grelhada e nosso molho especial de pimenta vermelha', 87.20, 1, 2);
insert into produtos (nome, descricao, preco, ativo, restaurante_id) values ('Garlic Naan', 'Pão tradicional indiano com cobertura de alho', 21, 1, 3);
insert into produtos (nome, descricao, preco, ativo, restaurante_id) values ('Murg Curry', 'Cubos de frango preparados com molho curry e especiarias', 43, 1, 3);
insert into produtos (nome, descricao, preco, ativo, restaurante_id) values ('Bife Ancho', 'Corte macio e suculento, com dois dedos de espessura, retirado da parte dianteira do contrafilé', 79, 1, 4);
insert into produtos (nome, descricao, preco, ativo, restaurante_id) values ('T-Bone', 'Corte muito saboroso, com um osso em formato de T, sendo de um lado o contrafilé e do outro o filé mignon', 89, 1, 4);
insert into produtos (nome, descricao, preco, ativo, restaurante_id) values ('Sanduíche X-Tudo', 'Sandubão com muito queijo, hamburger bovino, bacon, ovo, salada e maionese', 19, 1, 5);
insert into produtos (nome, descricao, preco, ativo, restaurante_id) values ('Espetinho de Cupim', 'Acompanha farinha, mandioca e vinagrete', 8, 1, 6);
create table cidades (id bigint not null auto_increment, nome varchar(255) not null, estado_id bigint not null, primary key (id)) engine=InnoDB;
create table cozinhas (id bigint not null auto_increment, nome varchar(255) not null, primary key (id)) engine=InnoDB;
create table estados (id bigint not null auto_increment, nome varchar(255) not null, primary key (id)) engine=InnoDB;
create table formas_pagamento (id bigint not null auto_increment, descricao varchar(255) not null, primary key (id)) engine=InnoDB;
create table grupo_permissao (grupo_id bigint not null, permissao_id bigint not null) engine=InnoDB;
create table grupos (id bigint not null auto_increment, nome varchar(255) not null, primary key (id)) engine=InnoDB;
create table permissao (id bigint not null auto_increment, descricao varchar(255) not null, nome varchar(255) not null, primary key (id)) engine=InnoDB;
create table produtos (id bigint not null auto_increment, ativo bit not null, descricao varchar(255) not null, nome varchar(255) not null, preco decimal(19,2) not null, restaurante_id bigint, primary key (id)) engine=InnoDB;
create table restaurante_forma_pagamento (restaurante_id bigint not null, forma_pagamento_id bigint not null) engine=InnoDB;
create table restaurantes (id bigint not null auto_increment, created_at datetime not null, endereco_bairro varchar(255), endereco_cep varchar(255), endereco_complemento varchar(255), endereco_logradouro varchar(255), endereco_numero varchar(255), nome varchar(255) not null, taxa_frete decimal(19,2) not null, updated_at datetime not null, cozinha_id bigint not null, endereco_cidade_id bigint, primary key (id)) engine=InnoDB;
create table usuario_grupo (usuario_id bigint not null, grupo_id bigint not null) engine=InnoDB;
create table usuarios (id bigint not null auto_increment, created_at datetime not null, email varchar(255) not null, nome varchar(255) not null, senha varchar(255) not null, primary key (id)) engine=InnoDB;
alter table cidades add constraint FKdt0b3ronwpi1upsrhaeq6r69n foreign key (estado_id) references estados (id);
alter table grupo_permissao add constraint FKh21kiw0y0hxg6birmdf2ef6vy foreign key (permissao_id) references permissao (id);
alter table grupo_permissao add constraint FKs3g951jp8j9tc3r4jh1jieup foreign key (grupo_id) references grupos (id);
alter table produtos add constraint FKsl3jhd8nhd103c5nm6yocnnkx foreign key (restaurante_id) references restaurantes (id);
alter table restaurante_forma_pagamento add constraint FKf6v3wv0kyv035nyqbfmuxepo2 foreign key (forma_pagamento_id) references formas_pagamento (id);
alter table restaurante_forma_pagamento add constraint FKm6ricm3gnnj4e3ev82495metc foreign key (restaurante_id) references restaurantes (id);
alter table restaurantes add constraint FKgdtjhnl3atr87y5s0tcnr2i5q foreign key (cozinha_id) references cozinhas (id);
alter table restaurantes add constraint FKjxh9a5cs0ke85v1t0uh6p9shb foreign key (endereco_cidade_id) references cidades (id);
alter table usuario_grupo add constraint FKamq3pnpufgkcq9w2q30b23ooj foreign key (grupo_id) references grupos (id);
alter table usuario_grupo add constraint FKheegykchmkd1rguqwiscbf3gv foreign key (usuario_id) references usuarios (id);
insert into estados (id, nome) values (1, 'Minas Gerais');
insert into estados (id, nome) values (2, 'São Paulo');
insert into estados (id, nome) values (3, 'Ceará');
insert into cidades (id, nome, estado_id) values (1, 'Uberlândia', 1);
insert into cidades (id, nome, estado_id) values (2, 'Belo Horizonte', 1);
insert into cidades (id, nome, estado_id) values (3, 'São Paulo', 2);
insert into cozinhas (id, nome) values (1, 'Brasileira');
insert into cozinhas (id, nome) values (2, 'Americana');
insert into cozinhas (id, nome) values (3, 'Italiana');
insert into cozinhas (id, nome) values (4, 'Árabe');
insert into cozinhas (id, nome) values (5, 'Japonesa');
insert into cozinhas (id, nome) values (6, 'Argentina');;
insert into restaurantes (nome, taxa_frete, cozinha_id, created_at, updated_at) values ('Milani', 0, 1,utc_timestamp,UTC_TIMESTAMP);
insert into restaurantes (nome, taxa_frete, cozinha_id, created_at, updated_at) values ('Hamburghini', 5, 2,UTC_TIMESTAMP, UTC_TIMESTAMP);
insert into restaurantes (nome, taxa_frete, cozinha_id, created_at, updated_at) values ('Nonna Casa Italiana', 25, 3, UTC_TIMESTAMP, UTC_TIMESTAMP);
insert into restaurantes (nome, taxa_frete, cozinha_id, created_at, updated_at) values ('Habibs', 10, 4, UTC_TIMESTAMP, UTC_TIMESTAMP);
insert into restaurantes (nome, taxa_frete, cozinha_id, created_at, updated_at) values ('Yasui', 10, 5, UTC_TIMESTAMP, UTC_TIMESTAMP);
insert into restaurantes (nome, taxa_frete, cozinha_id, created_at, updated_at) values ('Java Steakhouse', 12, 3, utc_timestamp, utc_timestamp);
insert into restaurantes (nome, taxa_frete, cozinha_id, created_at, updated_at) values ('Lanchonete do Tio Sam', 11, 4, utc_timestamp, utc_timestamp);
insert into restaurantes (nome, taxa_frete, cozinha_id, created_at, updated_at) values ('Bar da Maria', 6, 4, utc_timestamp, utc_timestamp);
insert into formas_pagamento (id, descricao) values (1, 'Cartão de crédito');
insert into formas_pagamento (id, descricao) values (2, 'Cartão de débito');
insert into formas_pagamento (id, descricao) values (3, 'Dinheiro');
insert into restaurante_forma_pagamento (restaurante_id, forma_pagamento_id) values (1, 1), (1, 2), (1, 3), (2, 1), (2, 2), (2, 3), (3, 1), (3, 2), (3, 3), (4, 1), (4, 2), (4, 3), (5, 1), (5, 2), (5, 3), (6, 1), (6, 2), (6, 3);
insert into permissao (id, nome, descricao) values (1, 'CONSULTAR_COZINHAS', 'Permite consultar cozinhas');
insert into permissao (id, nome, descricao) values (2, 'EDITAR_COZINHAS', 'Permite editar cozinhas');
insert into produtos (nome, descricao, preco, ativo, restaurante_id) values ('Porco com molho agridoce', 'Deliciosa carne suína ao molho especial', 78.90, 1, 1);
insert into produtos (nome, descricao, preco, ativo, restaurante_id) values ('Camarão tailandês', '16 camarões grandes ao molho picante', 110, 1, 1);
insert into produtos (nome, descricao, preco, ativo, restaurante_id) values ('Salada picante com carne grelhada', 'Salada de folhas com cortes finos de carne bovina grelhada e nosso molho especial de pimenta vermelha', 87.20, 1, 2);
insert into produtos (nome, descricao, preco, ativo, restaurante_id) values ('Garlic Naan', 'Pão tradicional indiano com cobertura de alho', 21, 1, 3);
insert into produtos (nome, descricao, preco, ativo, restaurante_id) values ('Murg Curry', 'Cubos de frango preparados com molho curry e especiarias', 43, 1, 3);
insert into produtos (nome, descricao, preco, ativo, restaurante_id) values ('Bife Ancho', 'Corte macio e suculento, com dois dedos de espessura, retirado da parte dianteira do contrafilé', 79, 1, 4);
insert into produtos (nome, descricao, preco, ativo, restaurante_id) values ('T-Bone', 'Corte muito saboroso, com um osso em formato de T, sendo de um lado o contrafilé e do outro o filé mignon', 89, 1, 4);
insert into produtos (nome, descricao, preco, ativo, restaurante_id) values ('Sanduíche X-Tudo', 'Sandubão com muito queijo, hamburger bovino, bacon, ovo, salada e maionese', 19, 1, 5);
insert into produtos (nome, descricao, preco, ativo, restaurante_id) values ('Espetinho de Cupim', 'Acompanha farinha, mandioca e vinagrete', 8, 1, 6);
