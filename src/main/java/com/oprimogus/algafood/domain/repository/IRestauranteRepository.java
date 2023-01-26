package com.oprimogus.algafood.domain.repository;

import com.oprimogus.algafood.domain.model.Restaurante;
import org.springframework.data.jpa.repository.JpaRepository;

public interface IRestauranteRepository extends JpaRepository<Restaurante, Long> {


}
