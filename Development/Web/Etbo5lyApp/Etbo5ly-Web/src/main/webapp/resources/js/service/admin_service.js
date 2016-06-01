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
                                    console.error('Error while fetching AllMeals in service');
                                    return $q.reject(errResponse);
                                }
                        );
            }
            ,

             getCookMeals: function (id) {
                return $http.get('/Etbo5ly-Web/rest/cookMeals?id='+id)
                        .then(
                                function (response) {
                                    return response.data;
                                },
                                function (errResponse) {
                                    console.error('Error while fetching cook meals in service');
                                    return $q.reject(errResponse);
                                }
                        );
            },

            getAllCooks: function () {
                return $http.get('/Etbo5ly-Web/rest/cook/page?page=-2')
                        .then(
                                function (response) {
                                    return response.data;
                                },
                                function (errResponse) {
                                    console.error('Error while fetching All Cooks in service');
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
                                    console.error('Error while creating Order in service');
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
                                    console.error('Error while fetching All Categories in service');
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
                                    console.error('Error while fetching meals based on search in service');
                                    return $q.reject(errResponse);
                                }
                        );
            }
            
            ,
            getMealsForCheckedCategories:function(searchDTO)
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
