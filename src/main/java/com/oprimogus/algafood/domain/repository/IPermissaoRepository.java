package com.oprimogus.algafood.domain.repository;

import com.oprimogus.algafood.domain.model.Permissao;

import java.util.List;

public interface IPermissaoRepository {
    List<Permissao> list();
    Permissao find(Long id);
    Permissao save(Permissao permissao);
    void remove(Permissao permissao);

}