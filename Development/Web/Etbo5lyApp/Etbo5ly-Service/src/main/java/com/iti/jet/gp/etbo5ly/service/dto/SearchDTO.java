/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iti.jet.gp.etbo5ly.service.dto;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author salma
 */
 public class SearchDTO{
    
    List<Integer> selectedCategories =new ArrayList<Integer>();

    public List<Integer> getSelectedCategories() {
        return selectedCategories;
    }

    public void setSelectedCategories(List<Integer> selectedCategories) {
        this.selectedCategories = selectedCategories;
    }
    
}
