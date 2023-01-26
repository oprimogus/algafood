package com.oprimogus.algafood.domain.repository;

import com.oprimogus.algafood.domain.model.Cozinha;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface ICozinhaRepository extends JpaRepository<Cozinha, Long> {

    List<Cozinha> findTodasByNome (String nome);

    Optional<Cozinha> findByNome(String nome);


}
