package com.oprimogus.algafood.api.controller;

import com.oprimogus.algafood.domain.exception.EntidadeEmUsoException;
import com.oprimogus.algafood.domain.exception.EntidadeNaoEncontradaException;
import com.oprimogus.algafood.domain.model.Estado;
import com.oprimogus.algafood.domain.repository.EstadoRepository;
import com.oprimogus.algafood.domain.service.CadastroEstadoService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/estados")
public class EstadoController {

    @Autowired
    private EstadoRepository estadoRepository;

    @Autowired
    private CadastroEstadoService cadastroEstadoService;

    @GetMapping
    public List<Estado> list() {
        return estadoRepository.findAll();
    }

    @GetMapping("/{estadoId}")
    public Estado find(@PathVariable Long estadoId) {
        return cadastroEstadoService.buscar(estadoId);
    }

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public Estado save(@RequestBody Estado estado) {
        return cadastroEstadoService.salvar(estado);
    }

    @PutMapping("/{estadoId}")
    public Estado updateAll(@PathVariable Long estadoId, @RequestBody Estado estado) {
        Estado estadoAtual = cadastroEstadoService.buscar(estadoId);
        BeanUtils.copyProperties(estado, estadoAtual, "id");
        return cadastroEstadoService.salvar(estadoAtual);
    }

    @DeleteMapping("/{estadoId}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void remove(@PathVariable Long estadoId) {
        cadastroEstadoService.excluir(estadoId);
    }
    
}