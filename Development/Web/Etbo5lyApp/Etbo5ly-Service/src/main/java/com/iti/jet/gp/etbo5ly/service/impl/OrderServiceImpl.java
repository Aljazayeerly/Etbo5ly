/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iti.jet.gp.etbo5ly.service.impl;

import com.iti.jet.gp.etbo5ly.model.dao.interfaces.OrderDao;
import com.iti.jet.gp.etbo5ly.model.dao.interfaces.OrderDetailsDao;
import com.iti.jet.gp.etbo5ly.model.dao.interfaces.StatusHasOrderDao;
import com.iti.jet.gp.etbo5ly.model.pojo.MenuItems;
import com.iti.jet.gp.etbo5ly.model.pojo.Order;
import com.iti.jet.gp.etbo5ly.model.pojo.OrderDetails;
import com.iti.jet.gp.etbo5ly.model.pojo.OrderDetailsId;
import com.iti.jet.gp.etbo5ly.model.pojo.StatusHasOrder;
import com.iti.jet.gp.etbo5ly.model.pojo.StatusHasOrderId;
import com.iti.jet.gp.etbo5ly.service.OrderService;
import com.iti.jet.gp.etbo5ly.service.dto.OrderDTO;
import com.iti.jet.gp.etbo5ly.service.util.DTOConverter;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
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

    @Autowired
    OrderDetailsDao orderDetailsDao;

    @Autowired
    StatusHasOrderDao statusHasOrderDao;

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
        java.util.Date date = new java.util.Date();

        order.setOrderTime(new Timestamp(date.getTime()));
        orderDao.create(order);

        for (OrderDetails orderDetails : order.getOrderDetails()) {
            Integer menuItemID = orderDetails.getId().getMenuItemId();
            orderDetails.setId(new OrderDetailsId(order.getOrderId(), menuItemID));
            orderDetailsDao.create(orderDetails);
        }

        statusHasOrderDao.create(new StatusHasOrder(new StatusHasOrderId(1, order.getOrderId()), null, null, new Date()));

    }

}
