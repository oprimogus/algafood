package com.oprimogus.algafood.domain.repository;

import com.oprimogus.algafood.domain.model.Estado;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface IEstadoRepository extends JpaRepository<Estado, Long> {


}
