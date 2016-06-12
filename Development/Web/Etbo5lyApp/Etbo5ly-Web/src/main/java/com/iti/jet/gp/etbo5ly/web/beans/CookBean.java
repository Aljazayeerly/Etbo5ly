/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iti.jet.gp.etbo5ly.web.beans;

import com.iti.jet.gp.etbo5ly.model.pojo.Cook;
import com.iti.jet.gp.etbo5ly.model.pojo.CookStatus;
import com.iti.jet.gp.etbo5ly.service.CookService;
import com.iti.jet.gp.etbo5ly.service.dto.CookDTO;
import java.util.ArrayList;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.RequestScoped;
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

    private List<CookDTO> cooks = new ArrayList<>();

    @Autowired
    CookService cookService;

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

    @PostConstruct
    public void getAllCooks() {

        cooks = cookService.getAllCookDTOs();
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

}
