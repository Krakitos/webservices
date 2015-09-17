<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html lang="en">
<head>
    <title>Pays</title>
    <meta charset="utf-8">
    <link href="css/style.css" type="text/css" />
</head>
<body>
    <img src="../img/POLYTECH_RVB.jpg" width="256px"/>
    <h1><c:out value="${fn:length(countries)}"/> Pays disponibles :</h1>
    <select>
        <c:forEach var="country" items="${countries}">
            <option><c:out value="${country.name}" /></option>
        </c:forEach>
    </select>
</body>


</html>