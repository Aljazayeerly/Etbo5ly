/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.iti.jet.gp.etbo5ly.service;

import com.iti.jet.gp.etbo5ly.model.pojo.Category;
import com.iti.jet.gp.etbo5ly.model.pojo.Cook;
import com.iti.jet.gp.etbo5ly.service.dto.SearchByLocationDTO;
import java.util.List;

/**
 *
 * @author AlJazayeerly
 */
public interface AdminService {
    public Category addCategory(Category newCategory);
    public List<Category> getAllCategories();
}
