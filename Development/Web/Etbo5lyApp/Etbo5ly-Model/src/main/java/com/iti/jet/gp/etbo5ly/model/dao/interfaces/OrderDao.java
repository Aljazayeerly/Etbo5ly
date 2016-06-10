package com.iti.jet.gp.etbo5ly.model.dao.interfaces;

import com.iti.jet.gp.etbo5ly.model.pojo.Order;
import com.iti.jet.gp.etbo5ly.model.generic.dao.GenericDao;
import java.util.List;
import static javafx.scene.input.KeyCode.T;

public interface OrderDao extends GenericDao<Order> {

    List<Order> getAllOrdersById(int id);

    List<Order> getAllCookOrdersById(int id);

}
