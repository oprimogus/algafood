package com.oprimogus.algafood.jpa.restaurante;

import com.oprimogus.algafood.AlgafoodApplication;
import com.oprimogus.algafood.domain.model.Restaurante;
import com.oprimogus.algafood.infrastructure.repository.RestauranteRepository;
import org.springframework.boot.WebApplicationType;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.context.ApplicationContext;

import java.util.List;

public class read {
    public static void main(String[] args) {
        ApplicationContext applicationContext = new SpringApplicationBuilder(AlgafoodApplication.class)
                .web(WebApplicationType.NONE)
                .run(args);
        RestauranteRepository restauranteRepository = applicationContext.getBean(RestauranteRepository.class);
        List<Restaurante> restaurantes = restauranteRepository.list();
        for (Restaurante restaurante : restaurantes){
            System.out.println(restaurante.getNome());
        }
    }
}
