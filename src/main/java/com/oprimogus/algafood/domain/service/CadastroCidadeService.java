package com.oprimogus.algafood.domain.service;

import com.oprimogus.algafood.domain.exception.EntidadeEmUsoException;
import com.oprimogus.algafood.domain.exception.EntidadeNaoEncontradaException;
import com.oprimogus.algafood.domain.model.Cidade;
import com.oprimogus.algafood.domain.model.Estado;
import com.oprimogus.algafood.domain.repository.ICidadeRepository;
import com.oprimogus.algafood.domain.repository.IEstadoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class CadastroCidadeService {

    @Autowired
    private ICidadeRepository cidadeRepository;

    @Autowired
    private IEstadoRepository estadoRepository;

    public Cidade salvar(Cidade cidade) {
        Long estadoId = cidade.getEstado().getId();
        Optional<Estado> estado = estadoRepository.findById(estadoId);

        if (estado.isEmpty()) {
            throw new EntidadeNaoEncontradaException(
                    String.format("Não existe cadastro de estado com código %d", estadoId));
        }

        cidade.setEstado(estado.get());

        return cidadeRepository.save(cidade);
    }

    public void excluir(Long cidadeId) {
        try {
            cidadeRepository.deleteById(cidadeId);

        } catch (EmptyResultDataAccessException e) {
            throw new EntidadeNaoEncontradaException(
                    String.format("Não existe um cadastro de cidade com código %d", cidadeId));

        } catch (DataIntegrityViolationException e) {
            throw new EntidadeEmUsoException(
                    String.format("Cidade de código %d não pode ser removida, pois está em uso", cidadeId));
        }
    }
}