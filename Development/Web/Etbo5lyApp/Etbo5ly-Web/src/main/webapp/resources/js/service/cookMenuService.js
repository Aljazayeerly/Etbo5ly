/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


App.factory('cookMenuService', ['$http', '$q', function ($http, $q) {

        return {
            getCookMenu: function (id) {
               var data = "";
                var deferred = $q.defer();
                $http.get("/Etbo5ly-Web/rest/cookMeals?id=" + id)
                        .success(function (response, status, headers, config) {
                            deferred.resolve(response);
                        })
                        .error(function (errResp) {
                            console.error('Error while fetching near by cooks');
                            deferred.reject({message: "'Error while fetching near by cooks'"});
                        });
                return deferred.promise;
            }
       };

    }]);