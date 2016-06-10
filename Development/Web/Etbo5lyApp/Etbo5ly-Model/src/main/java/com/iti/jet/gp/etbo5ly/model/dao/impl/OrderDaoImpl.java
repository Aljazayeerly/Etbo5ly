package com.iti.jet.gp.etbo5ly.model.dao.impl;

import com.iti.jet.gp.etbo5ly.model.generic.dao.GenericDaoImpl;

import javax.annotation.PostConstruct;

import org.springframework.stereotype.Repository;

import com.iti.jet.gp.etbo5ly.model.pojo.Order;
import com.iti.jet.gp.etbo5ly.model.dao.interfaces.OrderDao;
import java.util.List;
import org.hibernate.criterion.Restrictions;

@Repository("orderDaoImpl")
public class OrderDaoImpl extends GenericDaoImpl<Order> implements
        OrderDao {

    @PostConstruct
    public void init() {
        System.out.println("hena fl init");
        super.setEntityClass(Order.class);
    }

    public OrderDaoImpl() {
        super();
        // TODO Auto-generated constructor stub
    }

    @Override
    public List<Order> getAllOrdersById(int id) {

        List<Order> ui = getHibernateTemplate().getSessionFactory().getCurrentSession().createCriteria(Order.class, "o").createAlias("o.userByCustomerId", "c").add(Restrictions.eq("c.id", id)).list();
        System.out.println("size : " + ui.size());

        return ui;
    }

    @Override
    public List<Order> getAllCookOrdersById(int id) {

        List<Order> ui = getHibernateTemplate().getSessionFactory().getCurrentSession().createCriteria(Order.class, "o").createAlias("o.userByCookId", "u").add(Restrictions.eq("u.id", id)).list();

        System.out.println("getAllCookOrdersById");
        System.out.println("id : " + id + " , size : " + ui.size());

        return ui;

    }

}
