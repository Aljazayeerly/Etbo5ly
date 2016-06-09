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
public class StatusHasOrderDTO {

    private Integer statusIdOrder;
    private String status;
//    private Date time;

    public Integer getStatusIdOrder() {
        return statusIdOrder;
    }

    public void setStatusIdOrder(Integer statusIdOrder) {
        this.statusIdOrder = statusIdOrder;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

//    public Date getTime() {
//        return time;
//    }
//
//    public void setTime(Date time) {
//        this.time = time;
//    }

}
