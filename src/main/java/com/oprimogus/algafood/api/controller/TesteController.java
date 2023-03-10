package com.oprimogus.algafood.api.controller;

import com.oprimogus.algafood.domain.model.Cozinha;
import com.oprimogus.algafood.domain.model.Restaurante;
import com.oprimogus.algafood.domain.repository.CozinhaRepository;
import com.oprimogus.algafood.domain.repository.RestauranteRepository;
import com.oprimogus.algafood.infrastructure.repository.spec.RestauranteSpecs;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.math.BigDecimal;
import java.util.List;
import java.util.Optional;

import static com.oprimogus.algafood.infrastructure.repository.spec.RestauranteSpecs.comNomeSemelhante;

@RestController
@RequestMapping("/teste")
public class TesteController {

    @Autowired
    private CozinhaRepository cozinhaRepository;

    @Autowired
    private RestauranteRepository restauranteRepository;

    @GetMapping("/cozinhas/por-nome")
    public List<Cozinha> cozinhasPorNome(String nome){
        return cozinhaRepository.findTodasByNome(nome);
    }

    @GetMapping("/cozinhas/unica-por-nome")
    public Optional<Cozinha> cozinhaPorNome(String nome){
        return cozinhaRepository.findByNome(nome);
    }

    @GetMapping("/restaurantes/comFreteGratis")
    public List<Restaurante> restaurantesFreteGratis(String nome){
        return restauranteRepository.findAll(RestauranteSpecs.comFreteGratis()
                .and(comNomeSemelhante(nome)));
    }

    @GetMapping("/restaurantes/por-nome-e-frete")
    public List<Restaurante> restaurantePorNome(String nome, BigDecimal taxaInicial,
                                                BigDecimal taxaFinal){
        return restauranteRepository.procurar(nome, taxaInicial, taxaFinal);
    }
}
