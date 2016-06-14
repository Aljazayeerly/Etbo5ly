'use strict';
App.controller('SearchController', ['$scope', 'MenuService', 'MainService', '$mdDialog', '$mdMedia', 'PageService', function($scope, MenuService, MainService, $mdDialog, $mdMedia, PageService) {
        self.searchForMeal = function(mealName) {
            $scope.showCheckedMeal = false;
            $scope.showAllMeals = false;
            $scope.showSearchMeals = true;
//            alert(mealName);
            MenuService.searchForMeal(mealName)
                    .then(
                            function(d) {
                                self.searchMeals = d;
//                                self.check = true;
//                                alert(JSON.stringify(self.searchMeals));
                            },
                            function(errResponse) {
                                console.error('Error while fetching search meals in controller');
                            }
                    );
        };
    }]);
