/**
 * Created by mfuntowicz on 23/12/15.
 */

var clientsServices = angular.module('clientsServices', ['ngResource']);

clientsServices.factory('Client', ['$resource',
    function($resource){
        return $resource('api/clients', {}, {
            query: {method:'GET', isArray:true}
        });
    }]
);