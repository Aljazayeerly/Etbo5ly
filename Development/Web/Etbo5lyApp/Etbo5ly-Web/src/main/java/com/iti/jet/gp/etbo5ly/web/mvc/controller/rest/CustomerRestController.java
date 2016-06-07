/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iti.jet.gp.etbo5ly.web.mvc.controller.rest;

import com.iti.jet.gp.etbo5ly.model.pojo.Customer;
import com.iti.jet.gp.etbo5ly.service.CustomerService;
import com.iti.jet.gp.etbo5ly.service.dto.CustomerDTO;
import com.iti.jet.gp.etbo5ly.service.dto.OrderDTO;
import java.util.List;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author menna
 */
@RestController
@RequestMapping(value="/rest/customer")
public class CustomerRestController {

    @Autowired(required = true)
    CustomerService customerService;

    @RequestMapping(value = "/signIn/{email}/{password}", method = RequestMethod.GET)
    public ResponseEntity<CustomerDTO> signIn(@PathVariable("email") String email, @PathVariable("password") String password) {

        System.out.println("Customer restful service");
        CustomerDTO customerDTO = customerService.signIn(email, password);

        return new ResponseEntity<CustomerDTO>(customerDTO, HttpStatus.OK);

    }

    @RequestMapping(value = "/signUp", method = RequestMethod.POST,consumes = MediaType.APPLICATION_JSON_VALUE,produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Boolean> signUp( @RequestBody CustomerDTO customer) {
        System.out.println("inside signUp restController");
        System.out.println("customer jason is " + customer);
        boolean userAdded = customerService.signUp(customer);
        return new ResponseEntity<Boolean>(userAdded,HttpStatus.OK);
    }

}
