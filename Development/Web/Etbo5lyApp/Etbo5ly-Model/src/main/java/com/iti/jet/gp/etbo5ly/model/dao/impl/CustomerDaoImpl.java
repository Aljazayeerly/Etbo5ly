package com.iti.jet.gp.etbo5ly.model.dao.impl;

import  com.iti.jet.gp.etbo5ly.model.generic.dao.GenericDaoImpl;

import javax.annotation.PostConstruct;

import org.springframework.stereotype.Repository;

import com.iti.jet.gp.etbo5ly.model.pojo.Customer;
import com.iti.jet.gp.etbo5ly.model.dao.interfaces.CustomerDao;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

@Repository("customerDaoImpl")
public class CustomerDaoImpl extends GenericDaoImpl<Customer> implements
		CustomerDao {

	  @PostConstruct
      public void init(){
		  System.out.println("hena fl init");
         super.setEntityClass(Customer.class);
      }
	
	public CustomerDaoImpl() {
		super();
	}

//<<<<<<< HEAD
//        Session session = getHibernateTemplate().getSessionFactory().getCurrentSession();
//        Customer customer = (Customer) getHibernateTemplate().getSessionFactory().getCurrentSession().createCriteria(Customer.class).add(Restrictions.and(Restrictions.eq("email", email), Restrictions.eq("password", password))).uniqueResult();
//=======
//>>>>>>> fd4cfc820b3887b361f056a20be3e86493754ad3

	

    @Override
    public Customer signUp(Customer customer) {
        System.out.println("sign up Dao");
        boolean userAdded = false;
        Session session = getHibernateTemplate().getSessionFactory().getCurrentSession();
        //Customer oldCustomer = (Customer) getHibernateTemplate().getSessionFactory().getCurrentSession().createCriteria(Customer.class).add(Restrictions.eq("email", customer.getEmail())).uniqueResult();
//        if (oldCustomer == null) {
           session.persist(customer);
//            userAdded = true;
//        } else {
//            System.out.println("User Already Exist ");
//            userAdded = false;
//        }
        return customer;
    }

    @Override
    public Customer signIn(String email, String password) {
        Session session = getHibernateTemplate().getSessionFactory().getCurrentSession();
        Customer customer = (Customer) getHibernateTemplate().getSessionFactory().getCurrentSession().createCriteria(Customer.class).add(Restrictions.and(Restrictions.eq("email", email), Restrictions.eq("password", password))).uniqueResult();
        return customer;
    }

    @Override
    public Customer CheckEmail(String email) {
       // System.out.println("email is " + email);
        Session session=getHibernateTemplate().getSessionFactory().getCurrentSession();
        Customer customer=(Customer) session.createCriteria(Customer.class).add(Restrictions.eq("email", email)).uniqueResult();
        //Customer customer=(Customer) session.get(Customer.class,email);
        return customer;
    }

}
