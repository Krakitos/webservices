package etu.polytech.ws.rest.controllers;

import etu.polytech.ws.rest.data.Activite;
import etu.polytech.ws.rest.data.Sejour;
import etu.polytech.ws.rest.repositories.SejourRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Collection;
import java.util.Optional;
import java.util.stream.Collectors;
import java.util.stream.StreamSupport;

/**
 * Created by momo- on 06/10/2015.
 */
@RestController
@RequestMapping("/cerisaie/api/booking")
public class SejourController {

    @Autowired
    private SejourRepository repository;

    @RequestMapping(value = "", method = RequestMethod.GET)
    public Iterable<Sejour> getAll(){
        return repository.findAll();
    }


    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public Sejour getById(@PathVariable("id") int id){
        return repository.findOne(id);
    }

    @RequestMapping(value = "/{id}/activities", method = RequestMethod.GET)
    public Collection<Activite> getActivitiesForSejour(@PathVariable("id") int sejour){
        return repository.findOne(sejour).getActivites();
    }

    @RequestMapping(value = "", method = RequestMethod.PUT)
    public void addSejour(@RequestBody Sejour sejour){
        repository.save(sejour);
    }

    @RequestMapping(value = "/clients/{id}", method = RequestMethod.GET)
    public Collection<Sejour> getAllForClient(@PathVariable("id") int client){
        return StreamSupport.stream(repository.findAll().spliterator(), true)
                     .filter(s -> s.getClient().getId() == client)
                     .collect(Collectors.toList());
    }

    @RequestMapping(value = "/clients/{id}/latest", method = RequestMethod.GET)
    public Sejour getLastForClient(@PathVariable("id") int client){
        return getAllForClient(client).parallelStream()
                .sorted((s1, s2) -> s1.getFinSejour().compareTo(s2.getFinSejour()))
                .findFirst()
                .get();
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public ResponseEntity delete(@PathVariable("id") int id){
        if(repository.exists(id)){
            repository.delete(id);
            return new ResponseEntity(HttpStatus.OK);
        }else {
            return new ResponseEntity(HttpStatus.NOT_FOUND);
        }
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.POST)
    public void update(@PathVariable("id") int id, @RequestBody Sejour sejour){

        Optional.ofNullable(repository.findOne(id)).ifPresent(s -> {
            s.setDebutSejour(sejour.getDebutSejour());
            s.setFinSejour(sejour.getFinSejour());
            s.setNbPersonne(sejour.getNbPersonne());
            repository.save(s);
        });
    }
}
