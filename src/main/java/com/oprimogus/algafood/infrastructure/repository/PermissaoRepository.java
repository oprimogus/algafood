package com.oprimogus.algafood.infrastructure.repository;

import com.oprimogus.algafood.domain.model.Permissao;
import com.oprimogus.algafood.domain.repository.IPermissaoRepository;
import org.springframework.stereotype.Component;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;

@Component
class PermissaoRepository implements IPermissaoRepository {

    @PersistenceContext
    private EntityManager manager;

    @Override
    public List<Permissao> list() {
        return manager.createQuery("from Permissao", Permissao.class).getResultList();
    }

    @Override
    public Permissao find(Long id) {
        return manager.find(Permissao.class, id);
    }

    @Override
    public Permissao save(Permissao permissao) {
        return manager.merge(permissao);
    }

    @Override
    public void remove(Permissao permissao) {
        permissao = find(permissao.getId());
        manager.remove(permissao);

    }
}
