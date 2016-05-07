package com.iti.jet.gp.etbo5ly.model.dao.impl;

import  com.iti.jet.gp.etbo5ly.model.generic.dao.GenericDaoImpl;

import javax.annotation.PostConstruct;

import org.springframework.stereotype.Repository;

import com.iti.jet.gp.etbo5ly.model.pojo.Document;
import com.iti.jet.gp.etbo5ly.model.dao.interfaces.DocumentDao;

@Repository("documentDaoImpl")
public class DocumentDaoImpl extends GenericDaoImpl<Document> implements
		DocumentDao {

	@PostConstruct
	public void init() {
		System.out.println("hena fl init");
		super.setEntityClass(Document.class);
	}


	public DocumentDaoImpl() {
		super();
		// TODO Auto-generated constructor stub
	}

}
