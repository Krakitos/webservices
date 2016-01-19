const COUNTRIES_NS = 'http://etu/polytech/ws/soap/lang';

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
                    if(request.getElementsByTagNameNS(COUNTRIES_NS, 'country').length){

                        var name = request.getElementsByTagNameNS(COUNTRIES_NS, 'name')[0].innerHTML;
                        var capital = request.getElementsByTagNameNS(COUNTRIES_NS, 'capital')[0].innerHTML;
                        var population = request.getElementsByTagNameNS(COUNTRIES_NS, 'population')[0].innerHTML;

                        label.html('<div style="text-align: center;">' + name  +"</div>" +
                            "Capitale : " + capital +
                            ", Population : " + numeral(population).format('0,0') + " habitants");
                    }else{
                        label.html(label.html() + " introuvable");
                    }
                }, function(error){
                    label.html("Une erreur est survenue : " + error);
                });
            }else{
                label.html(label.html() + " introuvable");
            }
        },
        onRegionClick : function(e, code){
            var country = getBy('iso2',code);
            selectRegion(country.fr);
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