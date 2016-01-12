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
}]);

clientsControllers.controller('ClientsUpdateCtrl', ['$scope', 'Client', function($scope, Client) {
    $scope.clients = Client.query();

    $scope.delete_client = function(client){
        Client.update({id:client}, function(result){
            for(var c in $scope.clients){
                if(c.id == client) {
                    $scope.clients.update(c);
                }
            }
        });
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
}]);

sejoursControllers.controller('SejourBuilderCtrl', ['$scope', 'Sejour', function($scope, Sejour) {
    $scope.add_sejour = function(){
        Sejour.save($scope.sejour, function(sejour){
            $scope.sejours.push(sejour);
            $('#add_sejour_modal').modal('hide');
        });
    }
}]);
