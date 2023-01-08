package com.oprimogus.algafood.infrastructure.repository;

import com.oprimogus.algafood.domain.model.Estado;
import com.oprimogus.algafood.domain.repository.IEstadoRepository;
import org.springframework.stereotype.Component;

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
    public Estado save(Estado estado) {
        return manager.merge(estado);
    }

    @Override
    public void remove(Estado estado) {
        estado = find(estado.getId());
        manager.remove(estado);
    }
}
