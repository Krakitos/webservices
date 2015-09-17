package etu.polytech.ws.soap.services;

import etu.polytech.ws.soap.domain.CountryEntity;
import org.springframework.data.repository.CrudRepository;

/**
 * Created by momo- on 16/09/2015.
 */

public interface CountryRepository extends CrudRepository<CountryEntity, String> {

}
