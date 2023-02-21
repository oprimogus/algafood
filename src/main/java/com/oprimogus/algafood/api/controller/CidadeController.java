package com.oprimogus.algafood.api.controller;

import com.oprimogus.algafood.domain.exception.EntidadeNaoEncontradaException;
import com.oprimogus.algafood.domain.model.Cidade;
import com.oprimogus.algafood.domain.repository.CidadeRepository;
import com.oprimogus.algafood.domain.service.CadastroCidadeService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@RestController
@RequestMapping("/cidades")
public class CidadeController {

    @Autowired
    private CidadeRepository cidadeRepository;
    @Autowired
    private CadastroCidadeService cadastroCidadeService;

    @GetMapping
    public List<Cidade> list (){
        return cidadeRepository.findAll();
    }
    @GetMapping("/{cidadeId}")
    public Cidade buscar(@PathVariable Long cidadeId) {
        return cadastroCidadeService.buscar(cidadeId);
    }

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public Cidade adicionar(@RequestBody Cidade cidade) {
        return cadastroCidadeService.salvar(cidade);
    }
    @PutMapping("/{cidadeId}")
    public Cidade atualizar(@PathVariable Long cidadeId,
                                            @RequestBody Cidade cidade) {
        Cidade cidadeAtual = cadastroCidadeService.buscar(cidadeId);
        BeanUtils.copyProperties(cidade, cidadeAtual, "id");
        return cadastroCidadeService.salvar(cidadeAtual);
    }

    @DeleteMapping("/{cidadeAId}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void remover(@PathVariable Long cidadeId) {
        cadastroCidadeService.excluir(cidadeId);
    }
}
