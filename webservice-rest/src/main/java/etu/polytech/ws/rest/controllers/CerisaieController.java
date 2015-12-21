package etu.polytech.ws.rest.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by mfuntowicz on 20/09/15.
 */
@Controller
@RequestMapping("/cerisaie")
public class CerisaieController {

    public static final String VIEW_HOME_NAME = "home";
    private static final String VIEW_BOOKING_NAME = "booking";
    private static final String VIEW_CLIENTS_NAME = "clients";
    private static final String VIEW_ACTIVITIES_NAME = "activities";


    @RequestMapping("/")
    public String getHomePage(){
        return VIEW_HOME_NAME;
    }

    @RequestMapping(value="/booking", method = RequestMethod.GET)
    public ModelAndView getBookingPage(){
        return new ModelAndView(VIEW_BOOKING_NAME);
    }

    @RequestMapping(value = "/clients", method = RequestMethod.GET)
    public ModelAndView getClientsPage(){
        return new ModelAndView(VIEW_CLIENTS_NAME);
    }

    @RequestMapping(value = "/activities", method = RequestMethod.GET)
    public ModelAndView getActivitiesPage(){
        return new ModelAndView(VIEW_ACTIVITIES_NAME);
    }
}
