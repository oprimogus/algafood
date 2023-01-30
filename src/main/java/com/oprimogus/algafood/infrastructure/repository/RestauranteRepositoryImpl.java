package com.oprimogus.algafood.infrastructure.repository;

import com.oprimogus.algafood.domain.model.Restaurante;
import com.oprimogus.algafood.domain.repository.RestauranteRepositoryQueries;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.util.StringUtils;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;

@Repository
public class RestauranteRepositoryImpl implements RestauranteRepositoryQueries {

    @Autowired
    private EntityManager manager;
    @Override
    public List<Restaurante> procurar(String nome,
                                  BigDecimal taxaFreteInicial, BigDecimal taxaFreteFinal) {

        HashMap<String, Object> parametros = new HashMap<String, Object>();

        StringBuilder jpql = new StringBuilder();
        jpql.append("from Restaurante where 0 = 0 ");

        if (StringUtils.hasLength(nome)) {
            jpql.append("and nome like :nome ");
            parametros.put("nome", "%" + nome + "%");
        }
        if (taxaFreteInicial != null) {
            jpql.append("and taxaFrete >= :taxaFreteInicial ");
            parametros.put("taxaFreteInicial", taxaFreteInicial);
        }
        if (taxaFreteFinal != null) {
            jpql.append("and taxaFrete <= :taxaFreteFinal ");
            parametros.put("taxaFreteFinal", taxaFreteFinal);
        }

        TypedQuery<Restaurante> query = manager.createQuery(jpql.toString(), Restaurante.class);

        parametros.forEach((chave, valor) -> query.setParameter(chave, valor));
        return query.getResultList();
    }
}
