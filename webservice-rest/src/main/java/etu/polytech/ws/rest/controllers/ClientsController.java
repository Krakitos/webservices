package etu.polytech.ws.rest.controllers;

import etu.polytech.ws.rest.data.Client;
import etu.polytech.ws.rest.repositories.ClientRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;


/**
 * Created by momo- on 06/10/2015.
 */
@RestController
@RequestMapping("/cerisaie/api/clients")
public class ClientsController {

    @Autowired
    private ClientRepository repository;

    @RequestMapping(value = "", method = RequestMethod.GET)
    public Iterable<Client> getAll(){
        return repository.findAll();
    }

    @RequestMapping(value = "", method = RequestMethod.PUT)
    public @ResponseBody Client add(@RequestBody Client client){
        return repository.save(client);
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public Client getById(@PathVariable("id") int id){
        return repository.findOne(id);
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.POST)
    public void update(@PathVariable("id") int id, @RequestBody Client client){
        Optional.ofNullable(repository.findOne(id)).ifPresent(c -> {
            c.setAddress(client.getAddress());
            c.setCity(client.getCity());
            c.setName(client.getName());
            c.setNumPiece(client.getNumPiece());
            c.setPiece(client.getPiece());

            repository.save(c);
        });
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public void delete(@PathVariable("id") int id){
        repository.delete(id);
    }
}
