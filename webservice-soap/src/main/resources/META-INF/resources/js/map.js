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

                    console.log(request);

                    $(request).find('SOAP-ENV\\:Body').find('ns2\\:countryResponse').find('ns2\\:country').find('ns2\\:name').text()

                    if($(request).find('Body').find('countryResponse').find('country')){
                        var country = $(request).find('Body')
                                                .find('countryResponse')
                                                .find('country');

                        var name = country.find('name').text();
                        var capital = country.find('capital').text();
                        var population = country.find('population').text();

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