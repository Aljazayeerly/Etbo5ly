/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iti.jet.gp.etbo5ly.service.dto;

import com.iti.jet.gp.etbo5ly.model.pojo.Region;
import java.util.Date;

/**
 *
 * @author menna
 */
public class CustomerDTO {

    private Integer id;
    private String name;
    private String email;
    private String password;
    private Boolean enabled;
    private byte[] image;
    private Date registerationDate;
    private String phone;
    private String address;
    private String imageURL;
    private Integer RoleId;
    private String role;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
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

    public Boolean isEnabled() {
        return enabled;
    }

    public void setEnabled(Boolean enabled) {
        this.enabled = enabled;
    }

    public byte[] getImage() {
        return image;
    }

    public void setImage(byte[] image) {
        this.image = image;
    }

    public Date getRegisterationDate() {
        return registerationDate;
    }

    public void setRegisterationDate(Date registerationDate) {
        this.registerationDate = registerationDate;
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

    public String getImageURL() {
        return imageURL;
    }

    public void setImageURL(String imageURL) {
        this.imageURL = imageURL;
    }

    public Integer getRoleId() {
        return RoleId;
    }

    public void setRoleId(Integer RoleId) {
        this.RoleId = RoleId;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
    
    
    
    
}
