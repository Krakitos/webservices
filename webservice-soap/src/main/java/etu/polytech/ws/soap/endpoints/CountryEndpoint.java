package etu.polytech.ws.soap.endpoints;

import java.text.SimpleDateFormat;
import java.util.Date;

import etu.polytech.ws.soap.services.CountryService;
import org.jdom2.Element;
import org.jdom2.Namespace;
import org.jdom2.filter.Filters;
import org.jdom2.xpath.XPathExpression;
import org.jdom2.xpath.XPathFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ws.server.endpoint.annotation.Endpoint;
import org.springframework.ws.server.endpoint.annotation.PayloadRoot;
import org.springframework.ws.server.endpoint.annotation.RequestPayload;

/**
 * Created by momo- on 16/09/2015.
 */
@Endpoint
public class CountryEndpoint {
    private static final String NAMESPACE_URI = "http://mycompany.com/hr/schemas";

    private XPathExpression<Element> startDateExpression;
    private XPathExpression<Element> endDateExpression;
    private XPathExpression<String> nameExpression;

    private CountryService countryService;

    @Autowired
    public CountryEndpoint(CountryService humanResourceService) throws Exception {
        this.countryService = humanResourceService;

        Namespace namespace = Namespace.getNamespace("hr", NAMESPACE_URI);

        XPathFactory xPathFactory = XPathFactory.instance();

       /* this.startDateExpression = xPathFactory.compile("//hr:StartDate", Filters.element(), null, namespace);
        this.endDateExpression = xPathFactory.compile("//hr:EndDate", Filters.element(), null, namespace);
        this.nameExpression = xPathFactory.compile("concat(//hr:FirstName,' ',//hr:LastName)",
                                                    Filters.fstring(), null,
                                                    namespace
        );*/
    }

    @PayloadRoot(namespace = NAMESPACE_URI, localPart = "CountryRequest")
    public void handleHolidayRequest(@RequestPayload Element holidayRequest)throws Exception {
/*
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date startDate = dateFormat.parse(startDateExpression.evaluateFirst(
                holidayRequest).getText());
        Date endDate = dateFormat.parse(endDateExpression.evaluateFirst(
                holidayRequest).getText());
        String name = nameExpression.evaluateFirst(holidayRequest);

        countryService.get(startDate, endDate, name);*/
    }
}
