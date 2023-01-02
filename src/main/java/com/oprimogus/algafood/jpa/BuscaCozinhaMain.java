package com.oprimogus.algafood.jpa;

import com.oprimogus.algafood.AlgafoodApplication;
import com.oprimogus.algafood.domain.model.Cozinha;
import com.oprimogus.algafood.infrastructure.repository.CozinhaRepository;
import org.springframework.boot.WebApplicationType;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.context.ApplicationContext;

public class BuscaCozinhaMain {
    public static void main(String[] args) {
        ApplicationContext applicationContext = new SpringApplicationBuilder(AlgafoodApplication.class)
                .web(WebApplicationType.NONE)
                .run(args);
        CozinhaRepository cozinhaRepository = applicationContext.getBean(CozinhaRepository.class);
        Cozinha cozinha = cozinhaRepository.find(1L);
        System.out.println(cozinha.getNome());
    }
}
