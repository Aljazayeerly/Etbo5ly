/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iti.jet.gp.etbo5ly.web.mvc.controller.rest;

import com.iti.jet.gp.etbo5ly.model.pojo.Order;
import com.iti.jet.gp.etbo5ly.model.pojo.StatusHasOrder;
import com.iti.jet.gp.etbo5ly.model.pojo.User;
import com.iti.jet.gp.etbo5ly.service.OrderService;
import com.iti.jet.gp.etbo5ly.service.dto.OrderDTO;
import com.iti.jet.gp.etbo5ly.service.dto.StatusHasOrderDTO;
import com.iti.jet.gp.etbo5ly.web.util.LoggedInUserChecker;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
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
    @Autowired
    LoggedInUserChecker loggedInUserChecker;

    @RequestMapping(value = "/rest/orders", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<List<OrderDTO>> getAllOrdersByIdService(@RequestParam(value = "customerId") int id) {

        User user = loggedInUserChecker.getLoggedUser();

        List<OrderDTO> orders = orderService.getAllOrdersByID(user.getId());

        return new ResponseEntity<List<OrderDTO>>(orders, HttpStatus.OK);

    }

    @RequestMapping(value = "/rest/createOrder", method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<Void> createOrderService(@RequestBody OrderDTO orderDTO, UriComponentsBuilder ucBuilder) {

        User user = loggedInUserChecker.getLoggedUser();
        orderDTO.setUserByCustomerId(user.getId());
        orderService.createOrder(orderDTO);
        HttpHeaders headers = new HttpHeaders();
        return new ResponseEntity<Void>(headers, HttpStatus.CREATED);

    }

    @RequestMapping(value = "/rest/updateOrderStatus", method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<Void> updateOrderStatus(@RequestBody StatusHasOrderDTO statusHasOrderDTO, UriComponentsBuilder ucBuilder) {

        orderService.updateOrderStatus(statusHasOrderDTO);
        HttpHeaders headers = new HttpHeaders();
        return new ResponseEntity<Void>(headers, HttpStatus.CREATED);
    }

    @RequestMapping(value = "/rest/orderRate", method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<Void> orderRate(@RequestBody OrderDTO orderDTO, UriComponentsBuilder ucBuilder) {

        orderService.orderRate(orderDTO);
        HttpHeaders headers = new HttpHeaders();
        return new ResponseEntity<Void>(headers, HttpStatus.CREATED);
    }

    @RequestMapping(value = "/rest/cookOrders", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<List<OrderDTO>> getAllCookOrders(@RequestParam(value = "cookId") int id) {

        User user = loggedInUserChecker.getLoggedUser();

        List<OrderDTO> orders = orderService.getAllCookOrders(user.getId());

        return new ResponseEntity<List<OrderDTO>>(orders, HttpStatus.OK);

    }

    @RequestMapping(value = "/rest/nonRatedOrders", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<List<OrderDTO>> getAllNonRatedOrders(@RequestParam(value = "customerId") int customerId) {

        User user = loggedInUserChecker.getLoggedUser();
        List<OrderDTO> orders = orderService.getAllNonRatedOrdersService(user.getId());

        return new ResponseEntity<List<OrderDTO>>(orders, HttpStatus.OK);

    }
}
