package etu.polytech.ws.rest;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.context.web.SpringBootServletInitializer;
import org.springframework.context.annotation.ComponentScan;

/**
 * Created by mfuntowicz on 20/09/15.
 */
@SpringBootApplication
public class CerisaieApplication extends SpringBootServletInitializer {

    public static void main(String[] args) {
        SpringApplication.run(CerisaieApplication.class, args);
    }

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(CerisaieApplication.class);
    }
}
