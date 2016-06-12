package com.iti.jet.gp.etbo5ly.model.dao.interfaces;

import com.iti.jet.gp.etbo5ly.model.pojo.Document;
import com.iti.jet.gp.etbo5ly.model.generic.dao.GenericDao;
import java.util.List;

public interface DocumentDao extends GenericDao<Document>{
    
    public List<Document> findAllByUserId(int id);

}
