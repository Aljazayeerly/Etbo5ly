/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iti.jet.gp.etbo5ly.web.mvc.controller.rest;

import com.iti.jet.gp.etbo5ly.model.pojo.Category;
import com.iti.jet.gp.etbo5ly.model.pojo.User;
import com.iti.jet.gp.etbo5ly.service.AdminService;
import com.iti.jet.gp.etbo5ly.service.UserService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.util.UriComponentsBuilder;

/**
 *
 * @author AlJazayeerly
 */
@RestController
public class AdminRestController {

    @Autowired
    AdminService adminService;

    @Autowired
    UserService service;

    @RequestMapping(value = "/rest/get/categories", method = RequestMethod.GET)
    public ResponseEntity<List<Category>> createTitle() {

        System.out.println("Retrieve all Categories");

        List<Category> categories = adminService.getAllCategories();

        if (categories != null && categories.size() != 0) {
            return new ResponseEntity<List<Category>>(categories, HttpStatus.OK);
        } else {
            return new ResponseEntity<List<Category>>(categories, HttpStatus.NOT_FOUND);
        }
    }

    @RequestMapping(value = "/rest/user", method = RequestMethod.GET)
    public ResponseEntity<User> getUser(@RequestParam(value = "email") String email) {

        System.out.println("Retrieve all Categories");

        User user = service.loadUserByEmail(email);

        if (user != null) {
            return new ResponseEntity<User>(user, HttpStatus.OK);
        } else {
            return new ResponseEntity<User>(user, HttpStatus.NOT_FOUND);
        }
    }
}
