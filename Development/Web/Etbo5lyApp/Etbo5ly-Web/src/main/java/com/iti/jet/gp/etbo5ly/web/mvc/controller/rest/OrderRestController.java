/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iti.jet.gp.etbo5ly.web.mvc.controller.rest;

import com.iti.jet.gp.etbo5ly.model.pojo.Category;
import com.iti.jet.gp.etbo5ly.model.pojo.Order;
import com.iti.jet.gp.etbo5ly.service.OrderService;
import com.iti.jet.gp.etbo5ly.service.dto.OrderDTO;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.util.UriComponentsBuilder;

/**
 *
 * @author menna
 */
@RestController
public class OrderRestController {

    @Autowired
    OrderService orderService;

//    @RequestMapping(value = "/createOrder/", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
//    public ResponseEntity<Order> createOrderService(Order order) {
//
//        //orderService.createorder(order);
//        return new ResponseEntity<Order>(HttpStatus.OK);
//    }

    @RequestMapping(value = "/rest/orders", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<List<OrderDTO>> getAllOrdersByIdService(@RequestParam(value = "customerId") int id) {

        System.out.println("order restful service");
        List<OrderDTO> orders = orderService.getAllOrdersByID(id);

        return new ResponseEntity<List<OrderDTO>>(orders, HttpStatus.OK);
    }

    @RequestMapping(value = "/rest/createOrder", method = RequestMethod.POST , headers = "Accept=application/json")
    public ResponseEntity<Void> createOrderService(@RequestBody OrderDTO orderDTO, UriComponentsBuilder ucBuilder) {

        System.out.println("Creating Orderrrrrrrrrrrrrrrrrrrrrrrrrrrrr " + orderDTO.getDuration());
        System.out.println("Creating Orderrrrrrrrrrrrrrrrrrrrrrrrrrrrr " + orderDTO.getLocation());
//        orderService.createOrder(order);
        HttpHeaders headers = new HttpHeaders();
//        headers.setLocation(ucBuilder.path("/rest/createOrder/{id}").buildAndExpand(order.getOrderId()).toUri());
        return new ResponseEntity<Void>(headers, HttpStatus.CREATED);
    }

}
