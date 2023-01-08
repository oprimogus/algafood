package com.oprimogus.algafood.infrastructure.repository;

import com.oprimogus.algafood.domain.model.Cidade;
import com.oprimogus.algafood.domain.repository.ICidadeRepository;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;

@Component
public class CidadeRepository implements ICidadeRepository {

    @PersistenceContext
    private EntityManager manager;

    @Override
    public List<Cidade> list() {
        return manager.createQuery("from Cidade", Cidade.class).getResultList();
    }

    @Override
    public Cidade find(Long id) {
        return manager.find(Cidade.class, id);
    }

    @Override
    @Transactional
    public Cidade save(Cidade cidade) {
        return manager.merge(cidade);
    }

    @Override
    @Transactional
    public void remove(Cidade cidade) {
        cidade = find(cidade.getId());
        manager.remove(cidade);
    }
}
