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

    <link href="${pageContext.request.contextPath}/public/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/public/css/jquery-jvectormap-2.0.4.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/public/css/style.css" rel="stylesheet"/>

    <script src="${pageContext.request.contextPath}/public/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/public/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/public/js/jquery-jvectormap-2.0.4.min.js"></script>
    <script src="${pageContext.request.contextPath}/public/js/gdp-data.js"></script>
    <script src="${pageContext.request.contextPath}/public/js/jquery-jvectormap-world-mill-en.js"></script>
    <script src="${pageContext.request.contextPath}/public/js/numeral.min.js"></script>
    <script src="${pageContext.request.contextPath}/public/js/countries.js"></script>
    <script src="${pageContext.request.contextPath}/public/js/soap.js"></script>
    <script src="${pageContext.request.contextPath}/public/js/map.js"></script>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>
    <header>
        <h1 class="webpage-header text-center">Carte du monde interactive</h1>
        <h5 class="webpage-header text-center">Survolez un pays pour afficher ses informations.</h5>
    </header>
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-3">
                <div id="countries_list" class="list-group allSize" role="navigation">
                    <div class="list-group-item active">
                        <h4 class="list-group-item-heading">Liste des pays</h4>
                        <p class="list-group-item-text">Sélectionnez un pays pour le visualiser sur la carte</p>
                    </div>
                    <c:forEach var="country" items="${countries}">
                        <a class="list-group-item" onClick="selectRegion('<c:out value="${country.name}" />');"><c:out value="${country.name}" /></a>
                    </c:forEach>
                </div>
            </div>
            <div class="col-sm-9 allSize">
                <div class="allSize" id="worldmap"></div>
            </div>
        </div>
    </div>
    <p></p>
    <footer>
        <div class="container-fluid">
            <div class="row">
                <h4 class="webpage-header text-center">Polytech Lyon Morgan Funtowicz & Mickael Shah</h4>
            </div>
        </div>
    </footer>
</body>
</html>
