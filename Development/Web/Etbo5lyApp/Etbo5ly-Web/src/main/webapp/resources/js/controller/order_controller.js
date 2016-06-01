
'use strict';
//var App = angular.module('myApp', ['ui.router']);
//App.config(['$routeProvider', '$stateProvider',function($stateProvider, $urlRouterProvider) {
//
//    $urlRouterProvider.otherwise('/posts');
//    $stateProvider
//            .state('menus', {
//                url: '/createOrder',
//                templateUrl: 'kitchen.htm'
//            })
//            .state('menus.order', {
//                url: '/customerOrder',
//                templateUrl: '/customerOrder'
//            })
//                    .otherwise("kitchen.htm");
//}]);

App.controller('OrderController', function($scope, orderService, $location, $window) {

    alert("inside");
    var self = $scope;
    $scope.orders = []; //[ {userByCustomerId:0,customerName:"",userByCookId:0,cookName:"",location:"",duration:0,orderDetails:[{menuItemsItemId:0},{menuItemsItemId:0}]},{}];
    // self.orders =  $scope.orders;
    $scope.order = {};


    $scope.getAllCustomerOrders = function() {
        alert("getAllCustomerOrders");
        orderService.getAllCustomerOrders()
                .then(
                        function(d) {
                            alert("getAllCustomerOrders  : " + d.length);
                            alert("getAllCustomerOrders  : " + d[0].orderDetails.length);
                            alert("cutomer" + JSON.stringify(d));
                            alert("cutomer" + d[0].location);


                            self.orders = d;
                            alert("quantity :" + self.orders[0].location);

                        },
                        function(errResponse) {
                            alert("erros fl controller")
                            console.error('Error while fetching orders');
                        }
                );
    };

    $scope.getAllCustomerOrders();

    $scope.setOrderDetails = function(id)
    {
        alert("view set details");
        // alert("quantity :" + self.orders[0].location);

        orderService.setOrder(self.orders[id - 1]);
        orderService.getOrder();
        alert("getting the order" + JSON.stringify(orderService.getOrder()));
        //  $window.location.reload();
        $window.location = "customerOrder.htm";
//        $state.go('^');
        // $state.go('^',"first",{notify: false});
        // alert("url is " + $location.path());
//       $location.path('customerOrder.htm',false);

    }

});




//App.controller('OrderController2', ['$scope', 'orderService', function($scope, orderService) {
//
//        alert("inside 2 ");
//        //var self = this;
//        //  $scope.orders = []; //[ {userByCustomerId:0,customerName:"",userByCookId:0,cookName:"",location:"",duration:0,orderDetails:[{menuItemsItemId:0},{menuItemsItemId:0}]},{}];
//        $scope.orderr = {};
//
////        $scope.getOrderDetails = function()
////        {
////            alert("view get details");
////            $scope.order = orderService.getOrder();
////            alert("getting the order " + orderService.getOrder());
////            alert("location :" + $scope.order); //unzeft
////
////
////        }
//
//        $scope.orderr = orderService.getOrder();
//        alert("location in ctrl :" + JSON.stringify($scope.orderr));
//
//        //   $scope.getOrderDetails();
//    }]);
    