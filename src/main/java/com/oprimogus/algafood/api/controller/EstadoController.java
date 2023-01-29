package com.oprimogus.algafood.api.controller;

import com.oprimogus.algafood.domain.exception.EntidadeEmUsoException;
import com.oprimogus.algafood.domain.exception.EntidadeNaoEncontradaException;
import com.oprimogus.algafood.domain.model.Cozinha;
import com.oprimogus.algafood.domain.model.Estado;
import com.oprimogus.algafood.domain.repository.IEstadoRepository;
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
    private IEstadoRepository estadoRepository;

    @Autowired
    private CadastroEstadoService cadastroEstadoService;

    @GetMapping
    public List<Estado> list() {
        return estadoRepository.findAll();
    }

    @GetMapping("/{estadoId}")
    public ResponseEntity<Estado> find(@PathVariable Long estadoId) {
        Optional<Estado> estado = estadoRepository.findById(estadoId);
        if (estado.isPresent()) {
            return ResponseEntity.ok(estado.get());
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
    public ResponseEntity<?> updateAll(@PathVariable Long estadoId, @RequestBody Estado estado) {

        Optional<Estado> estadoAtual = estadoRepository.findById(estadoId);
        if (estadoAtual.isPresent()) {
            //cozinhaAtual.setNome(cozinha.getNome());
            BeanUtils.copyProperties(estado, estadoAtual.get(), "id");
            Estado estadoSalvo = cadastroEstadoService.salvar(estadoAtual.get());
            return ResponseEntity.ok(estadoAtual.get());
        }
        return ResponseEntity.notFound().build();
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