package com.iti.jet.gp.etbo5ly.model.dao.impl;

import com.iti.jet.gp.etbo5ly.model.dao.interfaces.CustomerDao;
import com.iti.jet.gp.etbo5ly.model.generic.dao.GenericDaoImpl;
import com.iti.jet.gp.etbo5ly.model.pojo.Customer;
import javax.annotation.PostConstruct;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

@Repository("customerDaoImpl")
public class CustomerDaoImpl extends GenericDaoImpl<Customer> implements
        CustomerDao {

    @PostConstruct
    public void init() {
        System.out.println("hena fl init");
        super.setEntityClass(Customer.class);
    }

    public CustomerDaoImpl() {
        super();
    }

    public Customer signIn(String email, String password) {

        Session session = getHibernateTemplate().getSessionFactory().getCurrentSession();
        Customer customer = (Customer) getHibernateTemplate().getSessionFactory().getCurrentSession().createCriteria(Customer.class).add(Restrictions.and(Restrictions.eq("email", email),Restrictions.eq("password", password))).uniqueResult();

        return customer;
    }

}
