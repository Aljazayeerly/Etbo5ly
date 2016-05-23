/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iti.jet.gp.etbo5ly.service.impl;

import com.iti.jet.gp.etbo5ly.model.dao.interfaces.OrderDao;
import com.iti.jet.gp.etbo5ly.model.pojo.Order;
import com.iti.jet.gp.etbo5ly.model.pojo.OrderDetails;
import com.iti.jet.gp.etbo5ly.service.OrderService;
import com.iti.jet.gp.etbo5ly.service.dto.OrderDTO;
import com.iti.jet.gp.etbo5ly.service.util.DTOConverter;
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
        orderDTOs = DTOConverter.orderListToOrderDTOList(orders);
        System.out.println("Size bta3 al zft : " + orderDTOs.get(0).getOrderDetails().size());
        return orderDTOs;
    }

    @Transactional
    @Override
    public void createOrder(OrderDTO orderDTO) {

        System.out.println("Service");
        Order order = DTOConverter.orderDTOListToOrderList(orderDTO);
        System.out.println("after converting");
        System.out.println("details size" + order.getOrderDetails().size());

        for (OrderDetails orderDetails : order.getOrderDetails()) {
            System.out.println("id :  " + orderDetails.getId().getOrderId());
            orderDetails.getId().setOrderId(null);//getOrder().setOrderId(null);
            System.out.println("id :  " + orderDetails.getId().getOrderId());
        }
        System.out.println("Type : " + order.getType());
        System.out.println("" + order.getOrderDetails().iterator().next().getMenuItems().getNameEn());
        orderDao.create(order);
    }

}
