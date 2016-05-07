package com.iti.jet.gp.etbo5ly.model.dao.impl;

import  com.iti.jet.gp.etbo5ly.model.generic.dao.GenericDaoImpl;

import javax.annotation.PostConstruct;

import org.springframework.stereotype.Repository;

import com.iti.jet.gp.etbo5ly.model.pojo.Role;
import com.iti.jet.gp.etbo5ly.model.dao.interfaces.RoleDao;

@Repository("roleDaoImpl")
public class RoleDaoImpl extends GenericDaoImpl<Role> implements
RoleDao{
	
	  @PostConstruct
      public void init(){
		  System.out.println("hena fl init");
         super.setEntityClass(Role.class);
      }


	public RoleDaoImpl() {
		super();
		// TODO Auto-generated constructor stub
	}

	

}
