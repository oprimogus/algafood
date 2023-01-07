package com.oprimogus.algafood.domain.repository;

import com.oprimogus.algafood.domain.model.Restaurante;

import java.util.List;

public interface IRestauranteRepository {

    List<Restaurante> list();
    Restaurante find(Long id);
    Restaurante save(Restaurante restaurante);
    void remove (Restaurante restaurante);

}
