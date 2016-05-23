'use strict';

var App=angular.module('myApp',[]);
App.controller('MenuController', ['$scope', 'MenuService', function ($scope, MenuService) {
        var self = this;
        self.item = {};
        self.items = [];

        self.getAllMeals = function () {
            MenuService.getAllMeals()
                    .then(
                            function (d) {
                                self.items = d;
                            },
                            function (errResponse) {
                                console.error('Error while fetching titles');
                            }
                    );
        };


        self.getAllMeals();



    }]);
