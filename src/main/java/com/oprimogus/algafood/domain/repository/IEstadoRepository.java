package com.oprimogus.algafood.domain.repository;

import com.oprimogus.algafood.domain.model.Estado;

import java.util.List;

public interface IEstadoRepository {
    List<Estado> list();
    Estado find(Long id);
    Estado save(Estado estado);
    void remove(Long id);

}
