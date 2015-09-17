package etu.polytech.ws.soap.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Morgan on 16/09/2015.
 */
@Controller
@RequestMapping("/countries")
public class CountriesController {

    @RequestMapping("/")
    public String home(){
        return "welcome";
    }
}
