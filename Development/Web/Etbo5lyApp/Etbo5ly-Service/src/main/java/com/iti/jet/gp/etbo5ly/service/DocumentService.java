/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iti.jet.gp.etbo5ly.service;

import com.iti.jet.gp.etbo5ly.model.pojo.Document;
import com.iti.jet.gp.etbo5ly.service.dto.DocumentDTO;
import java.util.List;

/**
 *
 * @author Nada
 */
public interface DocumentService {

    public void insertDocument(DocumentDTO document);

    public List<Document> findAllByUserId(int id);
    
  //  public getAll

}
