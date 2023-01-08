package com.oprimogus.algafood.infrastructure.repository;

import com.oprimogus.algafood.domain.model.Cidade;
import com.oprimogus.algafood.domain.model.FormaPagamento;
import com.oprimogus.algafood.domain.repository.IFormaPagamentoRepository;
import org.springframework.stereotype.Component;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;

@Component
class FormaPagamentoRepository implements IFormaPagamentoRepository {
    @PersistenceContext
    private EntityManager manager;

    @Override
    public List<FormaPagamento> list() {
        return manager.createQuery("from FormaPagamento", FormaPagamento.class).getResultList();
    }

    @Override
    public FormaPagamento find(Long id) {
        return manager.find(FormaPagamento.class, id);
    }

    @Override
    public FormaPagamento save(FormaPagamento formaPagamento) {
        return manager.merge(formaPagamento);
    }

    @Override
    public void remove(FormaPagamento formaPagamento) {
        formaPagamento = find(formaPagamento.getId());
        manager.remove(formaPagamento);
    }
}
