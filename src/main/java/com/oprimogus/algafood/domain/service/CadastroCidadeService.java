package com.oprimogus.algafood.domain.service;

import com.oprimogus.algafood.domain.exception.EntidadeEmUsoException;
import com.oprimogus.algafood.domain.exception.EntidadeNaoEncontradaException;

import com.oprimogus.algafood.domain.model.Cidade;
import com.oprimogus.algafood.domain.model.Estado;

import com.oprimogus.algafood.domain.repository.CidadeRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class CadastroCidadeService {

    private static final String MSG_CIDADE_EM_USO =
            "Cidade de código %d não pode ser removido. Essa cidade possui associações.";

    private static final String MSG_CIDADE_NAO_ENCONTRADA =
            "Não existe cadastro de cidade com o código %d.";
    @Autowired
    private CidadeRepository cidadeRepository;

    @Autowired
    private CadastroEstadoService cadastroEstadoService;

    public Cidade buscar (Long CidadeId) {
        return cidadeRepository.findById(CidadeId)
                .orElseThrow(() -> new EntidadeNaoEncontradaException(
                        String.format(MSG_CIDADE_NAO_ENCONTRADA, CidadeId)
                ));
    }

    public Cidade salvar(Cidade cidade) {
        Long estadoId = cidade.getEstado().getId();
        Estado estado = cadastroEstadoService.buscar(estadoId);

        cidade.setEstado(estado);

        return cidadeRepository.save(cidade);
    }

    public void excluir(Long cidadeId) {
        try {
            cidadeRepository.deleteById(cidadeId);

        } catch (EmptyResultDataAccessException e) {
            throw new EntidadeNaoEncontradaException(
                    String.format(MSG_CIDADE_NAO_ENCONTRADA, cidadeId));

        } catch (DataIntegrityViolationException e) {
            throw new EntidadeEmUsoException(
                    String.format(MSG_CIDADE_EM_USO, cidadeId));
        }
    }
}