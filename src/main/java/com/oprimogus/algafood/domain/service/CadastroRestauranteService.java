package com.oprimogus.algafood.domain.service;

import com.oprimogus.algafood.domain.exception.EntidadeEmUsoException;
import com.oprimogus.algafood.domain.exception.EntidadeNaoEncontradaException;
import com.oprimogus.algafood.domain.model.Cozinha;
import com.oprimogus.algafood.domain.model.Restaurante;
import com.oprimogus.algafood.domain.repository.CozinhaRepository;
import com.oprimogus.algafood.domain.repository.RestauranteRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;

@Service
public class CadastroRestauranteService {

    private static final String MSG_RESTAURANTE_EM_USO =
            "Restaurante de código %d não pode ser removido. Esse restaurante possui associações.";

    private static final String MSG_RESTAURANTE_NAO_ENCONTRADA =
            "Não existe cadastro de restaurante com o código %d.";

    @Autowired
    private RestauranteRepository restauranteRepository;
    @Autowired
    private CozinhaRepository cozinhaRepository;

    @Autowired
    private CadastroCozinhaService cadastroCozinhaService;

    public Restaurante buscar (Long RestauranteId) {
        return restauranteRepository.findById(RestauranteId)
                .orElseThrow(() -> new EntidadeNaoEncontradaException(
                        String.format(MSG_RESTAURANTE_NAO_ENCONTRADA, RestauranteId)
                ));
    }

    public Restaurante salvar (Restaurante restaurante){

        Long cozinhaId = restaurante.getCozinha().getId();
        Cozinha cozinha = cadastroCozinhaService.buscar(cozinhaId);
        restaurante.setCozinha(cozinha);
        return restauranteRepository.save(restaurante);

    }

    public void excluir (Long restauranteId){
        try {
            restauranteRepository.deleteById(restauranteId);
        } catch (EmptyResultDataAccessException e) {
            throw new EntidadeNaoEncontradaException(
                    String.format(MSG_RESTAURANTE_NAO_ENCONTRADA, restauranteId));

        } catch (DataIntegrityViolationException e){
            throw new EntidadeEmUsoException(
                    String.format(MSG_RESTAURANTE_EM_USO, restauranteId));
        }
    }
}
