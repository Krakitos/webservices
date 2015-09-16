package etu.polytech.ws.soap.services;

import etu.polytech.ws.soap.lang.Country;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import java.util.*;

/**
 * Created by momo- on 16/09/2015.
 */
@Component
public class CountryRepository {

    private Set<Country> countries = new HashSet<>();

    @PostConstruct
    public void initRepository(){

    }

    /**
     * Return all countries
     */
    public Collection<Country> getAllCountry(){
        return countries;
    }

    /**
     * Get a country by name
     * @param name Name of the country
     */
    public Optional<Country> findCountry(String name){
        return Optional.empty();
    }
}
