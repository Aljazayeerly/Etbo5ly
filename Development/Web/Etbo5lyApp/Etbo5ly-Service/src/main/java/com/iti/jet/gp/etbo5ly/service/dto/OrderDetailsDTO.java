/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iti.jet.gp.etbo5ly.service.dto;

/**
 *
 * @author menna
 */
public class OrderDetailsDTO {

    private int menuItemsItemId;
    private String menuItemsNameEn;
    private String menuItemsNameAr;
    private float menuItemsPrice;
    private String menuItemsDescriptionEn;
    private String menuItemsDescriptionAr;
    private String menuItemsImageUrl;
    private Integer quantity;
    private Float price;
    private Short rating;
    private String comment;

    public int getMenuItemsItemId() {
        return menuItemsItemId;
    }

    public void setMenuItemsItemId(int menuItemsItemId) {
        this.menuItemsItemId = menuItemsItemId;
    }

    public String getMenuItemsNameEn() {
        return menuItemsNameEn;
    }

    public void setMenuItemsNameEn(String menuItemsNameEn) {
        this.menuItemsNameEn = menuItemsNameEn;
    }

    public String getMenuItemsNameAr() {
        return menuItemsNameAr;
    }

    public void setMenuItemsNameAr(String menuItemsNameAr) {
        this.menuItemsNameAr = menuItemsNameAr;
    }

    public float getMenuItemsPrice() {
        return menuItemsPrice;
    }

    public void setMenuItemsPrice(float menuItemsPrice) {
        this.menuItemsPrice = menuItemsPrice;
    }

    public String getMenuItemsDescriptionEn() {
        return menuItemsDescriptionEn;
    }

    public void setMenuItemsDescriptionEn(String menuItemsDescriptionEn) {
        this.menuItemsDescriptionEn = menuItemsDescriptionEn;
    }

    public String getMenuItemsDescriptionAr() {
        return menuItemsDescriptionAr;
    }

    public void setMenuItemsDescriptionAr(String menuItemsDescriptionAr) {
        this.menuItemsDescriptionAr = menuItemsDescriptionAr;
    }

    public String getMenuItemsImageUrl() {
        return menuItemsImageUrl;
    }

    public void setMenuItemsImageUrl(String menuItemsImageUrl) {
        this.menuItemsImageUrl = menuItemsImageUrl;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public Float getPrice() {
        return price;
    }

    public void setPrice(Float price) {
        this.price = price;
    }

    public Short getRating() {
        return rating;
    }

    public void setRating(Short rating) {
        this.rating = rating;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

}
