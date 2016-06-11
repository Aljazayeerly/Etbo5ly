/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iti.jet.gp.etbo5ly.web.mvc.controller.rest;

import com.iti.jet.gp.etbo5ly.service.CategoryService;
import com.iti.jet.gp.etbo5ly.service.dto.CategoryDTO;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author menna
 */
@RestController
public class CategoryRestController {

    @Autowired
    CategoryService categoryService;

    @RequestMapping(value = "/rest/cookCategories", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<List<CategoryDTO>> getAllCookCategories(@RequestParam(value = "cookId") int id) {

        System.out.println("order restful service");
        List<CategoryDTO> categories = categoryService.getCategoriesOfCookByIdService(id);

        return new ResponseEntity<List<CategoryDTO>>(categories, HttpStatus.OK);

    }

}
