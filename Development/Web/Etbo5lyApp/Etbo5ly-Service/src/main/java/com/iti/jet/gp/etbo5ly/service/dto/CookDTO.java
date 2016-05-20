/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.iti.jet.gp.etbo5ly.service.dto;

import java.util.Date;

/**
 *
 * @author AlJazayeerly
 */
public class CookDTO {
    private String name;
    private String email;
    private String password;
    private Boolean enabled;
    private byte[] image;
    private Date registerationDate;
    private String phone;
    private String address;
    private Date startWorkingHours;
    private Date endWorkingHours;

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

    public Date getStartWorkingHours() {
        return startWorkingHours;
    }

    public void setStartWorkingHours(Date startWorkingHours) {
        this.startWorkingHours = startWorkingHours;
    }

    public Date getEndWorkingHours() {
        return endWorkingHours;
    }

    public void setEndWorkingHours(Date endWorkingHours) {
        this.endWorkingHours = endWorkingHours;
    }
    
    
    
}
