/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iti.jet.gp.etbo5ly.service;

import com.iti.jet.gp.etbo5ly.model.pojo.Order;
import com.iti.jet.gp.etbo5ly.service.dto.OrderDTO;
import com.iti.jet.gp.etbo5ly.service.dto.StatusHasOrderDTO;
import java.util.List;

/**
 *
 * @author menna
 */
public interface OrderService {

    List<Order> getAllOrders();

    List<OrderDTO> getAllOrdersByID(int id);

    void createOrder(OrderDTO orderDTO);

    void updateOrderStatus(StatusHasOrderDTO statusHasOrderDTO);

    void orderRate(OrderDTO orderDTO);

    List<OrderDTO> getAllCookOrders(int id);

    List<OrderDTO> getAllNonRatedOrdersService(int customerId);
}
