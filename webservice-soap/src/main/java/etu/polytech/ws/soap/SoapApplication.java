package etu.polytech.ws.soap;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.context.web.SpringBootServletInitializer;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

/**
 * Created by momo- on 16/09/2015.
 */
@Configuration
@EnableAutoConfiguration
@ComponentScan
public class SoapApplication extends SpringBootServletInitializer {

    public static void main(String[] args) {
        SpringApplication.run(SoapApplication.class, args);
    }

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(applicationClass);
    }

    private static Class<SoapApplication> applicationClass = SoapApplication.class;
}
