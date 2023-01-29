package com.oprimogus.algafood.domain.service;

import com.oprimogus.algafood.domain.exception.EntidadeEmUsoException;
import com.oprimogus.algafood.domain.model.Cozinha;
import com.oprimogus.algafood.domain.repository.ICozinhaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;


@Service
public class CadastroCozinhaService {

    @Autowired
    private ICozinhaRepository cozinhaRepository;
    public Cozinha salvar (Cozinha cozinha){
        return cozinhaRepository.save(cozinha);
    }
    public void excluir (Long cozinhaId){
        try {
            cozinhaRepository.deleteById(cozinhaId);

        } catch (EmptyResultDataAccessException e) {
            throw new EntidadeEmUsoException(
                    String.format("Não existe um cadastro de cozinha com o código %d", cozinhaId));

        } catch (DataIntegrityViolationException e){
            throw new EntidadeEmUsoException(
                    String.format("Cozinha de código %d não pode ser removida porque está em uso",
                            cozinhaId));
        }

    }
}
