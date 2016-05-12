package com.iti.jet.gp.etbo5ly.model.pojo;
// Generated May 6, 2016 12:05:20 PM by Hibernate Tools 4.3.1


import com.fasterxml.jackson.annotation.JsonIgnore;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * DocumentType generated by hbm2java
 */
@Entity
@Table(name="document_type")
public class DocumentType  implements java.io.Serializable {


     private int documentTypeId;
     private String type;
     private Set<Document> documents = new HashSet<Document>(0);

    public DocumentType() {
    }

	
    public DocumentType(int documentTypeId, String type) {
        this.documentTypeId = documentTypeId;
        this.type = type;
    }
    public DocumentType(int documentTypeId, String type, Set documents) {
       this.documentTypeId = documentTypeId;
       this.type = type;
       this.documents = documents;
    }
   
     @Id @GeneratedValue(strategy=IDENTITY)

    
    @Column(name="document_type_id", unique=true, nullable=false)
    public int getDocumentTypeId() {
        return this.documentTypeId;
    }
    
    public void setDocumentTypeId(int documentTypeId) {
        this.documentTypeId = documentTypeId;
    }

    
    @Column(name="type", nullable=false, length=45)
    public String getType() {
        return this.type;
    }
    
    public void setType(String type) {
        this.type = type;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="documentType")
  @JsonIgnore //salma-added
    public Set<Document> getDocuments() {
        return this.documents;
    }
    
    public void setDocuments(Set<Document> documents) {
        this.documents = documents;
    }




}


