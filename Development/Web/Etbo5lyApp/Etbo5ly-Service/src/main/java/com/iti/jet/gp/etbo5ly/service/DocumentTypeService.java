/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iti.jet.gp.etbo5ly.service;

import com.iti.jet.gp.etbo5ly.model.pojo.DocumentType;

/**
 *
 * @author Nada
 */
public interface DocumentTypeService {

    public DocumentType checkTypeAvailable(String type);

    public String getDocumentType(int id);

}
