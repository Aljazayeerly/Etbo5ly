package com.iti.jet.gp.etbo5ly.model.dao.impl;

import com.iti.jet.gp.etbo5ly.model.dao.interfaces.OrderDao;
import com.iti.jet.gp.etbo5ly.model.generic.dao.GenericDaoImpl;
import com.iti.jet.gp.etbo5ly.model.pojo.Order;
import com.iti.jet.gp.etbo5ly.model.pojo.StatusHasOrder;
import com.iti.jet.gp.etbo5ly.model.pojo.StatusHasOrderId;
import com.iti.jet.gp.etbo5ly.model.pojo.User;
import java.util.List;
import javax.annotation.PostConstruct;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate4.HibernateCallback;
import org.springframework.stereotype.Repository;

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

    @Override
    public List<Order> getAllNonRatedOrders(final int customerId) {

//        Session session = getHibernateTemplate().getSessionFactory().getCurrentSession();
//        List<StatusHasOrderId> delivered = session.createCriteria(StatusHasOrder.class, "statusOrder").add(Restrictions.eq("statusOrder.id.statusStatusId", 4)).setProjection(Projections.property("id")).list();
//        System.out.println("size : " + delivered.size());
//        for (int i = 0; i < delivered.size(); i++) {
//            System.out.println("heeereeeeeeeeeeeeee " + delivered.get(i).getOrderOrderId());
//        }
        List<Order> nonRatedOrders = getHibernateTemplate().getSessionFactory().getCurrentSession().getNamedQuery("getNonRated").setParameter("customerId", customerId).list();

        return nonRatedOrders;
    }

}
