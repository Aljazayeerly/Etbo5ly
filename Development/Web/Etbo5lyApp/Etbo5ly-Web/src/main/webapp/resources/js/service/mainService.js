/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

'use strict';

App.service('MainService', function() {

    var orderItems = [];

    return {
        setList: function(addedItems) {
            orderItems = addedItems;

            $.each(orderItems, function(index, item)
            {


            })

        },
        list: function() {

//            alert("Get Items");
            $.each(orderItems, function(index, item)
            {
//
//                alert("Name b2a : " + item.menuItemsNameEn);
//                alert("Quantity b2a : " + item.quantity);
//                alert("Price b2a : " + item.totalPrice);
            })

            return orderItems;
        }
    };
});