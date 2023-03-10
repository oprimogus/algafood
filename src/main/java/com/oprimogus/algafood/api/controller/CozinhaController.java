package com.oprimogus.algafood.api.controller;

import com.oprimogus.algafood.domain.exception.EntidadeEmUsoException;
import com.oprimogus.algafood.domain.exception.EntidadeNaoEncontradaException;
import com.oprimogus.algafood.domain.model.Cozinha;
import com.oprimogus.algafood.domain.repository.CozinhaRepository;
import com.oprimogus.algafood.domain.service.CadastroCozinhaService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/cozinhas")
public class CozinhaController {

    @Autowired
    private CozinhaRepository cozinhaRepository;

    @Autowired
    private CadastroCozinhaService cadastroCozinhaService;

    @GetMapping
    public List<Cozinha> list() {
        return cozinhaRepository.findAll();
    }

    @GetMapping("/{cozinhaId}")
    public Cozinha find(@PathVariable Long cozinhaId) {
        return cadastroCozinhaService.buscar(cozinhaId);
    }

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public Cozinha save(@RequestBody Cozinha cozinha) {
        return cadastroCozinhaService.salvar(cozinha);
    }

    @PutMapping("/{cozinhaId}")
    public Cozinha update(@PathVariable Long cozinhaId,
                                          @RequestBody Cozinha cozinha) {
        Cozinha cozinhaAtual = cadastroCozinhaService.buscar(cozinhaId);
        BeanUtils.copyProperties(cozinha, cozinhaAtual, "id");
        return cadastroCozinhaService.salvar(cozinhaAtual);

    }

    @DeleteMapping("/{cozinhaId}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void remove(@PathVariable Long cozinhaId) {
        cadastroCozinhaService.excluir(cozinhaId);

    }
}