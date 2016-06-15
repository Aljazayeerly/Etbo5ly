package com.iti.jet.gp.etbo5ly.model.dao.impl;

import  com.iti.jet.gp.etbo5ly.model.generic.dao.GenericDaoImpl;

import javax.annotation.PostConstruct;

import org.springframework.stereotype.Repository;

import com.iti.jet.gp.etbo5ly.model.pojo.DocumentType;
import com.iti.jet.gp.etbo5ly.model.dao.interfaces.DocumentTypeDao;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

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

    @Override
    public DocumentType checkTypeAvailable(String type) {
        Session session=getHibernateTemplate().getSessionFactory().getCurrentSession();
        DocumentType document=(DocumentType) session.createCriteria(DocumentType.class).add(Restrictions.eq("type", type)).uniqueResult();
        return document;
    }

    @Override
    public String getDocumentType(int id) {
        System.out.println("id is " + id);
          Session session=getHibernateTemplate().getSessionFactory().getCurrentSession();
        DocumentType document=(DocumentType) session.createCriteria(DocumentType.class).add(Restrictions.eq("documentTypeId", id)).uniqueResult();
        return document.getType();
    }

}
