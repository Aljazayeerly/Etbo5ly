/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


App.factory('cookProfileService', ['$http', '$q', function ($http, $q) {

        return {
            
             getCookDataForProfile: function (id)
            {
                alert("in service "+id);
                return $http.get('/Etbo5ly-Web/rest/cook/cookProfile?id='+ id)
                        .then(
                                function (response) {
                                    alert(id+"in service uccess");
                                    alert("responsssssse dataa" + JSON.stringify(response.data));
                                    return response.data;
                                },
                                function (errResponse) {
                                    alert("service error");
                                    console.error('Error while fetching cook data in service');
                                    return $q.reject(errResponse);
                                }
                        );

            }
        }
                }]);
        