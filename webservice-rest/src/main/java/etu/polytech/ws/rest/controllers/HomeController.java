package etu.polytech.ws.rest.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by mfuntowicz on 20/09/15.
 */
@Controller
@RequestMapping("/cerisaie")
public class HomeController {

    public static final String VIEW_HOME_NAME = "home";


    @RequestMapping("")
    public String home(){
        return VIEW_HOME_NAME;
    }
}
