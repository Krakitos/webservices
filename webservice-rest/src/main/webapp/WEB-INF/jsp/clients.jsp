<%@taglib prefix="t" tagdir="/WEB-INF/tags/" %>

<t:base>

    <div class="container" ng-controller="ListeClient">
        <div class="row">
            <div class="col-md-12">

                <h3>Voici la liste des Client : </h3>

                <TABLE class="table table-hover">
                    <TR>
                        <th>ID</th>
                        <th>Nom</th>
                        <th>Adresse</th>
                        <th>Code Postal</th>
                        <th>Ville</th>
                        <th>Piece</th>
                        <th>Numero Pieces</th>
                    </TR>
                        <tr ng-repeat="client in clients">
                            <td>{{client.id}}</td>
                            <td>{{client.name}}</td>
                            <td>{{client.address}}</td>
                            <td>{{client.zipCode}}</td>
                            <td>{{client.city}}</td>
                            <td>{{client.piece}}</td>
                            <td>{{client.numPiece}}</td>
                        </tr>
                </TABLE>
            </div>
        </div>
    </div>

</t:base>
