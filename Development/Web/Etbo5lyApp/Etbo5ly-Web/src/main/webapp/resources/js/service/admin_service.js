'use strict';

App.factory('MenuService', ['$http', '$q', function($http, $q) {


        return {
            getAllMeals: function() {
                return $http.get('/Etbo5ly-Web/rest/page?page=-2')
                        .then(
                                function(response) {
                                    return response.data;
                                },
                                function(errResponse) {
                                    console.error('Error while fetching titles');
                                    return $q.reject(errResponse);
                                }
                        );
            }
            ,
            createOrder: function(order) {
                return $http.post('/Etbo5ly-Web/rest/createOrder', order)
                        .then(
                                function(response) {
                                    return response.data;
                                },
                                function(errResponse) {
                                    console.error('Error while creating Order');
                                    return $q.reject(errResponse);
                                }
                        );
            },
        };

    }]);
