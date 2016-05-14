/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iti.jet.gp.etbo5ly.web.mvc.controller.rest;

import com.iti.jet.gp.etbo5ly.model.pojo.Category;
import com.iti.jet.gp.etbo5ly.model.pojo.Order;
import com.iti.jet.gp.etbo5ly.service.OrderService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author menna
 */
@RestController
public class OrderRestController {

    @Autowired
    OrderService orderService;

    @RequestMapping(value = "/createOrder/", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Order> createOrderService(Order order) {

        //orderService.createorder(order);

        return new ResponseEntity<Order>(HttpStatus.OK);
    }
    
    @RequestMapping(value = "/rest/orders", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<List<Order>> getAllOrders(Order order) {

        List<Order> orders=orderService.getAllOrders();

        return new ResponseEntity<List<Order>>(orders,HttpStatus.OK);
    }
}
