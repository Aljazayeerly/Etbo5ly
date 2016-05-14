/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iti.jet.gp.etbo5ly.service.impl;

import com.iti.jet.gp.etbo5ly.model.dao.interfaces.MenuItemsDao;
import com.iti.jet.gp.etbo5ly.model.pojo.MenuItems;
import com.iti.jet.gp.etbo5ly.service.MenuItemsService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.lang.String;
import javax.transaction.Transactional;
/**
 *
 * @author salma
 */
@Service
public class MenuItemsServiceImpl implements MenuItemsService{

    
    @Autowired
    MenuItemsDao menuItemsDao;
    
    @Override
    public List<MenuItems> getAllMealsDetails() {
           return  menuItemsDao.getAll();
    }

    @Override
    @Transactional
    public List<MenuItems> getSpecificMealDetails(String mealName) {
       return menuItemsDao.searchByMealName(mealName);

    }
    
}
