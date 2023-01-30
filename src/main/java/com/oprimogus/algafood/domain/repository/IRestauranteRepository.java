package com.oprimogus.algafood.domain.repository;

import com.oprimogus.algafood.domain.model.Restaurante;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.math.BigDecimal;
import java.util.List;
@Repository
public interface IRestauranteRepository extends JpaRepository<Restaurante, Long>, IRestauranteRepositoryQueries {

    List<Restaurante> findByTaxaFreteBetween(BigDecimal taxaInicial, BigDecimal taxaFinal);

    List<Restaurante> findByNomeContainingAndCozinhaId(String nome, long cozinhaId);

//    @Query("from Restaurante where 0 = 0 and nome like %:nome% and cozinha.id = :cozinhaId")
    List<Restaurante> consultarPorNome (String nome, Long cozinhaId);

}
