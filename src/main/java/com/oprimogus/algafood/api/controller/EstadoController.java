package com.oprimogus.algafood.api.controller;

import com.oprimogus.algafood.domain.exception.EntidadeEmUsoException;
import com.oprimogus.algafood.domain.exception.EntidadeNaoEncontradaException;
import com.oprimogus.algafood.domain.model.Estado;
import com.oprimogus.algafood.domain.service.CadastroEstadoService;
import com.oprimogus.algafood.infrastructure.repository.EstadoRepository;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/estados")
public class EstadoController {

    @Autowired
    private EstadoRepository estadoRepository;

    @Autowired
    private CadastroEstadoService cadastroEstadoService;

    @GetMapping
    public List<Estado> list() {
        return estadoRepository.list();
    }

    @GetMapping("/{estadoId}")
    public ResponseEntity<Estado> find(@PathVariable Long estadoId) {
        Estado estado = estadoRepository.find(estadoId);
        if (estado != null) {
            return ResponseEntity.ok(estado);
        }
        return ResponseEntity.noContent().build();
    }

    @PostMapping
    public ResponseEntity<?> save(@RequestBody Estado estado) {
        try {
            estado = cadastroEstadoService.salvar(estado);
            return ResponseEntity.status(HttpStatus.CREATED)
                    .body(estado);
        } catch (EntidadeNaoEncontradaException e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }

    @PutMapping("/{estadoId}")
    public ResponseEntity<?> update(@PathVariable Long estadoId, @RequestBody Estado estado) {
        try {
            Estado estadoAtual = estadoRepository.find(estadoId);
            if (estadoAtual != null) {
                BeanUtils.copyProperties(estado, estadoAtual, "id");
                estadoAtual = cadastroEstadoService.salvar(estadoAtual);
                return ResponseEntity.ok(estadoAtual);
            }
            return ResponseEntity.noContent().build();
        } catch (EntidadeNaoEncontradaException e) {
            return ResponseEntity.badRequest()
                    .body(e.getMessage());
        }
    }
    @DeleteMapping("/{estadoId}")
    public ResponseEntity<?> remove(@PathVariable Long estadoId) {
        try {
            cadastroEstadoService.excluir(estadoId);
            return ResponseEntity.noContent().build();

        } catch (EntidadeNaoEncontradaException e){
            return ResponseEntity.notFound().build();

        } catch (EntidadeEmUsoException e){
            return ResponseEntity.status(HttpStatus.CONFLICT)
                    .body(e.getMessage());
        }
    }
    
}