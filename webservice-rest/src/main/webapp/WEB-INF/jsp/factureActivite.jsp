<%@taglib prefix="t" tagdir="/WEB-INF/tags/" %>
<t:base>

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
                <h1 class="border center">FACTURATION DES PRESTATION SPORTIVE</h1>
            </div>
        </div>

        <div class="col-lg-12">
            <BR><BR><BR>
            <div class="col-lg-6">
                <p class="gras"> Numero de facture : Sejour{{sejour.id}}</p>
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
                <p>Numero de sejour : {{sejour.id}}</p>
                <p>Numero d emplacement : {{sejour.emplacement.id}}</p>
                <p>Type d emplacement : {{sejour.emplacement.type.libelle}}</p>
            </div>
        </div>

        <div class="col-lg-12">
            <BR>
            <div class="col-md-offset-6 col-lg-6 border">
                <p>Client : {{sejour.client.name}}</p>
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
                <tr ng-repeat="activite in sejour.activites tableFact">
                    <td class="tableFact">{{activite.sport.date}}</td>
                    <td class="tableFact">{{activite.sport.libelle}}</td>
                    <td class="tableFact">{{activite.sport.price}}</td>
                    <td class="tableFact">{{activite.sport.unite}}</td>
                    <td class="tableFact"></td>
                </tr>
            </table>
        </div>

        <div class="col-md-offset-9 col-lg-3">
            <BR>
            <TABLE class="tableFact">
                <tr class="tableFact">
                    <th class="tableFact">Prix total :</th>
                    <th class="tableFact">{{}}</th>
                </tr>
            </table>
        </div>
    </div>

</t:base>