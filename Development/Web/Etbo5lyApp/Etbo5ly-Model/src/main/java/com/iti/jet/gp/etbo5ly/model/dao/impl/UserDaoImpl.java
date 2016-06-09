package com.iti.jet.gp.etbo5ly.model.dao.impl;

import  com.iti.jet.gp.etbo5ly.model.generic.dao.GenericDaoImpl;

import javax.annotation.PostConstruct;

import org.springframework.stereotype.Repository;

import com.iti.jet.gp.etbo5ly.model.pojo.User;
import com.iti.jet.gp.etbo5ly.model.dao.interfaces.UserDao;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.orm.hibernate4.HibernateCallback;

@Repository("userDaoImpl")
public class UserDaoImpl extends GenericDaoImpl<User> implements
UserDao{
	
	  @PostConstruct
      public void init(){
		  System.out.println("hena fl init");
         super.setEntityClass(User.class);
      }



	public UserDaoImpl() {
		super();
		// TODO Auto-generated constructor stub
	}

    @Override
    public User getUserByEmail(final String email) {
        return (User) getHibernateTemplate().execute( new HibernateCallback<Object>() {

            @Override
            public Object doInHibernate(Session sn) throws HibernateException {
                return sn.getNamedQuery("getUserByEmail").setParameter("email", email).uniqueResult();
            }
        });
    }

    @Override
    public User getUserByEmailAndPassword(final String email, final String password) {
        return (User) getHibernateTemplate().execute( new HibernateCallback<Object>() {

            @Override
            public Object doInHibernate(Session sn) throws HibernateException {
                return sn.getNamedQuery("getUserByEmailAndPassword").setParameter("email", email).setParameter("password", password).uniqueResult();
            }
        });
    }

	


}
