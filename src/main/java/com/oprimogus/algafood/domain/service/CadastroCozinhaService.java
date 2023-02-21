package com.oprimogus.algafood.domain.service;

import com.oprimogus.algafood.domain.exception.EntidadeEmUsoException;
import com.oprimogus.algafood.domain.exception.EntidadeNaoEncontradaException;
import com.oprimogus.algafood.domain.model.Cidade;
import com.oprimogus.algafood.domain.model.Cozinha;
import com.oprimogus.algafood.domain.repository.CozinhaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;


@Service
public class CadastroCozinhaService {

    private static final String MSG_CIDADE_EM_USO =
            "Cozinha de código %d não pode ser removido. Essa cozinha possui associações.";

    private static final String MSG_CIDADE_NAO_ENCONTRADA =
            "Não existe cadastro de cozinha com o código %d.";

    @Autowired
    private CozinhaRepository cozinhaRepository;

    public Cozinha buscar (Long CozinhaId) {
        return cozinhaRepository.findById(CozinhaId)
                .orElseThrow(() -> new EntidadeNaoEncontradaException(
                        String.format(MSG_CIDADE_NAO_ENCONTRADA, CozinhaId)
                ));
    }

    public Cozinha salvar (Cozinha cozinha){
        return cozinhaRepository.save(cozinha);
    }
    public void excluir (Long cozinhaId){
        try {
            cozinhaRepository.deleteById(cozinhaId);

        } catch (EmptyResultDataAccessException e) {
            throw new EntidadeNaoEncontradaException(
                    String.format(MSG_CIDADE_NAO_ENCONTRADA, cozinhaId));

        } catch (DataIntegrityViolationException e){
            throw new EntidadeEmUsoException(
                    String.format(MSG_CIDADE_EM_USO,
                            cozinhaId));
        }

    }
}
