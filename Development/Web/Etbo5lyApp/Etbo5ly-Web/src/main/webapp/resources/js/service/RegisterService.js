/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

App.factory('RegisterService', ['$http', '$q', function ($http, $q) {

        return {
            registerCustomer: function (customer) {
                // alert(" inside the register service and the customer json is" + JSON.stringify(customer));
                var deferred = $q.defer();
                return $http.post('/Etbo5ly-Web/rest/customer/signUp', customer)
                        .then(
                                function (response) {
                                    alert(" respone is " + JSON.stringify(response));
                                    return response.data;
                                },
                                function (errResponse) {
                                    console.error('Error while register the user');
                                    return $q.reject(errResponse);
                                }
                        );
//                        .success(function (response, status, headers, config) {
//                            alert("success");
//                            deferred.resolve(response);
//                        }).error(function (msg) {
//                            alert("error");
//                           alert(msg);
//                });
                //   return deferred.promise;

            },
            getAllRegion: function () {
                var deferred = $q.defer();
                $http.get('/Etbo5ly-Web/rest/region/allRegion').success(
                        function (response, status, headers, config) {
                            deferred.resolve(response);
                            // alert("response of regions " + JSON.stringify(response));
                        }
                ).error(function (errResp) {
                    console.error('Error while fetching all regions');
                    deferred.reject({message: "'Error while fetching all regions"});
                });
                return deferred.promise;
            },
            checkEmail: function (email) {
                var deferred = $q.defer();
                $http.get('/Etbo5ly-Web/rest/customer/checkEmail?email=' + email).success(
                        function (response, status, headers, config) {
                            deferred.resolve(response);
                            //console.log(" email already exists" + response);
                        }
                ).error(function (errResp) {
                    console.error('Error while checking the email');
                    // deferred.reject({message: "'Error while fetching all regions"});
                });
                return deferred.promise;
            },
            registerCook: function (cook) {
                var deferred = $q.defer();
                alert(" cook is " + JSON.stringify(cook));
                return $http.post('/Etbo5ly-Web/rest/cook/joinUS', cook)
                        .then(
                                function (response) {
                                    alert(" respone is " + JSON.stringify(response));
                                    return response.data;
                                },
                                function (errResponse) {
                                    console.error('Error while register the user');
                                    return $q.reject(errResponse);
                                }
                        );

            },
            checkCookEmail: function (email) {
                var deferred = $q.defer();
                $http.get('/Etbo5ly-Web/rest/cook/checkEmail?email=' + email).success(
                        function (response, status, headers, config) {
                            deferred.resolve(response);
                            //console.log(" email already exists" + response);
                        }
                ).error(function (errResp) {
                    console.error('Error while checking the email');
                    // deferred.reject({message: "'Error while fetching all regions"});
                });
                return deferred.promise;
            }
//            uploadFiles: function () {
//                var request = {
//                    method: 'POST',
//                    url: '',
//                    data: formdata,
//                    headers: {
//                        'Content-Type': undefined
//                    }
//                }
//                $http(request)
//                        .success(function (d) {
//                            alert(d);
//                        })
//                        .error(function () {
//                        });
//
//            }

        };

    }]);

