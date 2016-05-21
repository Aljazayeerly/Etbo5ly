/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iti.jet.gp.etbo5ly.service.impl;

import com.iti.jet.gp.etbo5ly.model.dao.interfaces.OrderDao;
import com.iti.jet.gp.etbo5ly.model.pojo.Order;
import com.iti.jet.gp.etbo5ly.service.OrderService;
import com.iti.jet.gp.etbo5ly.service.dto.OrderDTO;
import java.util.ArrayList;
import java.util.List;
import javax.transaction.Transactional;
import org.modelmapper.ModelMapper;
import org.modelmapper.PropertyMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author menna
 */
@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    OrderDao orderDao;

    @Transactional
    @Override
    public List<Order> getAllOrders() {
        System.out.println("seervice layer");
        List<Order> orders = orderDao.getAll();
        System.out.println("cooks size : " + orders.size());
        return orders;
    }

    @Transactional
    @Override
    public List<OrderDTO> getAllOrdersByID(int id) {

        List<OrderDTO> orderDTOs = new ArrayList<OrderDTO>();
        List<Order> orders = orderDao.getAllOrdersById(id);
        ModelMapper modelMapper = new ModelMapper();
        for (Order order : orders) {
            
//            PropertyMap<Order, OrderDTO> orderMap = new PropertyMap<Order, OrderDTO>() {
//        protected void configure() {
//            map().setCityName(order.getRegion().getCity().getCityName());
//            map(order.Region.City.getCityName, orderDTO.cityName);
//        }
//    };
            OrderDTO orderDTO = modelMapper.map(order, OrderDTO.class);
            orderDTOs.add(orderDTO);
        }
        return orderDTOs;
    }
    
    
    @Transactional
    @Override
    public void createOrder(Order order) {

        orderDao.create(order);
    }
    

}
