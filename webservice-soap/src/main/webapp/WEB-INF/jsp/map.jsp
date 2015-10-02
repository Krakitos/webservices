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
    <link href="${pageContext.request.contextPath}/css/jquery-jvectormap-2.0.4.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet"/>

    <script src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery-jvectormap-2.0.4.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/gdp-data.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery-jvectormap-world-mill-en.js"></script>
    <script src="${pageContext.request.contextPath}/js/numeral.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/countries.js"></script>
    <script src="${pageContext.request.contextPath}/js/soap.js"></script>
    <script src="${pageContext.request.contextPath}/js/map.js"></script>

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
        <h5 class="webpage-header text-center">Survolez un pays pour afficher ces informations.</h5>
    </header>
    <div class="container-fluid">
            <div class="col-lg-2">
                <nav class="list-group">
                    <div class="row">
                        <ul id="listPays">
                            <c:forEach var="country" items="${countries}">
                                <li class="list-group-item" id="listli">
                                    <a onClick="selectRegion('<c:out value="${country.name}" />');"><c:out value="${country.name}" /></a>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                    <div class="row">
                        <div class="col-lg-offset-2">
                            <div class="input-group">
                                <input type="text" class="form-control" placeholder="Search for...">
                            <span class="input-group-btn">
                                <button class="btn btn-default" type="button">Go!</button>
                            </span>
                            </div>
                        </div>
                    </div>
                </nav>
            </div>
            <div class="col-lg-10 allSize">
                <div class="allSize" id="worldmap"></div>
            </div>
        </div>
    </div>
    <p></p>
    <footer class="text-center webpage-header">Polytech Lyon Morgan Funtowicz & Mickael Shah</footer>
</body>
</html>
