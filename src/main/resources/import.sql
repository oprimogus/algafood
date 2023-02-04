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