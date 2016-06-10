package com.iti.jet.gp.etbo5ly.model.dao.interfaces;

import com.iti.jet.gp.etbo5ly.model.pojo.MenuItems;
import com.iti.jet.gp.etbo5ly.model.generic.dao.GenericDao;

import java.util.List;

public interface MenuItemsDao extends GenericDao<MenuItems> {

   public List<MenuItems> searchByMealName(String mealName);

   public List<MenuItems> getMenuItemsPage(int page);

   public List<MenuItems> getMealsOfCateogries(List<Integer> id);

  public  List<MenuItems> getMealsOfCateogry(int id);

   public List<MenuItems> getMealsOfCook(int cookID);
//    List<MenuItemDTO> getAllMeals();
   public List<MenuItems> getMealsOfSpecificLocation(List<String> address);

  
}
