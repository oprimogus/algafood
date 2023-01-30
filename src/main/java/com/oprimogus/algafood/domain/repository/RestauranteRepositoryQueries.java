package com.oprimogus.algafood.domain.repository;

import com.oprimogus.algafood.domain.model.Restaurante;

import java.math.BigDecimal;
import java.util.List;

public interface RestauranteRepositoryQueries {
    List<Restaurante> procurar(String nome, BigDecimal taxaFreteInicial, BigDecimal taxaFreteFinal);
}
