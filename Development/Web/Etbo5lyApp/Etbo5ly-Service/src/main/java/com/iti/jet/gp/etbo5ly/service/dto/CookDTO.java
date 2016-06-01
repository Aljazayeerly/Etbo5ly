/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iti.jet.gp.etbo5ly.service.dto;

import com.iti.jet.gp.etbo5ly.service.util.ResourceUtil;
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

    private Date registerationDate;
    private String phone;
    private String address;
    private Date startWorkingHours;
    private Date endWorkingHours;
    private double longitude;
    private double latitude;
    private String imageURL;
    private int id;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

   
    private static String resourcesURL = ResourceUtil.getCooksImagesURL();

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

    public double getLongitude() {
        return longitude;
    }

    public void setLongitude(double longitude) {
        this.longitude = longitude;
    }

    public double getLatitude() {
        return latitude;
    }

    public void setLatitude(double latitude) {
        this.latitude = latitude;
    }

    public String getImageURL() {
        return imageURL;
    }

    public void setImageURL(String imageURL) {
        this.imageURL = imageURL;
    }

    public  String getResourcesURL() {
        return resourcesURL;
    }

}
