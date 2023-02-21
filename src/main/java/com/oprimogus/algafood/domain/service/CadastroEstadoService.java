package com.oprimogus.algafood.domain.service;

import com.oprimogus.algafood.domain.exception.EntidadeEmUsoException;
import com.oprimogus.algafood.domain.exception.EntidadeNaoEncontradaException;
import com.oprimogus.algafood.domain.model.Estado;
import com.oprimogus.algafood.domain.repository.EstadoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;

@Service
public class CadastroEstadoService {

    private static final String MSG_ESTADO_EM_USO =
            "Estado de código %d não pode ser removido. Essa cozinha possui associações.";

    private static final String MSG_ESTADO_NAO_ENCONTRADA =
            "Não existe cadastro de Estado com o código %d.";

    @Autowired
    private EstadoRepository estadoRepository;

    public Estado buscar (Long EstadoId) {
        return estadoRepository.findById(EstadoId)
                .orElseThrow(() -> new EntidadeNaoEncontradaException(
                        String.format(MSG_ESTADO_NAO_ENCONTRADA, EstadoId)
                ));
    }

    public Estado salvar (Estado estado){
        return estadoRepository.save(estado);
    }

    public void excluir (Long estadoId){
        try {
            estadoRepository.deleteById(estadoId);
        } catch (EmptyResultDataAccessException e){
            throw new EntidadeNaoEncontradaException(
                    String.format(MSG_ESTADO_NAO_ENCONTRADA, estadoId));
        } catch (DataIntegrityViolationException e) {
            throw new EntidadeEmUsoException(
                    String.format(MSG_ESTADO_EM_USO, estadoId));
        }
    }
}
