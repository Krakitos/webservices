jQuery(document).ready(function(){
    $("#worldmap").vectorMap({
        map: 'world_mill_en',
        series: {
            regions: [{
                values: gdpData,
                scale: ['#C8EEFF', '#0071A4'],
                normalizeFunction: 'polynomial'
            }]
        },
        onRegionTipShow: function(e, label, code){
            var country = getBy('iso2', code);
            if(country != null){
                getCountry(country.fr, function(request){
                    if(request.getElementsByTagNameNS(SOAP_NS, "name").length > 0) {
                        var name = request.getElementsByTagNameNS(SOAP_NS, "name")[0].innerHTML;
                        var capital = request.getElementsByTagNameNS(SOAP_NS, "capital")[0].innerHTML;
                        var population = request.getElementsByTagNameNS(SOAP_NS, "population")[0].innerHTML;
                        label.html('<div style="text-align: center;">' + name  +"</div>" +
                            "Capitale : " + capital +
                            ", Population : " + population + " habitants");
                    }else{
                        label.html(label.html() + " Non trouvé");
                    }
                }, function(error){
                    label.html("Une erreur est survenue : " + error);
                });
            }else{
                label.html("Non trouvé");
            }
        }
    }).vectorMap('get', 'mapObject').updateSize();

});

function selectRegion(region) {
    var map = $("#worldmap").vectorMap('get','mapObject');
    var country = getBy('fr',region);

    if(country) {
        map.clearSelectedRegions();
        map.setSelectedRegions(country.iso2);
    }
}