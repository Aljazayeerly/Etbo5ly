'use strict';
//var App=angular.module('myApp',[]);
App.factory('orderService', ['$http', '$q', function($http, $q) {
        var order = [];

        function setOrder(givenOrder) {
            alert("sett");
            alert("quantity :" + givenOrder.location);
//            order = givenOrder;s
            order.push(givenOrder);
            alert("quantity tany :" + order[0].location);
        }
        function getOrder() {  
            alert("location in service  : " + order[0]);
            return order[0];
        }


        return {
            getAllCustomerOrders: function(id) {
                alert("service y bbe ");
                return $http.get('/Etbo5ly-Web/rest/orders?customerId=1')
                        .then(
                                function(response) {
                                    alert("response");
                                    return response.data;
                                },
                                function(errResponse) {
                                    alert("error response");
                                    console.error('Error while fetching titles');
                                    return $q.reject(errResponse);
                                }
                        );
            },
            setOrder: setOrder,
            getOrder: getOrder
        };


    }]);
