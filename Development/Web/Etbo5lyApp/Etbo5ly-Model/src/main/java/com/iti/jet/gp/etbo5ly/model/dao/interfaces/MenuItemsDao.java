package com.iti.jet.gp.etbo5ly.model.dao.interfaces;

import com.iti.jet.gp.etbo5ly.model.pojo.MenuItems;
import com.iti.jet.gp.etbo5ly.model.generic.dao.GenericDao;
//import com.iti.jet.gp.etbo5ly.service.dto.MenuItemDTO;
import java.util.List;

public interface MenuItemsDao extends GenericDao<MenuItems> {

    List<MenuItems> searchByMealName(String mealName);

    List<MenuItems> getMenuItemsPage(int page);

    List<MenuItems> getMealsOfCateogry(int categoryID);

//    List<MenuItemDTO> getAllMeals();

}
