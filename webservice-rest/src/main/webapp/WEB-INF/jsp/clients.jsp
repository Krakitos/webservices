<%@taglib prefix="t" tagdir="/WEB-INF/tags/" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<t:base>
    <div class="col-lg-12" ng-controller="ClientsListCtrl">
        <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#add_client_modal">Ajouter</button>
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
                    <td>{{client.zipCode}}</td>
                    <td>{{client.city}}</td>
                    <td>{{client.piece}}</td>
                </tr>
            </tbody>
        </table>

    <!-- Modal -->
    <div ng-controller="ClientBuilderCtrl" class="modal fade" id="add_client_modal" tabindex="-1" role="dialog" aria-labelledby="add_client_modalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title" id="myModalLabel">Création d'un client</h4>
                </div>
                <div class="modal-body">
                    <fieldset class="form-group">
                        <label for="client_name">Nom:</label>
                        <input type="text" ng-model="client.name" class="form-control" id="client_name" placeholder="Nom du client...">
                    </fieldset>
                    <fieldset class="form-group">
                        <label for="client_address">Adresse:</label>
                        <input type="text" ng-model="client.address" class="form-control" id="client_address" placeholder="Adresse du client...">
                    </fieldset>
                    <fieldset class="form-group">
                        <label for="client_zipcode">Code Postal:</label>
                        <input type="number" max="99999" ng-model="client.zipCode" class="form-control" id="client_zipcode" placeholder="Code Postal du client...">
                    </fieldset>
                    <fieldset class="form-group">
                        <label for="client_city">Ville:</label>
                        <input type="text" ng-model="client.city" class="form-control" id="client_city" placeholder="Ville du client...">
                    </fieldset>
                    <fieldset class="form-group">
                        <label for="client_justif">Type de pièce justificative d'identité:</label>
                        <select ng-model="client.piece" class="c-select" id="client_justif">
                            <option selected="selected">CI</option>
                            <option>PC</option>
                            <option>PS</option>
                        </select>
                    </fieldset>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Annuler</button>
                    <button type="button" class="btn btn-primary" ng-click="add_client()">Ajouter</button>
                </div>
            </div>
        </div>
    </div>
</t:base>
