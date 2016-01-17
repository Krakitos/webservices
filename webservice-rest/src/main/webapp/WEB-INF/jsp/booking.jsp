<%@taglib prefix="t" tagdir="/WEB-INF/tags/" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<t:base>
    <div class="col-lg-12" ng-controller="SejoursListCtrl">
    <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#add_sejour_modal">Ajouter</button>
    <table class="table">
        <thead>
        <tr>
            <th>ID</th>
            <th>Client</th>
            <th>Emplacement</th>
            <th>Date de debut sejour</th>
            <th>Date de fin sejour</th>
            <th>Nombres de personnes</th>
            <th>Activite</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
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
            <td>
                <div class="btn-group" role="group" aria-label="edit btns">
                    <button class="btn btn-secondary" ng-click="show_updateS_form(sejour)">Editer</button>
                    <button class="btn btn-danger" ng-click="delete_sejour(sejour.id)">Supprimer</button>
                </div>
            </td>
        </tr>
        </tbody>
    </table>

    <!-- Modal -->
    <div ng-controller="SejourBuilderCtrl" class="modal fade" id="add_sejour_modal" tabindex="-1" role="dialog" aria-labelledby="add_sejour_modalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title" id="myModalLabel">Création d'un séjour</h4>
                </div>
                <div class="modal-body">
                    <fieldset class="form-group">
                        <label for="client_id">ID Client:</label>
                        <input type="text" ng-model="sejour.client.id" class="form-control" id="client_id" placeholder="ID du client...">
                    </fieldset>
                    <fieldset class="form-group">
                        <label for="sejour_debut">Date debut:</label>
                        <input type="text" ng-model="sejour.debutSejour" class="form-control" id="sejour_debut" placeholder="(2015-07-21)...">
                    </fieldset>
                    <fieldset class="form-group">
                        <label for="sejour_fin">Date fin:</label>
                        <input type="text" ng-model="sejour.finSejour" class="form-control" id="sejour_fin" placeholder="(2015-07-31)......">
                    </fieldset>
                    <fieldset class="form-group">
                        <label for="nbPersonne">Nombre de personnes :</label>
                        <input type="text" ng-model="sejour.nbPersonne" class="form-control" id="nbPersonne" placeholder="Nombre de personnes...">
                    </fieldset>
                    <fieldset class="form-group">
                        <label for="emplacement">Emplacement :</label>
                        <select ng-model="sejour.emplacement.id" class="c-select" id="emplacement">
                            <option selected="selected">1</option>
                            <option>2</option>
                            <option>3</option>
                            <option>4</option>
                            <option>5</option>
                            <option>6</option>
                            <option>7</option>
                            <option>8</option>
                            <option>9</option>
                            <option>10</option>
                            <option>11</option>
                            <option>12</option>
                            <option>13</option>
                        </select>
                    </fieldset>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Annuler</button>
                    <button type="button" class="btn btn-primary" ng-click="add_sejour()">Ajouter</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal -->
    <div ng-controller="SejoursListCtrl" class="modal fade" id="update_sejour_modal" tabindex="-1" role="dialog" aria-labelledby="update_sejour_modalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title" id="myModalLabel2">Mise a jour d'un séjour</h4>
                </div>
                <div class="modal-body">
                    <fieldset class="form-group">
                        <label for="client_id2">ID Client:</label>
                        <input type="text" ng-model="selected.client.id" class="form-control" id="client_id2" placeholder="ID du client...">
                    </fieldset>
                    <fieldset class="form-group">
                        <label for="sejour_debut2">Date debut:</label>
                        <input type="text" ng-model="selected.debutSejour" class="form-control" id="sejour_debut2" placeholder="(2015-07-21)...">
                    </fieldset>
                    <fieldset class="form-group">
                        <label for="sejour_fin2">Date fin:</label>
                        <input type="text" ng-model="selected.finSejour" class="form-control" id="sejour_fin2" placeholder="(2015-07-31)......">
                    </fieldset>
                    <fieldset class="form-group">
                        <label for="nbPersonne2">Nombre de personnes :</label>
                        <input type="text" ng-model="selected.nbPersonne" class="form-control" id="nbPersonne2" placeholder="Nombre de personnes...">
                    </fieldset>
                    <fieldset class="form-group">
                        <label for="emplacement2">Emplacement :</label>
                        <select ng-model="selected.emplacement.id" class="c-select" id="emplacement2">
                            <option selected="selected">1</option>
                            <option>2</option>
                            <option>3</option>
                            <option>4</option>
                            <option>5</option>
                            <option>6</option>
                            <option>7</option>
                            <option>8</option>
                            <option>9</option>
                            <option>10</option>
                            <option>11</option>
                            <option>12</option>
                            <option>13</option>
                        </select>
                    </fieldset>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Annuler</button>
                    <button type="button" class="btn btn-primary" ng-click="update_sejour()">Mettre a jour</button>
                </div>
            </div>
        </div>
    </div>



</t:base>
