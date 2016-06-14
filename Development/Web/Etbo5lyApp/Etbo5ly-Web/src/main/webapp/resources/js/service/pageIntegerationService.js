/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
'use strict';
//var App = angular.module('myApp', []);
App.factory('PageService', ['$http', '$q', function($http, $q) {
        var cook = {};
        var menu = {};
        var city = null;
        var region = 0;
        var addressDetails = null;
        var cookId = 0;
        var cookName = null;
        var order = {};
        var totalPrice = 0;
        var id = 0;
        var cart = [];
        function setElement(data) {
            cook = data;
        }
        function getElement() {
            return cook;
        }
        function setMenu(data) {
            menu = data;
        }
        function getMenu() {
            return menu;
        }
        function setCity(data) {

            city = data;
        }
        function getCity() {
            return city;
        }
        function setRegion(data) {
            region = data;
        }
        function getRegion() {
            return region;
        }

        function setId(data) {
            id = data;
        }
        function getId() {
            return id;
        }

        function setAddressDetails(data) {
            addressDetails = data;
        }
        function getAddressDetails() {
            return addressDetails;
        }
        function getCookId() {
            return cookId;
        }
        function setCookName(data) {
            cookName = data;
        }
        function getCookName() {
            return cookName;
        }
        function setCookId(data) {
            cookId = data;
        }
        function getCookId() {
            return cookId;
        }
        function setOrder(data) {
            order = data;
        }
        function getOrder() {

            return order;
        }
        function setTotalPrice(data) {
            totalPrice = data;
        }
        function getTotalPrice() {
            return totalPrice;
        }
        function setCart(data) {
            cart = data;
        }
        function getCart() {
            return cart;
        }


        return{
            setElement: setElement,
            getElement: getElement,
            setCity: setCity,
            getCity: getCity,
            setRegion: setRegion,
            getRegion: getRegion,
            setId: setId,
            getId: getId,
            setAddressDetails: setAddressDetails,
            getAddressDetails: getAddressDetails,
            setCookId: setCookId,
            getCookId: getCookId,
            setCookName: setCookName,
            getCookName: getCookName,
            setOrder: setOrder,
            getOrder: getOrder,
            setTotalPrice: setTotalPrice,
            getTotalPrice: getTotalPrice,
            setCart: setCart,
            getCart: getCart,
            getCookMeals: function(id) {

                var data = "";
                var deferred = $q.defer();
                $http.get("/Etbo5ly-Web/rest/cookMeals?id=" + id)
                        .success(function(response, status, headers, config) {
                            deferred.resolve(response);
                        })
                        .error(function(errResp) {
                            console.error('Error while fetching near by cooks');
                            deferred.reject({message: "'Error while fetching near by cooks'"});
                        });
                return deferred.promise;
            },
            getAllCooks: function() {
                var deferred = $q.defer();

                return $http.get('/Etbo5ly-Web/rest/cook/page?page=-2')
                        .success(function(response, status, headers, config) {
                            deferred.resolve(response);
                        })
                        .error(function(errResp) {
                            console.error('Error while fetching All Cooks');
                            deferred.reject({message: "'Error while fetching All Cooks'"});
                        });
                return deferred.promise;
            },
            setMenu: setMenu,
            getMenu: getMenu
        };
    }]);

