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
    public Restaurante find (@PathVariable Long restauranteId){
        return cadastroRestauranteService.buscar(restauranteId);
    }

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public Restaurante save(@RequestBody Restaurante restaurante) {
        return cadastroRestauranteService.salvar(restaurante);

    }

    @PutMapping("/{restauranteId}")
    public Restaurante updateAll(@PathVariable Long restauranteId,
                                          @RequestBody Restaurante restaurante) {
        Restaurante restauranteAtual = cadastroRestauranteService.buscar(restauranteId);
        BeanUtils.copyProperties(restaurante, restauranteAtual, "id", "formasPagamento",
                "created_at", "updated_at", "produtos", "endereco");
        return cadastroRestauranteService.salvar(restauranteAtual);


    }

    @PatchMapping("/{restauranteId}")
    public Restaurante update (@PathVariable Long restauranteId, @RequestBody Map<String, Object> campos){
        Restaurante restauranteAtual = cadastroRestauranteService.buscar(restauranteId);
        merge(campos, restauranteAtual);
        return updateAll(restauranteId, restauranteAtual);
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
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void remove(@PathVariable Long restauranteId) {
        cadastroRestauranteService.excluir(restauranteId);
    }



}
