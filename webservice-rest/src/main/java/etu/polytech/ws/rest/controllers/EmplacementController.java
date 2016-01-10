package etu.polytech.ws.rest.controllers;

import etu.polytech.ws.rest.data.Emplacement;
import etu.polytech.ws.rest.repositories.EmplacementRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

/**
 * Created by mfuntowicz on 23/12/15.
 */
@RestController
@RequestMapping("/cerisaie/api/locations")
public class EmplacementController {

    @Autowired
    private EmplacementRepository repository;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public Iterable<Emplacement> getAll(){
        return repository.findAll();
    }

    @RequestMapping("/{id}")
    public Emplacement getById(@PathVariable("id") int id){
        return repository.findOne(id);
    }
}
