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

insert into restaurantes (nome, taxa_frete, cozinha_id, created_at, updated_at) values ('Milani', 0, 1,utc_timestamp,UTC_TIMESTAMP);
insert into restaurantes (nome, taxa_frete, cozinha_id, created_at, updated_at) values ('Hamburghini', 5, 2,UTC_TIMESTAMP, UTC_TIMESTAMP);
insert into restaurantes (nome, taxa_frete, cozinha_id, created_at, updated_at) values ('Nonna Casa Italiana', 25, 3, UTC_TIMESTAMP, UTC_TIMESTAMP);
insert into restaurantes (nome, taxa_frete, cozinha_id, created_at, updated_at) values ('Habibs', 10, 4, UTC_TIMESTAMP, UTC_TIMESTAMP);
insert into restaurantes (nome, taxa_frete, cozinha_id, created_at, updated_at) values ('Yasui', 10, 5, UTC_TIMESTAMP, UTC_TIMESTAMP);

insert into formas_pagamento (id, descricao) values (1, 'Cartão de crédito');
insert into formas_pagamento (id, descricao) values (2, 'Cartão de débito');
insert into formas_pagamento (id, descricao) values (3, 'Dinheiro');


insert into restaurante_forma_pagamento (restaurante_id, forma_pagamento_id) values (1, 1), (1, 2), (1, 3), (2, 1), (2, 2), (2, 3), (3, 1), (3, 2), (3, 3), (4, 1), (4, 2), (4, 3), (5, 1), (5, 2), (5, 3);

insert into permissao (id, nome, descricao) values (1, 'CONSULTAR_COZINHAS', 'Permite consultar cozinhas');
insert into permissao (id, nome, descricao) values (2, 'EDITAR_COZINHAS', 'Permite editar cozinhas');