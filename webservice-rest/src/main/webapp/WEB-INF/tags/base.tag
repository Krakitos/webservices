<%@tag description="Cerisaie Layout" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="full" lang="en" ng-app>
<!-- Make sure the <html> tag is set to the .full CSS class. Change the background image in the full.css file. -->

<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Simple web page for REST Communication Using Spring and AngularJS">
    <meta name="author" content="Morgan Funtowicz & Mickael Shah">

    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/bootstrap-theme.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">

    <title>Camping Cerisaie</title>
</head>
<body>
<!-- Navigation -->
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">Camping Cerisaie</a>
        </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li>
                    <a href="#">Réservation</a>
                </li>
                <li>
                    <a href="#">Gestion client</a>
                </li>
                <li>
                    <a href="#">Activités</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- Page Content -->
<div class="container">
    <div class="row">
        <jsp:doBody />
    </div>
</div>

<script src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="application/javascript"></script>
<script src="${pageContext.request.contextPath}/js/jquery-2.1.4.min.js" type="application/javascript"></script>
</body>