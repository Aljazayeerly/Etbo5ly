package com.iti.jet.gp.etbo5ly.model.dao.interfaces;

import com.iti.jet.gp.etbo5ly.model.pojo.MenuItems;
import com.iti.jet.gp.etbo5ly.model.generic.dao.GenericDao;
import java.util.List;

public interface MenuItemsDao extends GenericDao<MenuItems>{
public List<MenuItems> searchByMealName(String mealName);
}
