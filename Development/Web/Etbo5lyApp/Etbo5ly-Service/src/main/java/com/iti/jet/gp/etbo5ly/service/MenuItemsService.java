/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iti.jet.gp.etbo5ly.service;

import com.iti.jet.gp.etbo5ly.service.dto.MenuItemDTO;
import com.iti.jet.gp.etbo5ly.model.pojo.MenuItems;
import java.util.List;

/**
 *
 * @author salma
 */
public interface MenuItemsService {

//    List<MenuItemDTO> getAllMealsDetails();

    List<MenuItems> getSpecificMealDetails(String mealName);

    List<MenuItemDTO> getMealsByPage(int page);

    List<MenuItemDTO> getMenuItemsOfCategory(int id);
}
