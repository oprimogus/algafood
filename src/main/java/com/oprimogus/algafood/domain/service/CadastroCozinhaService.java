package com.oprimogus.algafood.domain.service;

import com.oprimogus.algafood.domain.model.Cozinha;
import com.oprimogus.algafood.infrastructure.repository.CozinhaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class CadastroCozinhaService {

    @Autowired
    private CozinhaRepository cozinhaRepository;
    public Cozinha salvar (Cozinha cozinha){
        return cozinhaRepository.save(cozinha);

    }
}
