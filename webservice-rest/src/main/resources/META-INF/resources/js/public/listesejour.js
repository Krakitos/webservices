function ListeSejour($scope, $http) {
    $http.get('http://localhost:8080/cerisaie/api/booking').
    success(function(data) {
        $scope.sejours = data;
    });
}