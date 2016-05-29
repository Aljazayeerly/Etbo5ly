/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
'use strict';
//var App = angular.module('myApp', []);
App.factory('PageService', ['$http', '$q', function ($http, $q) {
        var cook = {};
        function setElement(data) {
            cook = data;
        }
        function getElement() {
            return cook;
        }

        return{
            setElement: setElement,
            getElement: getElement,
            getCookMeals: function (id) {
                return $http.get("/Etbo5ly-Web/rest/cookMeals?id=" +id)
                        .then(
                                function (response) {
                                    return response.data;
                                },
                                function (errResponse) {
                                    console.error('Error while fetching near by cooks');
                                    return $q.reject(errResponse);
                                }
                        );
            }
        };


    }]);
