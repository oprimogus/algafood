package com.oprimogus.algafood.domain.repository;

import com.oprimogus.algafood.domain.model.Cidade;
import com.oprimogus.algafood.domain.model.FormaPagamento;

import java.util.List;

public interface ICidadeRepository {
    List<Cidade> list();
    Cidade find (Long id);
    Cidade save (Cidade cidade);
    void remove (Cidade cidade);
}
