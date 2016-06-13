'use strict';
App.factory('orderService', ['$http', '$q', function($http, $q) {
        var order = [];
        function setOrder(givenOrder) {
            order.push(givenOrder);
        }
        function getOrder() {
            return order[0];
        }


        return {
            getAllCustomerOrders: function(id) {
                return $http.get('/Etbo5ly-Web/rest/orders?customerId=1')
                        .then(
                                function(response) {
                                    return response.data;
                                },
                                function(errResponse) {

                                    console.error('Error while fetching orders');
                                    return $q.reject(errResponse);
                                }
                        );
            },
            getAllCookOrders: function(id) {
                return $http.get('/Etbo5ly-Web/rest/cookOrders?cookId=3')
                        .then(
                                function(response) {
//                                    alert("service response");
//                                    alert("response: " + response.length);
                                    return response.data;
                                },
                                function(errResponse) {
//                                    alert("error response");
                                    console.error('Error while fetching orders');
                                    return $q.reject(errResponse);
                                }
                        );
            },
            changeOrderStatus: function(orderStatus) {

                return $http.post('/Etbo5ly-Web/rest/updateOrderStatus', orderStatus)
                        .then(
                                function() {
//                                    alert("response");
//                                    alert("response: " + response.length);
//                                    return response.data;

                                },
                                function(errResponse) {
                                    console.error('Error while update order status ');
                                    return $q.reject(errResponse);
                                }
                        );
            },
            orderRate: function(order) {

                return $http.post('/Etbo5ly-Web/rest/orderRate', order)
                        .then(
                                function() {
                                },
                                function(errResponse) {

                                    console.error('Error while update order status ');
                                    return $q.reject(errResponse);
                                }
                        );
            },
            setOrder: setOrder,
            getOrder: getOrder
        }

    }]);
