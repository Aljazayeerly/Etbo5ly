/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iti.jet.gp.etbo5ly.service.impl;

import com.iti.jet.gp.etbo5ly.model.dao.interfaces.DocumentTypeDao;
import com.iti.jet.gp.etbo5ly.model.pojo.DocumentType;
import com.iti.jet.gp.etbo5ly.service.DocumentTypeService;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Nada
 */
@Service
public class DocumentTypeServiceImpl implements DocumentTypeService {

    @Autowired
    DocumentTypeDao documentTypeDao;

    @Override
    @Transactional
    public DocumentType checkTypeAvailable(String type) {
        System.out.println("inside the service of check");
        System.out.println("file content type type " + type);

        DocumentType document = documentTypeDao.checkTypeAvailable(type);
        return document;
    }

}
