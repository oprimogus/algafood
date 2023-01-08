package com.oprimogus.algafood.domain.repository;

import com.oprimogus.algafood.domain.model.FormaPagamento;

import java.util.List;

public interface IFormaPagamentoRepository {
    List<FormaPagamento> list();
    FormaPagamento find (Long id);
    FormaPagamento save (FormaPagamento formaPagamento);
    void remove (FormaPagamento formaPagamento);
}
