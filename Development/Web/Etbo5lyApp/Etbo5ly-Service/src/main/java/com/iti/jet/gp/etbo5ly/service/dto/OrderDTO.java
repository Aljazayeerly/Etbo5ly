/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iti.jet.gp.etbo5ly.service.dto;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

/**
 *
 * @author AlJazayeerly
 */
public class OrderDTO {

    private int orderId;
    private int userByCustomerId;
    private String customerName;
    private int userByCookId;
    private String cookName;
    private String location;
    private int duration;
    private Short customerRating;
    private String orderComment;
    private Short cookRating;
    private String cookComment;
    private String type;
    private Double longitude;
    private Double latitude;
    private String addressDetails;
    private int regionId;
    private Timestamp orderTime;
    private Float totalPrice;
//    private String regionName;
//    private String regionNameAr;
//    private String regionCityName;
//    private String regionCityNameAr;
//    private String regionCityCountryName;
    private Set<OrderDetailsDTO> orderDetails = new HashSet<OrderDetailsDTO>(0);
    private Set<StatusHasOrderDTO> statusHasOrders = new HashSet<StatusHasOrderDTO>(0);

    public OrderDTO() {
    }


    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getUserByCustomerId() {
        return userByCustomerId;
    }

    public void setUserByCustomerId(int userByCustomerId) {
        this.userByCustomerId = userByCustomerId;
    }

    public int getUserByCookId() {
        return userByCookId;
    }

    public void setUserByCookId(int userByCookId) {
        this.userByCookId = userByCookId;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getCookName() {
        return cookName;
    }

    public void setCookName(String cookName) {
        this.cookName = cookName;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public int getDuration() {
        return duration;
    }

    public void setDuration(int duration) {
        this.duration = duration;
    }

    public Short getCustomerRating() {
        return customerRating;
    }

    public void setCustomerRating(Short customerRating) {
        this.customerRating = customerRating;
    }

    public String getOrderComment() {
        return orderComment;
    }

    public void setOrderComment(String orderComment) {
        this.orderComment = orderComment;
    }

    public Short getCookRating() {
        return cookRating;
    }

    public void setCookRating(Short cookRating) {
        this.cookRating = cookRating;
    }

    public String getCookComment() {
        return cookComment;
    }

    public void setCookComment(String cookComment) {
        this.cookComment = cookComment;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Double getLongitude() {
        return longitude;
    }

    public void setLongitude(Double longitude) {
        this.longitude = longitude;
    }

    public Double getLatitude() {
        return latitude;
    }

    public void setLatitude(Double latitude) {
        this.latitude = latitude;
    }

    public String getAddressDetails() {
        return addressDetails;
    }

    public void setAddressDetails(String addressDetails) {
        this.addressDetails = addressDetails;
    }

    public int getRegionId() {
        return regionId;
    }

    public void setRegionId(int regionId) {
        this.regionId = regionId;
    }

    public Timestamp getOrderTime() {
        return orderTime;
    }

    public void setOrderTime(Timestamp orderTime) {
        this.orderTime = orderTime;
    }

//    public String getRegionName() {
//        return regionName;
//    }
//
//    public void setRegionName(String regionName) {
//        this.regionName = regionName;
//    }
//
//    public String getRegionNameAr() {
//        return regionNameAr;
//    }
//
//    public void setRegionNameAr(String regionNameAr) {
//        this.regionNameAr = regionNameAr;
//    }
//
//    public String getRegionCityName() {
//        return regionCityName;
//    }
//
//    public void setRegionCityName(String regionCityName) {
//        this.regionCityName = regionCityName;
//    }
//
//    public String getRegionCityNameAr() {
//        return regionCityNameAr;
//    }
//
//    public void setRegionCityNameAr(String regionCityNameAr) {
//        this.regionCityNameAr = regionCityNameAr;
//    }
//
//    public String getRegionCityCountryName() {
//        return regionCityCountryName;
//    }
//
//    public void setRegionCityCountryName(String regioncityCountryName) {
//        this.regionCityCountryName = regioncityCountryName;
//    }
    public Set<OrderDetailsDTO> getOrderDetails() {
        return orderDetails;
    }

    public void setOrderDetails(Set<OrderDetailsDTO> orderDetails) {
        this.orderDetails = orderDetails;
    }

    public Set<StatusHasOrderDTO> getStatusHasOrders() {
        return statusHasOrders;
    }

    public void setStatusHasOrders(Set<StatusHasOrderDTO> statusHasOrders) {
        this.statusHasOrders = statusHasOrders;
    }

    public Float getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(Float totalPrice) {
        this.totalPrice = totalPrice;
    }

}
