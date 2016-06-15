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
    public List<MenuItemDTO> getSpecificMealDetails(String mealName) {
        List<MenuItems> menuItems = menuItemsDao.searchByMealName(mealName);
        return DTOConverter.menuItemListToMenuItemDTOList(menuItems);
    }

    @Override
    @Transactional
    public List<MenuItemDTO> getMealsByPage(int page) {

        List<MenuItems> menuItems = menuItemsDao.getMenuItemsPage(page);
        return DTOConverter.menuItemListToMenuItemDTOList(menuItems);

    }

    @Override
    @Transactional
    public List<MenuItemDTO> getMenuItemsOfCategories(List<Integer> categoryList) {

        List<MenuItemDTO> itemDTOs = new ArrayList<MenuItemDTO>();
        List<MenuItems> menuItems = menuItemsDao.getMealsOfCateogries(categoryList);
        ModelMapper modelMapper = new ModelMapper();
        for (MenuItems item : menuItems) {
            MenuItemDTO DTO = modelMapper.map(item, MenuItemDTO.class);
            itemDTOs.add(DTO);
        }
        return itemDTOs;

    }

    @Override
    @Transactional
    public List<MenuItemDTO> getMenuItemsOfCategory(int categoryId) {

        List<MenuItemDTO> itemDTOs = new ArrayList<MenuItemDTO>();
        List<MenuItems> menuItems = menuItemsDao.getMealsOfCateogry(categoryId);
        ModelMapper modelMapper = new ModelMapper();
        for (MenuItems item : menuItems) {
            MenuItemDTO DTO = modelMapper.map(item, MenuItemDTO.class);
            itemDTOs.add(DTO);
        }
        return itemDTOs;

    }

    @Override
    @Transactional
    public List<MenuItemDTO> getSpecificCookMeals(int id) {
        List<MenuItemDTO> itemDTOs = new ArrayList<MenuItemDTO>();
        List<MenuItems> menuItems = menuItemsDao.getMealsOfCook(id);
        ModelMapper modelMapper = new ModelMapper();
        for (MenuItems item : menuItems) {
            MenuItemDTO DTO = modelMapper.map(item, MenuItemDTO.class);
            itemDTOs.add(DTO);
        }
        return itemDTOs;
    }

    @Override
    @Transactional
    public List<MenuItemDTO> getMealsByLocation(List<Integer> locationList) {
        List<MenuItemDTO> itemDTOs = new ArrayList<MenuItemDTO>();
        List<MenuItems> menuItems = menuItemsDao.getMealsOfSpecificLocation(locationList);
        ModelMapper modelMapper = new ModelMapper();
        for (MenuItems item : menuItems) {
            MenuItemDTO DTO = modelMapper.map(item, MenuItemDTO.class);
            itemDTOs.add(DTO);
        }
        return itemDTOs;
    }

    @Override
    @Transactional
    public List<MenuItemDTO> getSpecificMealsCookCategoryService(int cookId, int categoryId) {

        List<MenuItemDTO> itemDTOs = new ArrayList<MenuItemDTO>();
        List<MenuItems> menuItems = menuItemsDao.getSpecificMealsCookCategory(cookId, categoryId);
        ModelMapper modelMapper = new ModelMapper();
        for (MenuItems item : menuItems) {
            MenuItemDTO DTO = modelMapper.map(item, MenuItemDTO.class);
            itemDTOs.add(DTO);
        }
        return itemDTOs;
    }

    @Override
    @Transactional
    public void addMenuItem(MenuItemDTO menuItemDTO) {
        ModelMapper modelMapper = new ModelMapper();
        MenuItems item = modelMapper.map(menuItemDTO, MenuItems.class);
        item.setItemRate((short) 0);
        menuItemsDao.create(item);
    }

}
