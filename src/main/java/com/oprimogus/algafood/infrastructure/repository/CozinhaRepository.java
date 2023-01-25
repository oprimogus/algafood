package com.oprimogus.algafood.infrastructure.repository;

import com.oprimogus.algafood.domain.model.Cozinha;
import com.oprimogus.algafood.domain.repository.ICozinhaRepository;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;
@Component
public class CozinhaRepository implements ICozinhaRepository {

    @PersistenceContext
    private EntityManager manager;

    @Override
    public List<Cozinha> list() {
        return manager.createQuery("from Cozinha", Cozinha.class).getResultList();
    }

    @Override
    public Cozinha find(Long id) {
        return manager.find(Cozinha.class, id);
    }

    @Override
    @Transactional
    public Cozinha save(Cozinha cozinha) {
        return manager.merge(cozinha);
    }
    @Override
    @Transactional
    public void remove(Long Id) {
        Cozinha cozinha = find(Id);
        if (cozinha == null){
            throw new EmptyResultDataAccessException(1);
        }
        manager.remove(cozinha);


    }
}
