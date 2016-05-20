/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iti.jet.gp.etbo5ly.web.mvc.controller.rest;

import com.iti.jet.gp.etbo5ly.service.dto.MenuItemDTO;
import com.iti.jet.gp.etbo5ly.model.pojo.Cook;
import com.iti.jet.gp.etbo5ly.model.pojo.MenuItems;
import com.iti.jet.gp.etbo5ly.service.MenuItemsService;
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
 * @author salma
 */
@RestController
public class MenuItemsRestController {

    @Autowired
    MenuItemsService menuItemsService;

    @RequestMapping(value = "/test/meals", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<List<MenuItems>> getMeals() {
//        System.out.println("in meals service controller");
        List<MenuItems> meals = menuItemsService.getAllMealsDetails();

        if (meals != null) {
            return new ResponseEntity<List<MenuItems>>(meals, HttpStatus.OK);
        } else {
            return new ResponseEntity<List<MenuItems>>(meals, HttpStatus.NOT_FOUND);
        }
    }

    @RequestMapping(value = "/test/meal", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<List<MenuItems>> getSpecificMeal(@RequestParam(value = "mealName") String name) {
//        System.out.println("in meals service controller");
        List<MenuItems> sprcificMeal = menuItemsService.getSpecificMealDetails(name);
//        System.out.println("sizeeeeeeeeee of specific meal list"+sprcificMeal.size());
        if (sprcificMeal != null) {
            return new ResponseEntity<List<MenuItems>>(sprcificMeal, HttpStatus.OK);
        } else {
            return new ResponseEntity<List<MenuItems>>(sprcificMeal, HttpStatus.NOT_FOUND);
        }
    }

    @RequestMapping(value = "/rest/meal/page", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<List<MenuItemDTO>> getMealsByPage(@RequestParam(value = "page") int page) {
        List<MenuItemDTO> mealsBatch = menuItemsService.getMealsByPage(page);
        System.out.println("number of items retrieved is: "+mealsBatch.size());
        if (mealsBatch != null) {
            return new ResponseEntity<List<MenuItemDTO>>(mealsBatch, HttpStatus.OK);
        } else {
            return new ResponseEntity<List<MenuItemDTO>>(mealsBatch, HttpStatus.NOT_FOUND);
        }
    }
}
