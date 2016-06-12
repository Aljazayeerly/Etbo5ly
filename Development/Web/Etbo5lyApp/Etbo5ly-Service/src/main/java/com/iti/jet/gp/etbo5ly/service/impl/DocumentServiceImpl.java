/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iti.jet.gp.etbo5ly.service.impl;

import com.iti.jet.gp.etbo5ly.model.dao.interfaces.DocumentDao;
import com.iti.jet.gp.etbo5ly.model.pojo.Document;
import com.iti.jet.gp.etbo5ly.service.DocumentService;
import com.iti.jet.gp.etbo5ly.service.dto.DocumentDTO;
import com.iti.jet.gp.etbo5ly.service.util.DTOConverter;
import java.util.List;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Nada
 */
@Service
public class DocumentServiceImpl  implements DocumentService{
    
    @Autowired
    DocumentDao documentDao;

    @Override
    @Transactional
    public void insertDocument(DocumentDTO document) {
       Document document1= DTOConverter.documentDTOTODocument(document);
        documentDao.create(document1);
    }

    @Override
    @Transactional
    public List<Document> findAllByUserId(int id) {
        List<Document> documents=documentDao.findAllByUserId(id);
        return documents;
    }
    
}
