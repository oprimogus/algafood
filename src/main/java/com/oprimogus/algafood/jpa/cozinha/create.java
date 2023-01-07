package com.oprimogus.algafood.jpa.cozinha;

import com.oprimogus.algafood.AlgafoodApplication;
import com.oprimogus.algafood.domain.model.Cozinha;
import com.oprimogus.algafood.infrastructure.repository.CozinhaRepository;
import org.springframework.boot.WebApplicationType;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.context.ApplicationContext;

public class create {
    public static void main(String[] args) {
        ApplicationContext applicationContext = new SpringApplicationBuilder(AlgafoodApplication.class)
                .web(WebApplicationType.NONE)
                .run(args);
        CozinhaRepository cozinhaRepository = applicationContext.getBean(CozinhaRepository.class);

        Cozinha cozinha1 = new Cozinha();
        cozinha1.setNome("A1");

        Cozinha cozinha2 = new Cozinha();
        cozinha2.setNome("A2");

        Cozinha cozinha3 = new Cozinha();
        cozinha3.setNome("A3");

        cozinhaRepository.save(cozinha1);
        cozinhaRepository.save(cozinha2);
        cozinhaRepository.save(cozinha3);
    }
}
