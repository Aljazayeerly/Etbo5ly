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
public class SearchByLocationDTO {
    List<Integer> selectedLocations =new ArrayList<Integer>();

    public List<Integer> getSelectedLocations() {
        return selectedLocations;
    }

    public void setSelectedLocations(List<Integer> selectedLocations) {
        this.selectedLocations = selectedLocations;
    }
}
