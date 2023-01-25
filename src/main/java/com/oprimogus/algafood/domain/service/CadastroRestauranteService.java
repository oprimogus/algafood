package com.oprimogus.algafood.domain.service;

import com.oprimogus.algafood.domain.exception.EntidadeEmUsoException;
import com.oprimogus.algafood.domain.exception.EntidadeNaoEncontradaException;
import com.oprimogus.algafood.domain.model.Cozinha;
import com.oprimogus.algafood.domain.model.Restaurante;
import com.oprimogus.algafood.infrastructure.repository.CozinhaRepository;
import com.oprimogus.algafood.infrastructure.repository.RestauranteRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;

@Service
public class CadastroRestauranteService {

    @Autowired
    private RestauranteRepository restauranteRepository;
    @Autowired
    private CozinhaRepository cozinhaRepository;

    public Restaurante salvar (Restaurante restaurante){
        Long cozinhaId = restaurante.getCozinha().getId();
        Cozinha cozinha = cozinhaRepository.find(cozinhaId);
        if (cozinha == null) {
            throw new EntidadeNaoEncontradaException(
                    String.format("Não existe cadastro de cozinha com código %d", cozinhaId));
        }
        restaurante.setCozinha(cozinha);
        return restauranteRepository.save(restaurante);
    }

    public void excluir (Long restauranteId){
        try {
            restauranteRepository.remove(restauranteId);
        } catch (EmptyResultDataAccessException e) {
            throw new EntidadeEmUsoException(
                    String.format("Não existe um cadastro de restaurante com o código %d", restauranteId));

        } catch (DataIntegrityViolationException e){
            throw new EntidadeEmUsoException(
                    String.format("Restaurante de código %d não pode ser removido porque está em uso",
                            restauranteId));
        }
    }
}
