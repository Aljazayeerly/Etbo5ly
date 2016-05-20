/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iti.jet.gp.etbo5ly.service.util;

import com.iti.jet.gp.etbo5ly.model.pojo.MenuItems;
import com.iti.jet.gp.etbo5ly.service.dto.MenuItemDTO;
import java.util.ArrayList;
import java.util.List;
import org.modelmapper.ModelMapper;

/**
 *
 * @author AlJazayeerly
 */
public class DTOConverter {

    static ModelMapper modelMapper;

    static {
        modelMapper = new ModelMapper();
    }

    public static List<MenuItemDTO> menuItemListToMenuItemDTOList(List<MenuItems> menuItems) {
        List<MenuItemDTO> menuItemDTOs = new ArrayList<>();
        MenuItemDTO menuItemDTO = null;
        for (MenuItems mi : menuItems) {
            menuItemDTO = modelMapper.map(mi, MenuItemDTO.class);
            menuItemDTOs.add(menuItemDTO);
        }
        return menuItemDTOs;
    }
}
