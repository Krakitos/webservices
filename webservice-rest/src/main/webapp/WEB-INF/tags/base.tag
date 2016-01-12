<%@tag description="Cerisaie Layout" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="full" lang="en" ng-app="cerisaieapp">
<!-- Make sure the <html> tag is set to the .full CSS class. Change the background image in the full.css file. -->

<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="description" content="Simple web page for REST Communication Using Spring and AngularJS">
    <meta name="author" content="Morgan Funtowicz & Mickael Shah">

    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">

    <script src="${pageContext.request.contextPath}/js/angular.min.js" type="application/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/angular-resource.min.js" type="application/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/angular-route.js"></script>
    <script src="${pageContext.request.contextPath}/js/app.js" type="application/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/services.js" type="application/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/controllers.js" type="application/javascript"></script>

    <title>Camping Cerisaie</title>
</head>
<body>
    <nav class="navbar navbar-fixed-top navbar-dark bg-inverse">
        <a class="navbar-brand" href="#">Camping Cerisaie</a>
        <ul class="nav navbar-nav">
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/cerisaie/booking">Réservation</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/cerisaie/clients">Clients</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/cerisaie/activities">Activités</a>
            </li>
        </ul>
    </nav>

    <!-- Page Content -->
    <div class="container">
        <div class="row">
            <jsp:doBody />
        </div>
    </div>

    <!-- Scripts -->
    <script src="${pageContext.request.contextPath}/js/jquery-2.1.4.min.js" type="application/javascript"></script>
    <script>window.jQuery || document.write('<script src="js/jquery-2.1.4.min.js"><\/script>')</script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="application/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/ie10-viewport-bug-workaround.js" type="application/javascript"></script>
</body>