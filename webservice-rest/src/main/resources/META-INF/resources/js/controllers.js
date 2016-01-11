var clientsControllers = angular.module('clientsControllers', []);

clientsControllers.controller('ClientsListCtrl', ['$scope', 'Client', function($scope, Client) {
    $scope.clients = Client.query();

    $scope.delete_client = function(client){
        Client.delete(client, function(result){
           for(var c in $scope.clients){
               if(c.id == client) {
                   $scope.clients.remove(c);
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
