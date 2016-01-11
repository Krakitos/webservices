function ListeClient($scope, $http) {
    $http.get('http://localhost:8080/cerisaie/api/clients/').
    success(function(data) {
        $scope.clients = data;
    });
}