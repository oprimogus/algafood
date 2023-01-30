package com.oprimogus.algafood.api.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.oprimogus.algafood.domain.exception.EntidadeEmUsoException;
import com.oprimogus.algafood.domain.exception.EntidadeNaoEncontradaException;
import com.oprimogus.algafood.domain.model.Restaurante;
import com.oprimogus.algafood.domain.repository.RestauranteRepository;
import com.oprimogus.algafood.domain.service.CadastroRestauranteService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.ReflectionUtils;
import org.springframework.web.bind.annotation.*;

import java.lang.reflect.Field;
import java.util.List;
import java.util.Map;
import java.util.Optional;


@RestController
@RequestMapping("/restaurantes")
public class RestauranteController {

    @Autowired
    private RestauranteRepository restauranteRepository;
    @Autowired
    private CadastroRestauranteService cadastroRestauranteService;

    @GetMapping
    public List<Restaurante> list() {
        return restauranteRepository.findAll();
    }

    @GetMapping("/{restauranteId}")
    public ResponseEntity<Restaurante> find (@PathVariable Long restauranteId){
        Optional<Restaurante> restaurante = restauranteRepository.findById(restauranteId);
        if (restaurante.isPresent()) {
            return ResponseEntity.ok(restaurante.get());
        }
        return ResponseEntity.noContent().build();
    }

    @PostMapping
    public ResponseEntity<?> save(@RequestBody Restaurante restaurante) {
        try {
            restaurante = cadastroRestauranteService.salvar(restaurante);
            return ResponseEntity.status(HttpStatus.CREATED)
                    .body(restaurante);
        } catch (EntidadeNaoEncontradaException e){
            return ResponseEntity.badRequest().body(e.getMessage());
        }

    }

    @PutMapping("/{restauranteId}")
    public ResponseEntity<?> updateAll(@PathVariable Long restauranteId,
                                          @RequestBody Restaurante restaurante) {
        Optional<Restaurante> restauranteAtual = restauranteRepository.findById(restauranteId);
        if (restauranteAtual.isPresent()) {
            //cozinhaAtual.setNome(cozinha.getNome());
            BeanUtils.copyProperties(restaurante, restauranteAtual.get(), "id");
            Restaurante restauranteSalvo = cadastroRestauranteService.salvar(restauranteAtual.get());
            return ResponseEntity.ok(restauranteAtual.get());
        }
        return ResponseEntity.notFound().build();

    }

    @PatchMapping("/{restauranteId}")
    public ResponseEntity<?> update (@PathVariable Long restauranteId, @RequestBody Map<String, Object> campos){
        Optional<Restaurante> restauranteAtual = restauranteRepository.findById(restauranteId);
        if (restauranteAtual.isEmpty()){
            return ResponseEntity.notFound().build();
        }
        merge(campos, restauranteAtual.get());
        return ResponseEntity.ok().build();
    }

    private void merge(Map<String, Object> camposOrigem, Restaurante restauranteDestino) {
        ObjectMapper objectMapper = new ObjectMapper();
        Restaurante restauranteOrigem = objectMapper.convertValue(camposOrigem, Restaurante.class);
        camposOrigem.forEach((nomePropriedade, valorPropriedade) -> {
            Field field = ReflectionUtils.findField(Restaurante.class, nomePropriedade);
            field.setAccessible(true);
            Object novoValor = ReflectionUtils.getField(field, restauranteOrigem);
            ReflectionUtils.setField(field, restauranteDestino, valorPropriedade);
        });
    }

    @DeleteMapping("/{restauranteId}")
    public ResponseEntity<Restaurante> remove(@PathVariable Long restauranteId) {
        try {
            cadastroRestauranteService.excluir(restauranteId);
            return ResponseEntity.noContent().build();

        } catch (EntidadeNaoEncontradaException e){
            return ResponseEntity.notFound().build();

        } catch (EntidadeEmUsoException e){
            return ResponseEntity.status(HttpStatus.CONFLICT).build();
        }
    }



}
