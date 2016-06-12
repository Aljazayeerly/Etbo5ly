/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iti.jet.gp.etbo5ly.service.util;

import com.iti.jet.gp.etbo5ly.model.pojo.Cook;
import com.iti.jet.gp.etbo5ly.model.pojo.Document;
import com.iti.jet.gp.etbo5ly.model.pojo.MenuItems;
import com.iti.jet.gp.etbo5ly.model.pojo.Order;
import com.iti.jet.gp.etbo5ly.service.dto.CookDTO;
import com.iti.jet.gp.etbo5ly.service.dto.DocumentDTO;
import com.iti.jet.gp.etbo5ly.service.dto.MenuItemDTO;
import com.iti.jet.gp.etbo5ly.service.dto.OrderDTO;
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

    public static List<CookDTO> cookListToCookDTOList(List<Cook> cooks) {
        List<CookDTO> cookDTOs = new ArrayList<>();
        CookDTO cookDTO = null;
        for (Cook c : cooks) {
            cookDTO = modelMapper.map(c, CookDTO.class);
            cookDTOs.add(cookDTO);
        }
        return cookDTOs;
    }

    public static List<OrderDTO> orderListToOrderDTOList(List<Order> orders) {
        List<OrderDTO> orderDTOs = new ArrayList<>();
        OrderDTO orderDTO = null;
        for (Order o : orders) {
            orderDTO = modelMapper.map(o, OrderDTO.class);
            orderDTOs.add(orderDTO);
        }
        return orderDTOs;
    }

    public static Order orderDTOListToOrderList(OrderDTO orderDTO) {

        Order order = null;

        order = modelMapper.map(orderDTO, Order.class);
        order.setOrderId(null);
        return order;
    }

    public static Cook cookDTOTOCook(CookDTO cook){
        Cook cookDTO=null;
        cookDTO=modelMapper.map(cook, Cook.class);
        return cookDTO;
    }
    public static Document documentDTOTODocument(DocumentDTO documentDTO){
         Document document=null;
        document=modelMapper.map(documentDTO, Document.class);
        return document;
    }
}
