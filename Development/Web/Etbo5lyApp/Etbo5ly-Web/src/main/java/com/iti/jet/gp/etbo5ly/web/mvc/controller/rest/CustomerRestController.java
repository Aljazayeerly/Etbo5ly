/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iti.jet.gp.etbo5ly.web.mvc.controller.rest;

import com.iti.jet.gp.etbo5ly.service.CustomerService;
import com.iti.jet.gp.etbo5ly.service.dto.CustomerDTO;
import com.iti.jet.gp.etbo5ly.service.dto.OrderDTO;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author menna
 */
public class CustomerRestController {

    @Autowired
    CustomerService customerService;

    @RequestMapping(value = "/rest/signIn/{email}/{password}", method = RequestMethod.GET)
    public ResponseEntity<CustomerDTO> signIn(@PathVariable("email") String email, @PathVariable("password") String password) {

        System.out.println("Customer restful service");
        CustomerDTO customerDTO = customerService.signIn(email, password);

        return new ResponseEntity<CustomerDTO>(customerDTO, HttpStatus.OK);

    }
}
