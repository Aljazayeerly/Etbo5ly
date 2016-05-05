package com.iti.jet.gp.etbo5ly.model.dao.impl;

import  com.iti.jet.gp.etbo5ly.model.generic.dao.GenericDaoImpl;

import javax.annotation.PostConstruct;

import org.springframework.stereotype.Repository;

import com.iti.jet.gp.etbo5ly.model.pojos.Customer;
import com.iti.jet.gp.etbo5ly.model.dao.interfaces.CustomerDao;

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


	

}
