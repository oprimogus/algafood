package com.oprimogus.algafood.infrastructure.repository;

import com.oprimogus.algafood.domain.model.Restaurante;
import com.oprimogus.algafood.domain.repository.RestauranteRepositoryQueries;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.util.StringUtils;


import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.math.BigDecimal;

import java.util.ArrayList;
import java.util.List;

@Repository
public class RestauranteRepositoryImpl implements RestauranteRepositoryQueries {

    @Autowired
    private EntityManager manager;

    @Override
    public List<Restaurante> procurar(String nome,
                                  BigDecimal taxaFreteInicial, BigDecimal taxaFreteFinal) {

        CriteriaBuilder builder = manager.getCriteriaBuilder();
        CriteriaQuery<Restaurante> criteria = builder.createQuery(Restaurante.class);

        Root<Restaurante> root = criteria.from(Restaurante.class);

        ArrayList<Predicate> predicates = new ArrayList<Predicate>();

        if (StringUtils.hasText(nome)){
            predicates.add(builder.like(root.get("nome"), "%" + nome + "%"));
        }
        if (taxaFreteInicial != null) {
            predicates.add(builder.greaterThanOrEqualTo(root.get("taxaFrete"), taxaFreteInicial));
        }
        if (taxaFreteFinal != null) {
            predicates.add(builder.lessThanOrEqualTo(root.get("taxaFrete"), taxaFreteFinal));
        }

        criteria.where(predicates.toArray(new Predicate[0]));

        TypedQuery<Restaurante> query = manager.createQuery(criteria);
        return query.getResultList();
    }


    // Usando JPQL dinâmico
//    @Override
//    public List<Restaurante> procurar(String nome,
//                                  BigDecimal taxaFreteInicial, BigDecimal taxaFreteFinal) {
//
//        HashMap<String, Object> parametros = new HashMap<String, Object>();
//
//        StringBuilder jpql = new StringBuilder();
//        jpql.append("from Restaurante where 0 = 0 ");
//
//        if (StringUtils.hasLength(nome)) {
//            jpql.append("and nome like :nome ");
//            parametros.put("nome", "%" + nome + "%");
//        }
//        if (taxaFreteInicial != null) {
//            jpql.append("and taxaFrete >= :taxaFreteInicial ");
//            parametros.put("taxaFreteInicial", taxaFreteInicial);
//        }
//        if (taxaFreteFinal != null) {
//            jpql.append("and taxaFrete <= :taxaFreteFinal ");
//            parametros.put("taxaFreteFinal", taxaFreteFinal);
//        }
//
//        TypedQuery<Restaurante> query = manager.createQuery(jpql.toString(), Restaurante.class);
//
//        parametros.forEach((chave, valor) -> query.setParameter(chave, valor));
//        return query.getResultList();
//    }
}
