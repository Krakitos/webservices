<%@taglib prefix="t" tagdir="/WEB-INF/tags/" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<t:base>
    <div class="col-lg-12" ng-controller="SejoursListCtrl">
    <table class="table">
        <thead>
        <tr>
            <th>ID</th>
            <th>Client</th>
            <th>Emplacement</th>
            <th>Date de debut sejour</th>
            <th>Date de fin sejour</th>
            <th>Nombres de personnes</th>
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
            <td> <button class="btn btn-default" ng-click="show_factureSejour(sejour)">Facture du sejour</button> </td>
            <td> <button class="btn btn-default" ng-click="show_factureActivite(sejour)">Facture des activites</button> </td>
        </tr>
        </tbody>
    </table>

        <!-- Modal -->
        <div ng-controller="SejoursListCtrl" class="modal fade" id="facture_sejour_modal" tabindex="-1" role="dialog" aria-labelledby="facture_sejour_modalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-body">
                        <div class="col-lg-12">
                            <div class="col-lg-12">
                                <h2>Cerisaie</h2>
                                <p> Route de la plage</p>
                                <p> 33121 – CARCANS</p>
                                <p> Etoiles : ** </p>
                                <p> Telephone : 05 - 67-78-56-45 </p>
                                <p> Fax : 05 - 67 - 78 - 34 - 25 </p>
                            </div>
                            <div class="col-lg-12">
                                <div class="col-md-offset-3 col-lg-6">
                                    <h3 class="border center">FACTURATION SEJOUR</h3>
                                </div>
                            </div>

                            <div class="col-lg-12">
                                <BR><BR><BR>
                                <div class="col-lg-6">
                                    <p class="gras"> Numero de facture : Sejour{{selectedS.id}}</p>
                                </div>
                                <div class="col-lg-6">
                                    <p class="gras"> Date de facturation : <SCRIPT LANGUAGE="JavaScript">
                                        var maintenant=new Date();
                                        var jour=maintenant.getDate();
                                        var mois=maintenant.getMonth()+1;
                                        var an=maintenant.getFullYear();
                                        document.write("Le ",jour,"/",mois,"/",an);
                                    </SCRIPT></p>
                                </div>
                            </div>

                            <div class="col-lg-12">
                                <BR>
                                <div class="col-lg-6 border">
                                    <p>Numero de sejour : {{selectedS.id}}</p>
                                    <p>Numero d emplacement : {{selectedS.emplacement.id}}</p>
                                    <p>Type d emplacement : {{selectedS.emplacement.type.libelle}}</p>
                                </div>
                            </div>

                            <div class="col-lg-12">
                                <BR>
                                <div class="col-md-offset-6 col-lg-6 border">
                                    <p>Client : {{selectedS.client.name}}</p>
                                </div>
                            </div>

                            <div class="col-md-offset-2 col-lg-9">
                                <BR><BR><BR>
                                <TABLE class="tableFact">
                                    <tr class="tableFact">
                                        <th class="tableFact">Date de debut</th>
                                        <th class="tableFact">Date de fin</th>
                                        <th class="tableFact">Nombre de personnes</th>
                                        <th class="tableFact">Prix/jour/personne</th>
                                    </tr>
                                    <tr class="tableFact">
                                        <td class="tableFact">{{selectedS.debutSejour}}</td>
                                        <td class="tableFact">{{selectedS.finSejour}}</td>
                                        <td class="tableFact">{{selectedS.nbPersonne}}</td>
                                        <td class="tableFact">{{selectedS.emplacement.type.price}}</td>
                                    </tr>
                                </table>
                            </div>

                            <div class="col-md-offset-8 col-lg-4 ">
                                <BR>
                                <TABLE class="tableFact">
                                    <tr class="tableFact">
                                        <th class="tableFact">Prix total :</th>
                                        <th class="tableFact">{{total}} €</th>
                                    </tr>
                                </table>
                            </div>

                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Annuler</button>
                        <button type="button" class="btn btn-primary" ng-click="printFS()" >Imprimer</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal -->
        <div ng-controller="SejoursListCtrl" class="modal fade" id="facture_activite_modal" tabindex="-1" role="dialog" aria-labelledby="facture_activite_modalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-body">

                            <div class="col-lg-12">
                                <div class="col-lg-12">
                                    <h2>Cerisaie</h2>
                                    <p> Route de la plage</p>
                                    <p> 33121 – CARCANS</p>
                                    <p> Etoiles : ** </p>
                                    <p> Telephone : 05 - 67-78-56-45 </p>
                                    <p> Fax : 05 - 67 - 78 - 34 - 25 </p>
                                </div>
                                <div class="col-lg-12">
                                    <div class="col-md-offset-3 col-lg-6">
                                        <h3 class="border center">FACTURATION DES PRESTATIONS SPORTIVES</h3>
                                    </div>
                                </div>

                                <div class="col-lg-12">
                                    <BR><BR><BR>
                                    <div class="col-lg-6">
                                        <p class="gras"> Numero de facture : Sejour{{selectedS.id}}</p>
                                    </div>
                                    <div class="col-lg-6">
                                        <p class="gras"> Date de facturation : <SCRIPT LANGUAGE="JavaScript">
                                            var maintenant=new Date();
                                            var jour=maintenant.getDate();
                                            var mois=maintenant.getMonth()+1;
                                            var an=maintenant.getFullYear();
                                            document.write("Le ",jour,"/",mois,"/",an);
                                        </SCRIPT></p>
                                    </div>
                                </div>

                                <div class="col-lg-12">
                                    <BR>
                                    <div class="col-lg-6 border">
                                        <p>Numero de sejour : {{selectedS.id}}</p>
                                        <p>Numero d emplacement : {{selectedS.emplacement.id}}</p>
                                        <p>Type d emplacement : {{selectedS.emplacement.type.libelle}}</p>
                                    </div>
                                </div>

                                <div class="col-lg-12">
                                    <BR>
                                    <div class="col-md-offset-6 col-lg-6 border">
                                        <p>Client : {{selectedS.client.name}}</p>
                                    </div>
                                </div>

                                <div class="col-md-offset-3 col-lg-8">
                                    <BR><BR><BR>
                                    <TABLE class="tableFact">
                                        <tr class="tableFact">
                                            <th class="tableFact">Date du sport</th>
                                            <th class="tableFact">Nom du sport</th>
                                            <th class="tableFact">Prix/unite</th>
                                            <th class="tableFact">Nombre unites</th>
                                            <th class="tableFact">Montant</th>
                                        </tr>
                                        <tr ng-repeat="activite in selectedS.activites">
                                            <td class="tableFact">{{activite.date}}</td>
                                            <td class="tableFact">{{activite.sport.libelle}}</td>
                                            <td class="tableFact">{{activite.sport.unitPrice}}</td>
                                            <td class="tableFact">{{activite.nbLoc}}</td>
                                            <td class="tableFact">{{activite.nbLoc * activite.sport.unitPrice}}</td>
                                        </tr>
                                    </table>
                                </div>

                                <div class="col-md-offset-8 col-lg-4">
                                    <BR>
                                    <TABLE class="tableFact">
                                        <tr class="tableFact">
                                            <th class="tableFact">Prix total :</th>
                                            <th class="tableFact">{{getTotal()}} €</th>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Annuler</button>
                        <button type="button" class="btn btn-primary" ng-click="printFA()">Imprimer</button>
                    </div>
                </div>
            </div>
        </div>

    </div>

</t:base>
