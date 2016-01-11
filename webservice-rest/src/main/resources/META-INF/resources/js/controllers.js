var clientsControllers = angular.module('clientsControllers', []);

clientsControllers.controller('ClientsListCtrl', ['$scope', 'Client', function($scope, Client) {
    $scope.clients = Client.query();
}]);

clientsControllers.controller('ClientBuilderCtrl', ['$scope', 'Client', function($scope, Client) {
    $scope.add_client = function(){
        Client.save($scope.client, function(client){
            $scope.clients.push(client);
            $('#add_client_modal').modal('hide');
        });
    }
}]);
