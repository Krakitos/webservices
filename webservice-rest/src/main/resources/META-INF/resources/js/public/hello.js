function Hello($scope, $http) {
    $http.get('http://localhost:8080/cerisaie/api/clients/1').
        success(function(data) {
            $scope.client = data;
        });
}
