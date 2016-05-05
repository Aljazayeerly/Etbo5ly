package com.iti.jet.gp.etbo5ly.model.dao.impl;

import  com.iti.jet.gp.etbo5ly.model.generic.dao.GenericDaoImpl;

import javax.annotation.PostConstruct;

import org.springframework.stereotype.Repository;

import com.iti.jet.gp.etbo5ly.model.pojos.DocumentType;
import com.iti.jet.gp.etbo5ly.model.dao.interfaces.DocumentTypeDao;

@Repository("documentTypeDaoImpl")
public class DocumentTypeDaoImpl extends GenericDaoImpl<DocumentType> implements
		DocumentTypeDao {

	@PostConstruct
	public void init() {
		System.out.println("hena fl init");
		super.setEntityClass(DocumentType.class);
	}

	
	public DocumentTypeDaoImpl() {
		super();
		// TODO Auto-generated constructor stub
	}

}
