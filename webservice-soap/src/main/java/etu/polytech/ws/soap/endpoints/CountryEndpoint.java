package etu.polytech.ws.soap.endpoints;

import etu.polytech.ws.soap.domain.CountryEntity;
import etu.polytech.ws.soap.lang.Country;
import etu.polytech.ws.soap.lang.CountryByCapitalRequest;
import etu.polytech.ws.soap.lang.CountryRequest;
import etu.polytech.ws.soap.lang.CountryResponse;
import etu.polytech.ws.soap.services.CountryRepository;
import org.jdom2.Namespace;
import org.jdom2.filter.Filters;
import org.jdom2.xpath.XPathExpression;
import org.jdom2.xpath.XPathFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ws.server.endpoint.annotation.Endpoint;
import org.springframework.ws.server.endpoint.annotation.PayloadRoot;
import org.springframework.ws.server.endpoint.annotation.RequestPayload;
import org.springframework.ws.server.endpoint.annotation.ResponsePayload;

import java.util.Optional;

/**
 * Created by momo- on 16/09/2015.
 */
@Endpoint
public class CountryEndpoint {

    public static final String NAMESPACE_URI = "http://etu/polytech/ws/soap/lang";
    private static final Logger LOGGER = LoggerFactory.getLogger(CountryEndpoint.class);
    private final XPathExpression<String> nameExpression;

    private CountryRepository countryRepository;

    @Autowired
    public CountryEndpoint(CountryRepository countryRepository) throws Exception {
        this.countryRepository = countryRepository;

        Namespace namespace = Namespace.getNamespace("pays", NAMESPACE_URI);

        XPathFactory xPathFactory = XPathFactory.instance();

        nameExpression = xPathFactory.compile("//pays:getName", Filters.fstring(), null, namespace);
    }

    @PayloadRoot(namespace = NAMESPACE_URI, localPart = "countryRequest")
    @ResponsePayload
    public CountryResponse handleCountryRequest(@RequestPayload CountryRequest countryRequest)throws Exception {

        if(LOGGER.isDebugEnabled())
            LOGGER.debug("Received SOAP GetCountryRequest for country {}", countryRequest.getName());

        CountryResponse response = new CountryResponse();
        Optional<CountryEntity> entity = Optional.ofNullable(countryRepository.findOne(countryRequest.getName().toUpperCase()));
        entity.ifPresent(c -> {

            if(LOGGER.isDebugEnabled())
                LOGGER.debug("Found country in the database : {}", c);

            Country country = new Country();
            country.setName(c.getName());
            country.setCapital(c.getCapital());
            country.setPopulation(c.getPopulation());
            response.setCountry(country);
        });

        return response;
    }

    @PayloadRoot(namespace = NAMESPACE_URI, localPart = "countryByCapitalRequest")
    @ResponsePayload
    public CountryResponse handleCapitalRequest(@RequestPayload CountryByCapitalRequest countryRequest)throws Exception {

        if(LOGGER.isDebugEnabled())
            LOGGER.debug("Received SOAP Request CountryByCapital for capital {}", countryRequest.getCapital());

        CountryResponse response = new CountryResponse();
        Optional<CountryEntity> entity = countryRepository.findByCapital(countryRequest.getCapital().toUpperCase());
        entity.ifPresent(c -> {

            if(LOGGER.isDebugEnabled())
                LOGGER.debug("Found country in the database : {}", c);

            Country country = new Country();
            country.setName(c.getName());
            country.setCapital(c.getCapital());
            country.setPopulation(c.getPopulation());
            response.setCountry(country);
        });

        return response;
    }
}
