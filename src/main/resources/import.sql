insert into estados (id, nome) values (1, 'Minas Gerais');
insert into estados (id, nome) values (2, 'São Paulo');
insert into estados (id, nome) values (3, 'Ceará');

insert into cidades (id, nome, estado_id) values (1, 'Uberlândia', 1);
insert into cidades (id, nome, estado_id) values (2, 'Belo Horizonte', 1);
insert into cidades (id, nome, estado_id) values (3, 'São Paulo', 2);
insert into cidades (id, nome, estado_id) values (4, 'Campinas', 2);
insert into cidades (id, nome, estado_id) values (5, 'Fortaleza', 3);

insert into cozinhas (id, nome) values (1, 'Brasileira');
insert into cozinhas (id, nome) values (2, 'Americana');
insert into cozinhas (id, nome) values (3, 'Italiana');
insert into cozinhas (id, nome) values (4, 'Árabe');
insert into cozinhas (id, nome) values (5, 'Japonesa');

insert into restaurantes (nome, taxa_frete, cozinha_id) values ('Milani', 0, 1);
insert into restaurantes (nome, taxa_frete, cozinha_id) values ('Hamburghini', 5, 2);
insert into restaurantes (nome, taxa_frete, cozinha_id) values ('Nonna Casa Italiana', 25, 3);
insert into restaurantes (nome, taxa_frete, cozinha_id) values ('Habibs', 10, 4);
insert into restaurantes (nome, taxa_frete, cozinha_id) values ('Yasui', 10, 5);

insert into formas_pagamento (id, descricao) values (1, 'Cartão de crédito');
insert into formas_pagamento (id, descricao) values (2, 'Cartão de débito');
insert into formas_pagamento (id, descricao) values (3, 'Dinheiro');

insert into permissao (id, nome, descricao) values (1, 'CONSULTAR_COZINHAS', 'Permite consultar cozinhas');
insert into permissao (id, nome, descricao) values (2, 'EDITAR_COZINHAS', 'Permite editar cozinhas');