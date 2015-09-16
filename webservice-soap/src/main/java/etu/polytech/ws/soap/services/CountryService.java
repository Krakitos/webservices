package etu.polytech.ws.soap.services;

import java.util.Collection;

/**
 * Created by momo- on 16/09/2015.
 */
public interface CountryService {

    /**
     * Return all countries
     */
    Collection<Object> getAllCountry();

    /**
     * Id of the country
     * @param id Id of the country
     */
    void getCountry(long id);

    /**
     * Get a country by name
     * @param name Name of the country
     */
    void getCountry(String name);
}
