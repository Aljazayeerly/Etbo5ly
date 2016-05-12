package com.iti.jet.gp.etbo5ly.model.dao.impl;

import  com.iti.jet.gp.etbo5ly.model.generic.dao.GenericDaoImpl;

import javax.annotation.PostConstruct;

import org.springframework.stereotype.Repository;

import com.iti.jet.gp.etbo5ly.model.pojo.User;
import com.iti.jet.gp.etbo5ly.model.dao.interfaces.UserDao;

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

	


}
