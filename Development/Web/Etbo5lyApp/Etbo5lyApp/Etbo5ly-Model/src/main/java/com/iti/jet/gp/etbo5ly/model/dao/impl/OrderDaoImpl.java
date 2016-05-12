package com.iti.jet.gp.etbo5ly.model.dao.impl;

import  com.iti.jet.gp.etbo5ly.model.generic.dao.GenericDaoImpl;

import javax.annotation.PostConstruct;

import org.springframework.stereotype.Repository;

import com.iti.jet.gp.etbo5ly.model.pojo.Order;
import com.iti.jet.gp.etbo5ly.model.dao.interfaces.OrderDao;

@Repository("orderDaoImpl")
public class OrderDaoImpl extends GenericDaoImpl<Order> implements
OrderDao{
	
	  @PostConstruct
      public void init(){
		  System.out.println("hena fl init");
         super.setEntityClass(Order.class);
      }


	public OrderDaoImpl() {
		super();
		// TODO Auto-generated constructor stub
	}

	


}
