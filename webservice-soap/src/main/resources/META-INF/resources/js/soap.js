const SOAP_ENDPOINT_URL = "http://localhost:8080/ws";
const SOAP_NS = "http://etu/polytech/ws/soap/lang";

function getCountry(country, onReady, onFailed){

    var request =
        '<x:Envelope xmlns:x="http://schemas.xmlsoap.org/soap/envelope/" xmlns:lan="' + SOAP_NS + '">' +
            '<x:Header/>' +
                '<x:Body>' +
                    '<lan:getCountryRequest>' +
                        '<lan:name>?</lan:name>' +
                    '</lan:getCountryRequest>' +
                '</x:Body>' +
        '</x:Envelope>';

    jQuery.ajax({
        url: SOAP_ENDPOINT_URL,
        type: "POST",
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