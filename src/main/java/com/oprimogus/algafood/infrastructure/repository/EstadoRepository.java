package com.oprimogus.algafood.infrastructure.repository;

import com.oprimogus.algafood.domain.model.Estado;
import com.oprimogus.algafood.domain.repository.IEstadoRepository;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;

@Component
public class EstadoRepository implements IEstadoRepository {
    @PersistenceContext
    private EntityManager manager;

    @Override
    public List<Estado> list() {
        return manager.createQuery("from Estado", Estado.class).getResultList();
    }

    @Override
    public Estado find(Long id) {
        return manager.find(Estado.class, id);
    }

    @Override
    @Transactional
    public Estado save(Estado estado) {
        return manager.merge(estado);
    }

    @Override
    @Transactional
    public void remove(Long estadoId) {
        Estado estado = find(estadoId);
        if (estado == null) {
            throw new EmptyResultDataAccessException(1);
        }
        manager.remove(estado);
    }
}
