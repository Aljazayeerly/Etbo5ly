/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


App.config(function ($routeProvider, $locationProvider) {
    // alert("inside the config ");
    $routeProvider.when('cookKitchen.htm?id', {
        controller: 'cookMenuController'
    });
//     $routeProvider.when('/', {
//        controller: 'cookMenuController'
//    });
//      $routeProvider.otherwise({redirectTo:'/'});
    $locationProvider.html5Mode({
        enabled: true,
        requireBase: false
    });
});

App.controller('cookMenuController', ['$scope', 'cookMenuService', '$location', function ($scope, cookMenuService, $location) {
        $scope.id;
        $scope.cookmenu;
        
        if ($location.search().hasOwnProperty('id')) {
            $scope.id = $location.search()['id'];
            $scope.cookmenu = cookMenuService.getCookMenu($scope.id);
            $scope.cookmenu.then(function (resolve) {
                
            }, function (reject) {
                console.log(reject);
            });
        }



    }]);