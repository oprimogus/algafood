package com.oprimogus.algafood.infrastructure.repository;

import com.oprimogus.algafood.domain.model.Restaurante;
import com.oprimogus.algafood.domain.repository.IRestauranteRepository;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;
@Component
public class RestauranteRepository implements IRestauranteRepository {

    @PersistenceContext
    private EntityManager manager;

    @Override
    public List<Restaurante> list() {
        return manager.createQuery("from Restaurante", Restaurante.class).getResultList();
    }

    @Override
    public Restaurante find(Long id) {
        return manager.find(Restaurante.class, id);
    }

    @Override
    @Transactional
    public Restaurante save(Restaurante restaurante) {
        return manager.merge(restaurante);
    }

    @Override
    @Transactional
    public void remove(Restaurante restaurante) {
        restaurante = find(restaurante.getId());
        manager.remove(restaurante);
    }
}
