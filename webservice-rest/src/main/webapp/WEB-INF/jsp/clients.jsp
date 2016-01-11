<%@taglib prefix="t" tagdir="/WEB-INF/tags/" %>
<%@page contentType="text/html; utf-8" %>
<t:base>
    <div class="col-lg-12" ng-controller="ClientsListCtrl">
        <table class="table">
            <thead>
                <tr>
                    <th>Nom</th>
                    <th>Adresse</th>
                    <th>Code Postal</th>
                    <th>Ville</th>
                    <th>Justificatif</th>
                </tr>
            </thead>
            <tbody>
                <tr ng-repeat="client in clients">
                    <td>{{client.name}}</td>
                    <td>{{client.address}}</td>
                    <td>{{client.zipcode}}</td>
                    <td>{{client.city}}</td>
                    <td>{{client.piece}}</td>
                </tr>
            </tbody>
        </table>
    </div>
</t:base>
