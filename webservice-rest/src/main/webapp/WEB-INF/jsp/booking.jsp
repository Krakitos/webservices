<%@taglib prefix="t" tagdir="/WEB-INF/tags/" %>
<t:base>
        <div class="container" ng-controller="ListeSejour">
            <div class="row">
                <div class="col-md-12">

                    <h3>Voici la liste des Sejour : </h3>

                    <TABLE class="table table-hover">
                        <TR>
                            <th>ID</th>
                            <th>Client</th>
                            <th>Emplacement</th>
                            <th>Date de debut sejour</th>
                            <th>Date de fin sejour</th>
                            <th>Nombres de personnes</th>
                            <th>Activite</th>
                        </TR>
                        <tr ng-repeat="sejour in sejours">
                            <td>{{sejour.id}}</td>
                            <td>{{sejour.client.name}}</td>
                            <td>{{sejour.emplacement.type.libelle}}</td>
                            <td>{{sejour.debutSejour}}</td>
                            <td>{{sejour.finSejour}}</td>
                            <td>{{sejour.nbPersonne}}</td>
                            <td><TABLE class="table table-hover">
                                    <TR>
                                        <th>Libelle</th>
                                        <th>Nombres Location</th>
                                        <th>Temps</th>
                                        <th>Prix unitaire</th>
                                    </TR>
                                    <tr ng-repeat="activite in sejour.activites">
                                        <td>{{activite.sport.libelle}}</td>
                                        <td>{{activite.nbLoc}}</td>
                                        <td>{{activite.sport.unite}}</td>
                                        <td>{{activite.sport.unitPrice}}</td>
                                    </tr>
                                </TABLE>
                            </td>
                        </tr>
                    </TABLE>
                </div>
            </div>
        </div>
</t:base>
