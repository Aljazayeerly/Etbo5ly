package com.iti.jet.gp.etbo5ly.model.pojo;
// Generated May 6, 2016 12:05:20 PM by Hibernate Tools 4.3.1


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * Document generated by hbm2java
 */
@Entity
@Table(name="document")
public class Document  implements java.io.Serializable {


     private Integer documentId;
     private Cook cook;
     private DocumentType documentType;
     private String description;
     private Byte verfied;
     private byte[] document;

    public Document() {
    }

	
    public Document(Cook cook, DocumentType documentType) {
        this.cook = cook;
        this.documentType = documentType;
    }
    public Document(Cook cook, DocumentType documentType, String description, Byte verfied, byte[] document) {
       this.cook = cook;
       this.documentType = documentType;
       this.description = description;
       this.verfied = verfied;
       this.document = document;
    }
   
     @Id @GeneratedValue(strategy=IDENTITY)

    
    @Column(name="document_id", unique=true, nullable=false)
    public Integer getDocumentId() {
        return this.documentId;
    }
    
    public void setDocumentId(Integer documentId) {
        this.documentId = documentId;
    }

@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="cook_id", nullable=false)
    public Cook getCook() {
        return this.cook;
    }
    
    public void setCook(Cook cook) {
        this.cook = cook;
    }

@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="document_type_id", nullable=false)
    public DocumentType getDocumentType() {
        return this.documentType;
    }
    
    public void setDocumentType(DocumentType documentType) {
        this.documentType = documentType;
    }

    
    @Column(name="description", length=150)
    public String getDescription() {
        return this.description;
    }
    
    public void setDescription(String description) {
        this.description = description;
    }

    
    @Column(name="verfied")
    public Byte getVerfied() {
        return this.verfied;
    }
    
    public void setVerfied(Byte verfied) {
        this.verfied = verfied;
    }

    
    @Column(name="document")
    public byte[] getDocument() {
        return this.document;
    }
    
    public void setDocument(byte[] document) {
        this.document = document;
    }




}


