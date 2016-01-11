/**
 * Created by mfuntowicz on 23/12/15.
 */

var clientsServices = angular.module('clientsServices', ['ngResource']);

clientsServices.factory('Client', ['$resource',
    function($resource){
        return $resource('api/clients/:id', { id: '@id'}, {
            query: {method:'GET', params:{}, isArray:true},
            save: {method:'PUT', params:{}, isArray:false},
            delete: {method:'DELETE', isArray:false}
        });
    }]
);