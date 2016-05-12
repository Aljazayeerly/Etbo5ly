package com.iti.jet.gp.etbo5ly.model.dao.impl;

import  com.iti.jet.gp.etbo5ly.model.generic.dao.GenericDaoImpl;

import javax.annotation.PostConstruct;

import org.springframework.stereotype.Repository;

import com.iti.jet.gp.etbo5ly.model.pojo.Tags;
import com.iti.jet.gp.etbo5ly.model.dao.interfaces.TagsDao;

@Repository("tagsDaoImpl")
public class TagsDaoImpl extends GenericDaoImpl<Tags> implements
TagsDao{
	
	  @PostConstruct
      public void init(){
		  System.out.println("hena fl init");
         super.setEntityClass(Tags.class);
      }



	public TagsDaoImpl() {
		super();
		// TODO Auto-generated constructor stub
	}

	



}
