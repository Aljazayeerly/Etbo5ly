/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iti.jet.gp.etbo5ly.service;

import com.iti.jet.gp.etbo5ly.service.dto.MenuItemDTO;
import java.util.List;

/**
 *
 * @author salma
 */
public interface MenuItemsService {

//    List<MenuItemDTO> getAllMealsDetails();
    List<MenuItemDTO> getSpecificMealDetails(String mealName);

    List<MenuItemDTO> getMealsByPage(int page);

    List<MenuItemDTO> getMenuItemsOfCategory(int id);

    List<MenuItemDTO> getMenuItemsOfCategories(List<Integer> categoryList);

    List<MenuItemDTO> getSpecificCookMeals(int id);

    List<MenuItemDTO> getMealsByLocation(List<String> locationList);

    List<MenuItemDTO> getSpecificMealsCookCategoryService(int cookId, int categoryId);
    
    void addMenuItem(MenuItemDTO menuItemDTO);
    
}
