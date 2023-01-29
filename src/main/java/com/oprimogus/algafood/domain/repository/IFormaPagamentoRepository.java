package com.oprimogus.algafood.domain.repository;

import com.oprimogus.algafood.domain.model.FormaPagamento;
import org.springframework.data.jpa.repository.JpaRepository;

public interface IFormaPagamentoRepository extends JpaRepository<FormaPagamento, Long> {

}
