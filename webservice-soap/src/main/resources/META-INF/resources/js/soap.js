const SOAP_ENDPOINT_URL = "http://localhost:8080/ws";
const SOAP_NS = "http://etu/polytech/ws/soap/lang";

function getCountry(country, onReady, onFailed){

    var request =
        '<x:Envelope xmlns:x="http://schemas.xmlsoap.org/soap/envelope/" xmlns:lan="' + SOAP_NS + '">' +
            '<x:Header/>' +
                '<x:Body>' +
                    '<lan:countryRequest>' +
                        '<lan:name>?</lan:name>' +
                    '</lan:countryRequest>' +
                '</x:Body>' +
        '</x:Envelope>';

    jQuery.ajax({
        url: SOAP_ENDPOINT_URL,
        type: "POST",
        async: false,
        dataType: "xml",
        data: request.replace('?', country),
        contentType: "text/xml; charset=\"utf-8\"",
        success: function( response ){
           onReady(response);
        },

        error: function(XMLHttpRequest,textStatus, errorThrown){
            onFailed(errorThrown);
        }

    });
}