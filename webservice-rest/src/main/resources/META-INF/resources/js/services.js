/**
 * Created by mfuntowicz on 23/12/15.
 */

var clientServices = angular.module('clientServices', ['ngResource']);

clientServices.factory('Client', ['$resource',
    function($resource){
        return $resource('clients/:clientId', {}, {
            query: {method:'GET', params:{clientId:'clients'}, isArray:true}
        });
    }]
);