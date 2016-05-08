package com.iti.jet.gp.etbo5ly.model.dao.impl;

import  com.iti.jet.gp.etbo5ly.model.generic.dao.GenericDaoImpl;

import javax.annotation.PostConstruct;

import org.springframework.stereotype.Repository;

import com.iti.jet.gp.etbo5ly.model.pojo.StatusHasOrder;
import com.iti.jet.gp.etbo5ly.model.dao.interfaces.StatusHasOrderDao;

@Repository("statusHasOrderDaoImpl")
public class StatusHasOrderDaoImpl extends GenericDaoImpl<StatusHasOrder> implements
StatusHasOrderDao{
	
	  @PostConstruct
      public void init(){
		  System.out.println("hena fl init");
         super.setEntityClass(StatusHasOrder.class);
      }



	public StatusHasOrderDaoImpl() {
		super();
		// TODO Auto-generated constructor stub
	}

	



}
