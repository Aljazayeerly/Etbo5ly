/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iti.jet.gp.etbo5ly.service.dto;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.iti.jet.gp.etbo5ly.model.pojo.Cook;
import com.iti.jet.gp.etbo5ly.model.pojo.CookStatus;
import com.iti.jet.gp.etbo5ly.model.pojo.DocumentType;
import com.iti.jet.gp.etbo5ly.model.pojo.Order;
import com.iti.jet.gp.etbo5ly.model.pojo.Region;
import com.iti.jet.gp.etbo5ly.model.pojo.Role;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import javax.validation.constraints.NotNull;

/**
 *
 * @author Nada
 */
public class CookDocumentDTO {

    private Integer Id;
    @NotNull
    private String regionid;
    @NotNull
    private String name;
    @NotNull
    private String email;
    @NotNull
    private String password;
   // private Boolean enabled;
    // private byte[] image;
    // private Date registerationDate;
    @NotNull
    private String phone;
    @NotNull
    private String address;
    private String longitude;
    private String latitude;
  //  private String imageURL;
    // @NotNull
    private Integer cookStatusId;
    private String startWorkingHours;
    private String endWorkingHours;
    private String documentId;
    //@NotNull
    private String documentType;
    // private Cook cook;
    private String description;
    // private Byte verfied;
    private byte[] document;
    
//    private Set<RoleDTO> roles;

    public String getRegionid() {
        return regionid;
    }

    public void setRegionid(String regionid) {
        this.regionid = regionid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Integer getCookStatusId() {
        return cookStatusId;
    }

    public void setCookStatusId(Integer cookStatusId) {
        this.cookStatusId = cookStatusId;
    }

    public String getStartWorkingHours() {
        return startWorkingHours;
    }

    public void setStartWorkingHours(String startWorkingHours) {
        this.startWorkingHours = startWorkingHours;
    }

    public String getEndWorkingHours() {
        return endWorkingHours;
    }

    public void setEndWorkingHours(String endWorkingHours) {
        this.endWorkingHours = endWorkingHours;
    }

    public String getDocumentId() {
        return documentId;
    }

    public void setDocumentId(String documentId) {
        this.documentId = documentId;
    }

    public String getDocumentType() {
        return documentType;
    }

    public void setDocumentType(String documentType) {
        this.documentType = documentType;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public byte[] getDocument() {
        return document;
    }

    public void setDocument(byte[] document) {
        this.document = document;
    }

    public Integer getId() {
        return Id;
    }

    public void setId(Integer Id) {
        this.Id = Id;
    }

    public String getLongitude() {
        return longitude;
    }

    public void setLongitude(String longitude) {
        this.longitude = longitude;
    }

    public String getLatitude() {
        return latitude;
    }

    public void setLatitude(String latitude) {
        this.latitude = latitude;
    }

  
    
}
