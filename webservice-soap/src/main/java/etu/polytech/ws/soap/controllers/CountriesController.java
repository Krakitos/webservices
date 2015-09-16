package etu.polytech.ws.soap.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Morgan on 16/09/2015.
 */
@Controller
public class CountriesController {

    @RequestMapping("/home")
    public void home(){
        System.out.println("Salut");
    }
}
