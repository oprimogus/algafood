package com.oprimogus.algafood.domain.repository;

import com.oprimogus.algafood.domain.model.Cozinha;

import java.util.List;

public interface ICozinhaRepository {

    List<Cozinha> list();
    Cozinha find (Long id);
    Cozinha save(Cozinha cozinha);
    void remove(Cozinha cozinha);
}
