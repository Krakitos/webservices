var clientsControllers = angular.module('clientsControllers', []);

clientsControllers.controller('ClientsListCtrl', ['$scope', 'Client', function($scope, Client) {
    $scope.clients = Client.query();
}]);