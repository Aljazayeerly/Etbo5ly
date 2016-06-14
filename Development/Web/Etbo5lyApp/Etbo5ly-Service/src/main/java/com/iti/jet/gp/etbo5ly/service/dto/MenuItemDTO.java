/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iti.jet.gp.etbo5ly.service.dto;

import com.iti.jet.gp.etbo5ly.service.util.ResourceUtil;
import java.util.HashSet;
import java.util.Set;

/**
 *
 * @author AlJazayeerly
 */
public class MenuItemDTO {

    private Integer itemId;
    private Integer cookId;
    private String cookName;
    private String nameEn;
    private String nameAr;
    private float price;
    private String descriptionEn;
    private String descriptionAr;
    private Short itemRate;
    private String imageUrl;
    private String  checked ;

    public String getChecked() {
        return checked;
    }

    public void setChecked(String checked) {
        this.checked = checked;
    }
    


    private Set<CategoryDTO> categories = new HashSet<CategoryDTO>(0);

    private static String resourcesURL = ResourceUtil.getMealsImagesURL();

    public Integer getItemId() {
        return itemId;
    }

    public void setItemId(Integer itemId) {
        this.itemId = itemId;
    }

    public String getCookName() {
        return cookName;
    }

    public void setCookName(String cookName) {
        this.cookName = cookName;
    }

    public String getNameEn() {
        return nameEn;
    }

    public void setNameEn(String nameEn) {
        this.nameEn = nameEn;
    }

    public String getNameAr() {
        return nameAr;
    }

    public void setNameAr(String nameAr) {
        this.nameAr = nameAr;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public String getDescriptionEn() {
        return descriptionEn;
    }

    public void setDescriptionEn(String descriptionEn) {
        this.descriptionEn = descriptionEn;
    }

    public String getDescriptionAr() {
        return descriptionAr;
    }

    public void setDescriptionAr(String descriptionAr) {
        this.descriptionAr = descriptionAr;
    }

    public Short getItemRate() {
        return itemRate;
    }

    public void setItemRate(Short itemRate) {
        this.itemRate = itemRate;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public String getResourcesURL() {
        return resourcesURL;
    }

    public Set<CategoryDTO> getCategories() {
        return categories;
    }

    public void setCategories(Set<CategoryDTO> categories) {
        this.categories = categories;
    }

    public Integer getCookId() {
        return cookId;
    }

    public void setCookId(Integer cookId) {
        this.cookId = cookId;
    }

}
