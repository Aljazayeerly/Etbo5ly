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
                                    console.error('Error while fetching AllMeals in service');
                                    return $q.reject(errResponse);
                                }
                        );
            }
            ,


            getAllRegions: function() {

                return $http.get('/Etbo5ly-Web/rest/region/countries')

                        .then(
                                function(response) {
                                    return response.data;
                                },
                                function(errResponse) {
                                    console.error('Error while fetching countries');
                                    return $q.reject(errResponse);
                                }
                        );
            }
            ,
            getCookMeals: function(id) {
                return $http.get('/Etbo5ly-Web/rest/cookMeals?id=' + id)
                        .then(
                                function(response) {
                                    return response.data;
                                },
                                function(errResponse) {
                                    console.error('Error while fetching cook meals');
                                    return $q.reject(errResponse);
                                }
                        );
            },
            getAllCooks: function() {
                return $http.get('/Etbo5ly-Web/rest/cook/page?page=-2')
                        .then(
                                function(response) {
                                    return response.data;
                                },
                                function(errResponse) {
                                    console.error('Error while fetching All Cooks in service');
                                    return $q.reject(errResponse);
                                }
                        );
            },
            createOrderService: function(order) {
                return $http.post('/Etbo5ly-Web/rest/createOrder', order)
                        .then(
                                function(response) {
                                    return response.data;
                                },
                                function(errResponse) {
                                    console.error('Error while creating Order in service');
                                    return $q.reject(errResponse);
                                }
                        );
            },
            getAllCategories: function() {
                return $http.get('/Etbo5ly-Web/rest/get/categories')
                        .then(
                                function(response) {

                                    return response.data;
                                },
                                function(errResponse) {
                                    console.error('Error while fetching All Categories in service');
                                    return $q.reject(errResponse);
                                }
                        );
            },
            searchForMeal: function(mealName) {
                return $http.get('/Etbo5ly-Web/rest/meal?mealName=' + mealName)

                        .then(
                                function(response) {
                                    return response.data;
                                },
                                function (errResponse) {

                                    console.error('Error while fetching meals based on search in service');
                                    return $q.reject(errResponse);
                                }
                        );
            }

            ,
           getMealsForCheckedCategories: function (searchDTO)
            {
                return $http.post('/Etbo5ly-Web/rest/search', searchDTO)
                        .then(
                                function (response) {
                                    return response.data;
                                },
                                function (errResponse) {
                                    console.error('Error while fetching checked categories in service');
                                    return $q.reject(errResponse);
                                }
                        );

            }



        };
    }]);
