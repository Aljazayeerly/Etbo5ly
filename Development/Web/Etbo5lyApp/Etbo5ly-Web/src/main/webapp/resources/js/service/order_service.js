'use strict';

App.factory('orderService', ['$http', '$q', function($http, $q) {
        var order = [];
        function setOrder(givenOrder) {
//            alert("sett");    
//            alert("quantity :" + givenOrder.location);
//            order = givenOrder;s
            order.push(givenOrder);
//            alert("quantity tany :" + order[0].location);
        }
        function getOrder() {
//            alert("location in service  : " + order[0]);
            return order[0];
        }


        return {
            getAllCustomerOrders: function(id) {
//                alert("service y bbe ");
                return $http.get('/Etbo5ly-Web/rest/orders?customerId=1')
                        .then(
                                function(response) {
//                                    alert("response");
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
            getAllCookOrders: function(id) {
//                alert("service ");
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

//                alert("changeOrderStatus ");
//                alert("orderStatus.orderId " + orderStatus.statusIdOrder);
                return $http.post('/Etbo5ly-Web/rest/updateOrderStatus', orderStatus)
                        .then(
                                function() {
//                                    alert("response");
//                                    alert("response: " + response.length);
//                                    return response.data;
                                },
                                function(errResponse) {
//                                    alert("error response");
                                    console.error('Error while update order status ');
                                    return $q.reject(errResponse);
                                }
                        );
            },
            orderRate: function(order) {

//                alert("orderRate ");
                return $http.post('/Etbo5ly-Web/rest/orderRate', order)
                        .then(
                                function() {
//                                    alert("response");
                                },
                                function(errResponse) {
//                                    alert("error response");
                                    console.error('Error while update order status ');
                                    return $q.reject(errResponse);
                                }
                        );
            },
            setOrder: setOrder,
            getOrder: getOrder
        }

    }]);
