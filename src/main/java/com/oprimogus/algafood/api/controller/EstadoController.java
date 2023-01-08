package com.oprimogus.algafood.api.controller;

import com.oprimogus.algafood.domain.model.Estado;
import com.oprimogus.algafood.infrastructure.repository.EstadoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/estados")
public class EstadoController {

    @Autowired
    private EstadoRepository estadoRepository;

    @GetMapping
    public List<Estado> list(){
        return estadoRepository.list();
    }
}
