/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iti.jet.gp.etbo5ly.web.beans;

import com.iti.jet.gp.etbo5ly.model.pojo.Cook;
import com.iti.jet.gp.etbo5ly.model.pojo.CookStatus;
import com.iti.jet.gp.etbo5ly.service.CookService;
import com.iti.jet.gp.etbo5ly.service.DocumentService;
import com.iti.jet.gp.etbo5ly.service.DocumentTypeService;
import com.iti.jet.gp.etbo5ly.service.dto.CookDTO;
import com.iti.jet.gp.etbo5ly.service.dto.DocumentDTO;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.RequestScoped;
import javax.faces.context.FacesContext;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 *
 * @author menna
 */
@ManagedBean(name = "cookBean")
@RequestScoped
@Component
public class CookBean {

    private Integer id;
    private String name;
    private Boolean enabled;
    private String phone;
    private String description;
    private Integer documentId;

//    private byte[] document;
    private List<CookDTO> cooks = new ArrayList<>();

    @Autowired
    CookService cookService;
    
    @Autowired
    DocumentTypeService documentTypeService;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

//    public Set<DocumentDTO> getDocuments() {
//        return documents;
//    }
//
//    public void setDocuments(Set<DocumentDTO> documents) {
//        this.documents = documents;
//    }
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<CookDTO> getCooks() {
        return cooks;
    }

    public void setCooks(List<CookDTO> cooks) {
        this.cooks = cooks;
    }

    public CookService getCookService() {
        return cookService;
    }

    public void setCookService(CookService cookService) {
        this.cookService = cookService;
    }

    public Boolean getEnabled() {
        return enabled;
    }

    public void setEnabled(Boolean enabled) {
        this.enabled = enabled;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

//    public byte[] getDocument() {
//        return document;
//    }
//
//    public void setDocument(byte[] document) {
//        this.document = document;
//    }
    @PostConstruct
    public void getAllCooks() {

        cooks = cookService.getAllCookDTOs();
        System.out.println("cookss " + cooks.toString());
        for (CookDTO cook : cooks) {
            System.out.println("cook docuements is " + cook.getDocuments().toString());
        }
    }

    public void changeCookState(CookDTO cookDTO) {

        Cook cook = new Cook();
        cook.setId(cookDTO.getId());
        CookStatus cookStatus = new CookStatus();
        cook.setEnabled(cookDTO.getEnabled());
        if (cook.getEnabled() == true) {
            cookStatus.setStatusId(3);
        } else if (cook.getEnabled() == false) {
            cookStatus.setStatusId(2);
        }
        cook.setCookStatus(cookStatus);
        cook.setEnabled(cookDTO.getEnabled());
        cookService.changeCookStatus(cook);
    }

    public void downloadDocument(CookDTO cookDTO, DocumentDTO documentDTO) throws IOException {

        System.out.println("cook id is " + cookDTO.getId());
        System.out.println("document id is " + documentDTO.getDocumentId());
        HttpServletResponse response = (HttpServletResponse) FacesContext.getCurrentInstance()
                .getExternalContext().getResponse();
     String type  = documentTypeService.getDocumentType(documentDTO.getDocumentTypeDocumentTypeId());
        response.setContentType(type);
        response.setHeader("Content-Disposition", "attachment; filename=" + documentDTO.getDescription());
        ServletOutputStream ouputStream=response.getOutputStream();
        ouputStream.write(documentDTO.getDocument(), 0, documentDTO.getDocument().length);
        ouputStream.flush();
        ouputStream.close();
//         FacesContext.getCurrentInstance().responseComplete();

    }
}
