package etu.polytech.ws.soap.services;

import etu.polytech.ws.soap.domain.CountryEntity;
import org.springframework.data.repository.CrudRepository;

import java.util.Optional;

/**
 * Created by momo- on 16/09/2015.
 */

public interface CountryRepository extends CrudRepository<CountryEntity, String> {

    /**
     * Make a lookup to find the country associated to the capital as argument
     * @param capital Name of the capital of the country to find
     * @return
     */
    Optional<CountryEntity> findByCapital(final String capital);
}
