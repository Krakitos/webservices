package etu.polytech.ws.soap.endpoints;

import etu.polytech.ws.soap.domain.CountryEntity;
import etu.polytech.ws.soap.lang.Country;
import etu.polytech.ws.soap.lang.GetCountryRequest;
import etu.polytech.ws.soap.lang.GetCountryResponse;
import etu.polytech.ws.soap.services.CountryRepository;
import org.jdom2.Element;
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

    private static final Logger LOGGER = LoggerFactory.getLogger(CountryEndpoint.class);

    public static final String NAMESPACE_URI = "http://etu/polytech/ws/soap/lang";

    private final XPathExpression<String> nameExpression;

    private CountryRepository countryRepository;

    @Autowired
    public CountryEndpoint(CountryRepository countryRepository) throws Exception {
        this.countryRepository = countryRepository;

        Namespace namespace = Namespace.getNamespace("pays", NAMESPACE_URI);

        XPathFactory xPathFactory = XPathFactory.instance();

        nameExpression = xPathFactory.compile("//pays:name", Filters.fstring(), null, namespace);
    }

    @PayloadRoot(namespace = NAMESPACE_URI, localPart = "getCountryRequest")
    @ResponsePayload
    public GetCountryResponse handlePaysRequest(@RequestPayload GetCountryRequest countryRequest)throws Exception {

        if(LOGGER.isDebugEnabled())
            LOGGER.debug("Received SOAP GetCountryRequest for country {}", countryRequest.getName());

        GetCountryResponse response = new GetCountryResponse();
        Optional<CountryEntity> entity = Optional.ofNullable(countryRepository.findOne(countryRequest.getName().toUpperCase()));
        entity.ifPresent(c -> {

            if(LOGGER.isDebugEnabled())
                LOGGER.debug("Found country in the database : {}", c);

            Country country = new Country();
            country.setName(c.name());
            country.setCapital(c.capital());
            country.setPopulation(c.population());
            response.setCountry(country);
        });

        return response;
    }
}
