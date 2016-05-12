/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iti.jet.gp.etbo5ly.service.impl;

import com.iti.jet.gp.etbo5ly.model.dao.interfaces.OrderDao;
import com.iti.jet.gp.etbo5ly.model.pojo.Order;
import com.iti.jet.gp.etbo5ly.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;

/**
 *
 * @author menna
 */
public class OrderServiceImpl implements OrderService{

    @Autowired
    OrderDao orderDao;
    
    
    @Override
    public void createorder(Order order) {
       
        orderDao.create(order);
        
    }
    
}
