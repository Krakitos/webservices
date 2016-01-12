var clientsControllers = angular.module('clientsControllers', []);
var sejoursControllers = angular.module('sejoursControllers', []);

clientsControllers.controller('ClientsListCtrl', ['$scope', 'Client', function($scope, Client) {
    $scope.clients = Client.query();

    $scope.delete_client = function(client){
        console.log("Delete_client", client);
        Client.delete({id:client}, function(result){
           $scope.clients = Client.query();
        });
    }

    $scope.show_update_form = function(client){
        $scope.selected = client;
        $('#update_client_modal').modal('show');
    };

    $scope.update_client = function(){
        Client.update($scope.selected);
        $('#update_client_modal').modal('hide');
    }
}]);

clientsControllers.controller('ClientBuilderCtrl', ['$scope', 'Client', function($scope, Client) {
    $scope.add_client = function(){
        Client.save($scope.client, function(client){
            $scope.clients.push(client);
            $('#add_client_modal').modal('hide');
        });
    }
}]);

sejoursControllers.controller('SejoursListCtrl', ['$scope', 'Sejour', function($scope, Sejour) {
    $scope.sejours = Sejour.query();

    $scope.delete_sejour = function(sejour){
        Sejour.delete(sejour, function(result){
            for(var s in $scope.sejours){
                if(s.id == sejour) {
                    $scope.sejours.remove(s);
                }
            }
        });
    }

    $scope.show_factureSejour = function(sejour){
        $scope.selectedS = sejour;
        $('#facture_sejour_modal').modal('show');

        var parts = sejour.debutSejour.split("-");
        var d1 = new Date(parts[0], parts[1] - 1, parts[2]);
        var parts2 = sejour.finSejour.split("-");
        var d2 = new Date(parts2[0], parts2[1] - 1, parts2[2]);
        function diffdate(d1,d2){
            var WNbJours = d2.getTime() - d1.getTime();
            return Math.ceil(WNbJours/(1000*60*60*24));
        }
        var diffJ = diffdate(d1,d2);
        $scope.total= diffJ * sejour.emplacement.type.price * sejour.nbPersonne;

    };

    $scope.show_factureActivite = function(sejour){
        $scope.selectedS = sejour;
        $('#facture_activite_modal').modal('show');


        $scope.getTotal = function(){
            var total = 0;
            for(var i = 0; i < $scope.selectedS.activites.length; i++){
                var activite = $scope.selectedS.activites[i];
                total += (activite.nbLoc * activite.sport.unitPrice);
            }
            return total;
        }
    };

}]);

sejoursControllers.controller('SejourBuilderCtrl', ['$scope', 'Sejour', function($scope, Sejour) {
    $scope.add_sejour = function(){
        Sejour.save($scope.sejour, function(sejour){
            $scope.sejours.push(sejour);
            $('#add_sejour_modal').modal('hide');
        });
    }
}]);
