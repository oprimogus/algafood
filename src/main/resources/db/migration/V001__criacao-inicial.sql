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
    created_at datetime not null,
    endereco_bairro varchar(255),
    endereco_cep varchar(255),
    endereco_complemento varchar(255),
    endereco_logradouro varchar(255),
    endereco_numero varchar(255),
    nome varchar(30) not null,
    taxa_frete decimal(19,2) not null,
    updated_at datetime not null,
    cozinha_id bigint not null,
    endereco_cidade_id bigint,
    primary key (id)
    ) engine=InnoDB DEFAULT charset=utf8;

create table usuario_grupo (
    usuario_id bigint not null,
    grupo_id bigint not null
    ) engine=InnoDB DEFAULT charset=utf8;

create table usuarios (
    id bigint not null auto_increment,
    created_at datetime not null,
    email varchar(120) not null,
    nome varchar(60) not null,
    senha varchar(255) not null,
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


