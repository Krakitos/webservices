const SOAP_NS = "http://etu/polytech/ws/soap/lang";

function getCountry(country, onReady, onFailed){

    current_path = window.location.pathname.replace(/^\/|\/$/g, '').split('/');
    SOAP_ENDPOINT_URL = window.location.host;

    if(current_path.length > 1){
         SOAP_ENDPOINT_URL += '/' + current_path.splice(-1, 1);
    }

    SOAP_ENDPOINT_URL += '/ws';

    if(SOAP_ENDPOINT_URL.indexOf("http://") != 0 && SOAP_ENDPOINT_URL.indexOf("https://") != 0){
        SOAP_ENDPOINT_URL = "http://" + SOAP_ENDPOINT_URL;
    }


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