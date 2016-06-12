/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iti.jet.gp.etbo5ly.service.dto;

import com.iti.jet.gp.etbo5ly.model.pojo.Cook;
import com.iti.jet.gp.etbo5ly.model.pojo.DocumentType;

/**
 *
 * @author Nada
 */
public class DocumentDTO {

    private Integer documentId;
    //private DocumentType documentType;
    private Integer documentTypeDocumentTypeId;
    private String documentTypeType;
    private int cookId;
    private String description;
    private Byte verfied;
    private byte[] document;

    public Integer getDocumentId() {
        return documentId;
    }

    public void setDocumentId(Integer documentId) {
        this.documentId = documentId;
    }

    public Integer getDocumentTypeDocumentTypeId() {
        return documentTypeDocumentTypeId;
    }

    public void setDocumentTypeDocumentTypeId(Integer documentTypeDocumentTypeId) {
        this.documentTypeDocumentTypeId = documentTypeDocumentTypeId;
    }

    public String getDocumentTypeType() {
        return documentTypeType;
    }

    public void setDocumentTypeType(String documentTypeType) {
        this.documentTypeType = documentTypeType;
    }

    public int getCookId() {
        return cookId;
    }

    public void setCookId(int cookId) {
        this.cookId = cookId;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Byte getVerfied() {
        return verfied;
    }

    public void setVerfied(Byte verfied) {
        this.verfied = verfied;
    }

    public byte[] getDocument() {
        return document;
    }

    public void setDocument(byte[] document) {
        this.document = document;
    }

    @Override
    public String toString() {
        return "DocumentDTO{" + "documentId=" + documentId + ", documentTypeDocumentTypeId=" + documentTypeDocumentTypeId + ", documentTypeType=" + documentTypeType + ", cookId=" + cookId + ", description=" + description + ", verfied=" + verfied + ", document=" + document + '}';
    }
    
    

}
