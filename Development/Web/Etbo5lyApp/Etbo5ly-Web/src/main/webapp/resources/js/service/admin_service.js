'use strict';

App.factory('MenuService', ['$http', '$q', function ($http, $q) {


        return {
            getAllMeals: function () {
                return $http.get('/Etbo5ly-Web/rest/page?page=-2')
                        .then(
                                function (response) {
                                    return response.data;
                                },
                                function (errResponse) {
                                    console.error('Error while fetching titles');
                                    return $q.reject(errResponse);
                                }
                        );
            }
            ,
            getAllCooks: function () {
                return $http.get('/Etbo5ly-Web/rest/cook/page?page=-2')
                        .then(
                                function (response) {
                                    return response.data;
                                },
                                function (errResponse) {
                                    console.error('Error while fetching titles');
                                    return $q.reject(errResponse);
                                }
                        );
            },
            createOrder: function (order) {
                return $http.post('/Etbo5ly-Web/rest/createOrder', order)
                        .then(
                                function (response) {
                                    return response.data;
                                },
                                function (errResponse) {
                                    console.error('Error while creating Order');
                                    return $q.reject(errResponse);
                                }
                        );
            },
            getAllCategories: function () {
                return $http.get('/Etbo5ly-Web/rest/get/categories')
                        .then(
                                function (response) {

                                    return response.data;


                                },
                                function (errResponse) {
                                    console.error('Error while fetching titles');
                                    return $q.reject(errResponse);
                                }
                        );
            },
            searchForMeal: function (mealName) {
                alert("serviceee " + mealName);
                return $http.get('/Etbo5ly-Web/rest/meal?mealName=' + mealName)

                        .then(
                                function (response) {
                                    alert("service response" + response);
                                    return response.data;

                                },
                                function (errResponse) {
                                    alert("service error" + errResponse);
                                    console.error('Error while fetching meals');
                                    return $q.reject(errResponse);
                                }
                        );
            }
        };

    }]);
