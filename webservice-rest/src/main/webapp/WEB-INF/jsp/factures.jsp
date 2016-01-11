<%@taglib prefix="t" tagdir="/WEB-INF/tags/" %>
<t:base>
    <div class="container" ng-controller="ListeSejour">
        <div class="row">
            <div class="col-md-12">

                <h3>Voici la liste des Sejour : </h3>

                <TABLE class="table table-hover">
                    <TR>
                        <th>Id Sejour</th>
                        <th>Nom</th>
                        <th></th>
                        <th></th>>
                    </TR>
                    <tr ng-repeat="sejour in sejours">
                        <td>{{sejour.id}}</td>
                        <td>{{sejour.client.name}}</td>
                        <td>
                            <form class="form-inline" action="factureSejour/{{sejour.id}}}" method="get">
                                <div class="form-group">
                                    <button type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span> Imprimer facture du sejour</button>
                                </div>
                            </form>
                        </td>
                        <td>
                            <form class="form-inline" action="factureActivite/{{sejour.id}}}" method="get">
                                <div class="form-group">
                                    <button type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span> Imprimer facture des activites</button>
                                </div>
                            </form>
                        </td>
            </div>
        </div>
    </div>
</t:base>
