/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iti.jet.gp.etbo5ly.service.impl;

import com.iti.jet.gp.etbo5ly.model.dao.interfaces.MenuItemsDao;
import com.iti.jet.gp.etbo5ly.service.dto.MenuItemDTO;
import com.iti.jet.gp.etbo5ly.model.pojo.MenuItems;
import com.iti.jet.gp.etbo5ly.service.MenuItemsService;
import com.iti.jet.gp.etbo5ly.service.util.DTOConverter;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import javax.transaction.Transactional;
import org.modelmapper.ModelMapper;

/**
 *
 * @author salma
 */
@Service
public class MenuItemsServiceImpl implements MenuItemsService {

    @Autowired
    MenuItemsDao menuItemsDao;

//    @Override
//    public List<MenuItemDTO> getAllMealsDetails() {
//        return menuItemsDao.getAllMeals();
//    }

    @Override
    @Transactional
    public List<MenuItems> getSpecificMealDetails(String mealName) {
        return menuItemsDao.searchByMealName(mealName);

    }

    @Override
    @Transactional
    public List<MenuItemDTO> getMealsByPage(int page) {

        List<MenuItems> menuItems = menuItemsDao.getMenuItemsPage(page);
        return DTOConverter.menuItemListToMenuItemDTOList(menuItems);

    }

    @Override
    @Transactional
    public List<MenuItemDTO> getMenuItemsOfCategory(int categoryID) {
     
        
        
         List<MenuItemDTO> itemDTOs=new ArrayList<MenuItemDTO>();
        List<MenuItems> menuItems=menuItemsDao.getMealsOfCateogry(categoryID);
        ModelMapper modelMapper=new ModelMapper();
        for(MenuItems item:menuItems){
            MenuItemDTO DTO=modelMapper.map(item, MenuItemDTO.class);
            itemDTOs.add(DTO);
        }
        return itemDTOs;
        
    }

   

}
