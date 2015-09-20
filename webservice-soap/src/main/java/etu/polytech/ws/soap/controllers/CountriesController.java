package etu.polytech.ws.soap.controllers;

import etu.polytech.ws.soap.domain.CountryEntity;
import etu.polytech.ws.soap.services.CountryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


/**
 * Created by Morgan on 16/09/2015.
 */
@Controller
@RequestMapping("/countries")
public class CountriesController {

    @Autowired
    CountryRepository countryRepository;

    @RequestMapping("/")
    public ModelAndView home(){
        Iterable<CountryEntity> countries = countryRepository.findAll();
        return new ModelAndView("map", "countries", countries);
    }
}
