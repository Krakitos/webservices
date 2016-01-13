/**
 * Created by mfuntowicz on 23/12/15.
 */

var clientsServices = angular.module('clientsServices', ['ngResource']);

clientsServices.factory('Client', ['$resource',
    function($resource){
        return $resource('api/clients/:id', { id: '@id'}, {
            query:  {method:'GET', params:{}, isArray:true},
            save:   {method:'PUT', params:{}, isArray:false},
            delete: {method:'DELETE', params:{id: '@id'}, isArray:false},
            update: {method: 'POST', params:{id: '@id'}, isArray:false},
            get:    {method: 'GET', params:{id: '@id'}, isArray:false}
        });
    }]
);

var sejoursServices = angular.module('sejoursServices', ['ngResource']);

sejoursServices.factory('Sejour', ['$resource',
    function($resource){
        return $resource('api/booking/:id', { id: '@id'}, {
            query:  {method:'GET', params:{}, isArray:true},
            save:   {method:'PUT', params:{}, isArray:false},
            delete: {method:'DELETE', params:{id: '@id'}, isArray:false},
            update: {method: 'POST', params:{id: '@id'}, isArray:false}
        });
    }]
);