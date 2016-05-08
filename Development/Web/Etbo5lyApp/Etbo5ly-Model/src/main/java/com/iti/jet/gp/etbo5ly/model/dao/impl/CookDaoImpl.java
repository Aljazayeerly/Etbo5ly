 package com.iti.jet.gp.etbo5ly.model.dao.impl;

import  com.iti.jet.gp.etbo5ly.model.generic.dao.GenericDaoImpl;

import javax.annotation.PostConstruct;

import org.springframework.stereotype.Repository;

import com.iti.jet.gp.etbo5ly.model.pojo.Cook;
import com.iti.jet.gp.etbo5ly.model.dao.interfaces.CookDao;

@Repository("cookDaoImpl")
public class CookDaoImpl extends GenericDaoImpl<Cook> implements
CookDao{
	
	  @PostConstruct
      public void init(){
		  System.out.println("hena fl init");
         super.setEntityClass(Cook.class);
      }
	


	public CookDaoImpl() {
		super();
		// TODO Auto-generated constructor stub
	}


}
