package etu.polytech.ws.soap.endpoints;

import etu.polytech.ws.soap.lang.Country;
import etu.polytech.ws.soap.lang.GetCountryRequest;
import etu.polytech.ws.soap.lang.GetCountryResponse;
import etu.polytech.ws.soap.services.CountryRepository;
import org.jdom2.Element;
import org.jdom2.Namespace;
import org.jdom2.filter.Filters;
import org.jdom2.xpath.XPathExpression;
import org.jdom2.xpath.XPathFactory;
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

    private final XPathExpression<String> nameExpression;

    private CountryRepository countryRepository;

    @Autowired
    public CountryEndpoint(CountryRepository countryRepository) throws Exception {
        this.countryRepository = countryRepository;

        Namespace namespace = Namespace.getNamespace("pays", NAMESPACE_URI);

        XPathFactory xPathFactory = XPathFactory.instance();

        nameExpression = xPathFactory.compile("//pays:name", Filters.fstring(), null, namespace);
    }

    @PayloadRoot(namespace = NAMESPACE_URI, localPart = "CountryRequest")
    @ResponsePayload
    public GetCountryResponse handlePaysRequest(@RequestPayload GetCountryRequest countryRequest)throws Exception {
        GetCountryResponse response = new GetCountryResponse();
        Optional<Country> country = countryRepository.findCountry(countryRequest.getName());
        country.ifPresent(response::setCountry);

        return response;
    }
}
