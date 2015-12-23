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
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">

    <title>Camping Cerisaie</title>
</head>
<body>

    <nav class="navbar navbar-fixed-top navbar-dark bg-inverse">
        <a class="navbar-brand" href="http://v4-alpha.getbootstrap.com/examples/starter-template/#">Project name</a>
        <ul class="nav navbar-nav">
            <li class="nav-item active">
                <a class="nav-link" href="http://v4-alpha.getbootstrap.com/examples/starter-template/#">Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="http://v4-alpha.getbootstrap.com/examples/starter-template/#">About</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="http://v4-alpha.getbootstrap.com/examples/starter-template/#">Contact</a>
            </li>
        </ul>
    </nav>

<!-- Page Content -->
<div class="container">
    <div class="row">
        <jsp:doBody />
    </div>
</div>

<script src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="application/javascript"></script>
<script src="${pageContext.request.contextPath}/js/ie10-viewport-bug-workaround.js" type="application/javascript"></script>
<script src="${pageContext.request.contextPath}/js/jquery-2.1.4.min.js" type="application/javascript"></script>
</body>