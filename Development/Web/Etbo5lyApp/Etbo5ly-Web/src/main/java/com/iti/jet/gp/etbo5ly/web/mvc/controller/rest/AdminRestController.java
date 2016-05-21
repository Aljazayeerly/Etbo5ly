/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iti.jet.gp.etbo5ly.web.mvc.controller.rest;

import com.iti.jet.gp.etbo5ly.model.pojo.Category;
import com.iti.jet.gp.etbo5ly.service.AdminService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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

    // add new Category
    @RequestMapping(value = "/rest/create/category", method = RequestMethod.POST)
    public ResponseEntity<Void> createTitle(@RequestBody Category category, UriComponentsBuilder ucBuilder) {

        System.out.println("Creating category " + category.getNameEn());

        adminService.addCategory(category);

        HttpHeaders headers = new HttpHeaders();
        return new ResponseEntity<Void>(headers, HttpStatus.CREATED);
    }

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
}
