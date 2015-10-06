package etu.polytech.ws.rest.controllers;

import etu.polytech.ws.rest.data.Activite;
import etu.polytech.ws.rest.data.Sejour;
import etu.polytech.ws.rest.repositories.SejourRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Collection;
import java.util.stream.Collectors;
import java.util.stream.StreamSupport;

/**
 * Created by momo- on 06/10/2015.
 */
@RestController
@RequestMapping("/cerisaie/sejours")
public class SejourController {

    @Autowired
    private SejourRepository repository;

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public Sejour getById(@PathVariable("id") int id){
        return repository.findOne(id);
    }

    @RequestMapping(value = "/{id}/activities", method = RequestMethod.GET)
    public Collection<Activite> getActivitiesForSejour(@PathVariable("id") int sejour){
        return repository.findOne(sejour).getActivites();
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
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
}
