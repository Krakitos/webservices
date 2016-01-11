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
                <h1 class="border center">FACTURATION SEJOUR</h1>
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
                    <th class="tableFact">Date de debut</th>
                    <th class="tableFact">Date de fin</th>
                    <th class="tableFact">Nombre de personnes</th>
                    <th class="tableFact">Prix/jour/personne</th>
                </tr>
                <tr class="tableFact">
                    <td class="tableFact">{{sejour.debutSejour}}</td>
                    <td class="tableFact">{{sejour.finSejour}}</td>
                    <td class="tableFact">{{sejour.nbPersonne}}</td>
                    <td class="tableFact">{{sejour.emplacement.price}}</td>
                </tr>
            </table>
        </div>

        <div class="col-md-offset-9 col-lg-3 tableFact">
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