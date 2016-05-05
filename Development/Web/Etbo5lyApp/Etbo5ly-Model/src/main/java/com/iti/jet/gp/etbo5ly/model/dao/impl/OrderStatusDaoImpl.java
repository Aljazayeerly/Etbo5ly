package com.iti.jet.gp.etbo5ly.model.dao.impl;

import  com.iti.jet.gp.etbo5ly.model.generic.dao.GenericDaoImpl;

import javax.annotation.PostConstruct;

import org.springframework.stereotype.Repository;

import com.iti.jet.gp.etbo5ly.model.pojos.OrderStatus;
import com.iti.jet.gp.etbo5ly.model.dao.interfaces.OrderStatusDao;

@Repository("orderStatusDaoImpl")
public class OrderStatusDaoImpl extends GenericDaoImpl<OrderStatus> implements
OrderStatusDao{
	
	  @PostConstruct
      public void init(){
		  System.out.println("hena fl init");
         super.setEntityClass(OrderStatus.class);
      }



	public OrderStatusDaoImpl() {
		super();
		// TODO Auto-generated constructor stub
	}

	


}
