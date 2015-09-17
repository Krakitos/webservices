package etu.polytech.ws.soap;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.context.web.SpringBootServletInitializer;

/**
 * Created by momo- on 16/09/2015.
 */
@SpringBootApplication
public class SoapApplication extends SpringBootServletInitializer {

    public static void main(String[] args) {
        SpringApplication.run(SoapApplication.class, args);
    }

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(SoapApplication.class);
    }
}
