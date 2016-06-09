package com.iti.jet.gp.etbo5ly.model.dao.interfaces;

import com.iti.jet.gp.etbo5ly.model.pojo.MenuItems;
import com.iti.jet.gp.etbo5ly.model.generic.dao.GenericDao;

import java.util.List;

public interface MenuItemsDao extends GenericDao<MenuItems> {

    List<MenuItems> searchByMealName(String mealName);

    List<MenuItems> getMenuItemsPage(int page);

    List<MenuItems> getMealsOfCateogries(List<Integer> id);

    List<MenuItems> getMealsOfCateogry(int id);

    List<MenuItems> getMealsOfCook(int cookID);
//    List<MenuItemDTO> getAllMeals();
    List<MenuItems> getMealsOfSpecificLocation(List<String> address);
}
