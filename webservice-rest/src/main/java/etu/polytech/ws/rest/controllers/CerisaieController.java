package etu.polytech.ws.rest.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by mfuntowicz on 20/09/15.
 */
@Controller
@RequestMapping("/cerisaie")
public class CerisaieController {

    public static final String VIEW_HOME_NAME = "home";
    private static final String VIEW_BOOKING_NAME = "booking";
    private static final String VIEW_CLIENTS_NAME = "clients";
    private static final String VIEW_FACTURES_NAME = "factures";
    private static final String VIEW_FACTURESSEJOUR_NAME = "factureSejour";
    private static final String VIEW_FACTURESACTIVITE_NAME = "factureActivite";


    @RequestMapping("/")
    public String getHomePage(){
        return VIEW_HOME_NAME;
    }

    @RequestMapping("")
    public String getHomePageShort(){ return getHomePage(); }

    @RequestMapping(value="/booking", method = RequestMethod.GET)
    public ModelAndView getBookingPage(){
        return new ModelAndView(VIEW_BOOKING_NAME);
    }

    @RequestMapping(value = "/clients", method = RequestMethod.GET)
    public ModelAndView getClientsPage(){
        return new ModelAndView(VIEW_CLIENTS_NAME);
    }

    @RequestMapping(value = "/factures", method = RequestMethod.GET)
    public ModelAndView getFacturesPage(){
        return new ModelAndView(VIEW_FACTURES_NAME);
    }

    @RequestMapping(value = "/addClient", method = RequestMethod.GET)
    public ModelAndView addClient(){
        return new ModelAndView("api/clients");
    }


}
