<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html class="full" lang="en">
<!-- Make sure the <html> tag is set to the .full CSS class. Change the background image in the full.css file. -->

<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Simple web page for SOAP Communication">
    <meta name="author" content="Morgan Funtowicz & Mickael Shah">

    <title>Pays interactifs</title>

    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/the-big-picture.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/jquery-jvectormap-2.0.4.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet"/>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

<!-- Navigation -->
<nav class="navbar navbar-inverse navbar-fixed-bottom" role="navigation">
    <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <div class="navbar-brand">Polytech Lyon Morgan Funtowicz & Mickael Shah</div>
        </div>
    </div>
</nav>

<div id="blabla" class="container">
    <div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12">
            <div class="col-lg-3" id="custombar">
                <nav class="list-group">
                    <ul id="listPays">
                        <c:forEach var="country" items="${countries}">
                            <li class="list-group-item" id="listli" style="word-wrap:break-word;"><a onClick="alert('ok');"><c:out value="${country.name}" /></a></li>
                        </c:forEach>
                    </ul>
                </nav>
            </div>
            <div class="col-lg-9">
                <h1 class="webpage-header text-center">Carte du monde interactive</h1>
                <h5 class="webpage-header text-center">Survolez un pays pour afficher ces informations.</h5>
                <div id="worldmap"></div>
            </div>
        </div>
    </div>
</div>
</body>
<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery-jvectormap-2.0.4.min.js"></script>
<script src="${pageContext.request.contextPath}/js/gdp-data.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery-jvectormap-world-mill-en.js"></script>
<script src="${pageContext.request.contextPath}/js/typeahead.bundle.min.js" ></script>
<script src="${pageContext.request.contextPath}/js/countries.js"></script>
<script src="${pageContext.request.contextPath}/js/soap.js"></script>
<script type="application/javascript">
    jQuery(document).ready(function(){

        console.log("Loading Vector Map");

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
                console.log("Over : " + code);

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
</script>
</html>
