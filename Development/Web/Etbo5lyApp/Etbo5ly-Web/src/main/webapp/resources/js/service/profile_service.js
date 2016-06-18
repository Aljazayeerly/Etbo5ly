/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


App.factory('cookProfileService', ['$http', '$q', function($http, $q) {

        return {
            getCookDataForProfile: function(id)
            {
                return $http.get('/Etbo5ly-Web/rest/cook/cookProfile?id=' + id)
                        .then(
                                function(response) {

                                    return response.data;
                                },
                                function(errResponse) {
                                    console.error('Error while fetching cook data in service');
                                    return $q.reject(errResponse);
                                }
                        );

            },
            getAllReviews: function(id) {
                return $http.get('/Etbo5ly-Web/rest/cookOrders?cookId=' + id)
                        .then(
                                function(response) {
                                    return response.data;
                                },
                                function(errResponse) {
                                    console.error('Error while fetching orders');
                                    return $q.reject(errResponse);
                                }
                        );
            },
            getReviews: function(id) {
                var data = "";
                var deferred = $q.defer();
                $http.get('/Etbo5ly-Web/rest/cookOrders?cookId=' + id)
                        .success(function(response, status, headers, config) {

                            deferred.resolve(response);
                        })
                        .error(function(errResp) {
                            console.error('Error while fetching near by cooks');
                            deferred.reject({message: "'Error while fetching near by cooks'"});
                        });
                return deferred.promise;

            }
        }
    }]);
        