package com.iti.jet.gp.etbo5ly.model.dao.impl;

import  com.iti.jet.gp.etbo5ly.model.generic.dao.GenericDaoImpl;

import javax.annotation.PostConstruct;

import org.springframework.stereotype.Repository;

import com.iti.jet.gp.etbo5ly.model.pojo.MenuItems;
import com.iti.jet.gp.etbo5ly.model.dao.interfaces.MenuItemsDao;

@Repository("menuItemsDaoImpl")
public class MenuItemsDaoImpl extends GenericDaoImpl<MenuItems> implements
MenuItemsDao{
	
	
	  @PostConstruct
      public void init(){
		  System.out.println("hena fl init");
         super.setEntityClass(MenuItems.class);
      }
	  


	public MenuItemsDaoImpl() {
		super();
		// TODO Auto-generated constructor stub
	}

	



}
