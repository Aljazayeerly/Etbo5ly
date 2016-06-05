/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iti.jet.gp.etbo5ly.web.mvc.controller.rest;

//import com.iti.jet.gp.etbo5ly.service.dto.CategoryDTO;
import com.iti.jet.gp.etbo5ly.service.dto.MenuItemDTO;
import com.iti.jet.gp.etbo5ly.model.pojo.MenuItems;
import com.iti.jet.gp.etbo5ly.service.MenuItemsService;
import com.iti.jet.gp.etbo5ly.service.dto.CategoryDTO;
import com.iti.jet.gp.etbo5ly.service.dto.SearchDTO;
import com.sun.javafx.scene.control.skin.VirtualFlow;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author salma
 */
@RestController
@RequestMapping(value = "/rest")
public class MenuItemsRestController {

    @Autowired
    MenuItemsService menuItemsService;

//    @RequestMapping(value = "/meals", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
//    public ResponseEntity<List<MenuItemDTO>> getMeals() {
////        System.out.println("in meals service controller");
//        List<MenuItemDTO> meals = menuItemsService.getAllMealsDetails();
//
//        if (meals != null) {
//            return new ResponseEntity<List<MenuItemDTO>>(meals, HttpStatus.OK);
//        } else {
//            return new ResponseEntity<List<MenuItemDTO>>(meals, HttpStatus.NOT_FOUND);
//        }
//    }

    @RequestMapping(value = "/meal", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<List<MenuItemDTO>> getSpecificMeal(@RequestParam(value = "mealName") String name) {

        List<MenuItemDTO> sprcificMeal = menuItemsService.getSpecificMealDetails(name);
        System.out.println("lengthhhhhhhhhh"+sprcificMeal.size());
        if (sprcificMeal != null) {
            return new ResponseEntity<List<MenuItemDTO>>(sprcificMeal, HttpStatus.OK);
        } else {
            return new ResponseEntity<List<MenuItemDTO>>(sprcificMeal, HttpStatus.NOT_FOUND);
        }
    }

    
    @RequestMapping(value = "/page", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<List<MenuItemDTO>> getMealsByPage(@RequestParam(value = "page") int page) {
        List<MenuItemDTO> mealsBatch = menuItemsService.getMealsByPage(page);
        System.out.println("number of items retrieved is: " + mealsBatch.size());
        if (mealsBatch != null) {
            return new ResponseEntity<List<MenuItemDTO>>(mealsBatch, HttpStatus.OK);
        } else {
            return new ResponseEntity<List<MenuItemDTO>>(mealsBatch, HttpStatus.NOT_FOUND);
        }
    }

    @RequestMapping(value = "/category", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<List<MenuItemDTO>> getSpecificCategoryMeals(@RequestParam(value = "id") int id) {

        List<MenuItemDTO> specificMeal = menuItemsService.getMenuItemsOfCategory(id);
        System.out.println("categoryyyy idddddddd" + id);
        if (specificMeal != null) {
            return new ResponseEntity<List<MenuItemDTO>>(specificMeal, HttpStatus.OK);
        } else {
            return new ResponseEntity<List<MenuItemDTO>>(specificMeal, HttpStatus.NOT_FOUND);
        }
    }

    
    
     @RequestMapping(value = "/cookMeals", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<List<MenuItemDTO>> getSpecificCookMeals(@RequestParam(value = "id") int id) {
        
        List<MenuItemDTO> specificMeal = menuItemsService.getSpecificCookMeals(id);
        System.out.println("cooooook idddddddd" + id);
        if (specificMeal != null) {
            return new ResponseEntity<List<MenuItemDTO>>(specificMeal, HttpStatus.OK);
        } else {
            return new ResponseEntity<List<MenuItemDTO>>(specificMeal, HttpStatus.NOT_FOUND);
        }
    }
    
//    @RequestMapping(value = "/search", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE,consumes =MediaType.APPLICATION_JSON_VALUE )
//    public ResponseEntity<List<List<MenuItemDTO>>> getMealsOfCheckedCategories(@RequestBody SearchDTO searchDTO) {
//        List<MenuItemDTO> specificMeal = null;
//         List<List<MenuItemDTO>> result = new ArrayList<>();
//        for (int i = 0; i < searchDTO.getSelectedCategories().size(); i++) {
//            specificMeal=menuItemsService.getMenuItemsOfCategory(searchDTO.getSelectedCategories().get(i).getCategoryId());
//           result.add(specificMeal);
//
//        }
// 
//        if (specificMeal != null) {
//            return new ResponseEntity<>(result, HttpStatus.OK);
//        } else {
//            return new ResponseEntity<>(result, HttpStatus.NOT_FOUND);
//        }
//    }
    
    @RequestMapping(value = "/search", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE,consumes =MediaType.APPLICATION_JSON_VALUE )
    public ResponseEntity<List<MenuItemDTO>> getMealsOfCheckedCategories(@RequestBody SearchDTO searchDTO) {
        List<MenuItemDTO> result = null;
            result=menuItemsService.getMenuItemsOfCategories(searchDTO.getSelectedCategories());
 
        if (result != null) {
            return new ResponseEntity<>(result, HttpStatus.OK);
        } else {
            return new ResponseEntity<>(result, HttpStatus.NOT_FOUND);
        }
    }
    
    
    
    

}
