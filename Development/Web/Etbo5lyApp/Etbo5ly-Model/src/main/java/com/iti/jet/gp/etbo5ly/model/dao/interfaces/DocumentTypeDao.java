package com.iti.jet.gp.etbo5ly.model.dao.interfaces;

import com.iti.jet.gp.etbo5ly.model.pojo.DocumentType;
import com.iti.jet.gp.etbo5ly.model.generic.dao.GenericDao;

public interface DocumentTypeDao extends GenericDao<DocumentType>{
    
    public DocumentType checkTypeAvailable(String type);
    public String getDocumentType(int id);

}
