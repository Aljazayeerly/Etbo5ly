/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iti.jet.gp.etbo5ly.service.impl;

import com.iti.jet.gp.etbo5ly.model.dao.interfaces.CategoryDao;
import com.iti.jet.gp.etbo5ly.model.pojo.Category;
import com.iti.jet.gp.etbo5ly.model.pojo.StatusHasOrder;
import com.iti.jet.gp.etbo5ly.service.CategoryService;
import com.iti.jet.gp.etbo5ly.service.dto.CategoryDTO;
import java.util.ArrayList;
import java.util.List;
import javax.transaction.Transactional;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author menna
 */
@Service
public class CategoryServiceImpl implements CategoryService {

    @Autowired
    CategoryDao categoryDao;

    @Transactional
    @Override
    public List<CategoryDTO> getCategoriesOfCookByIdService(int cookId) {

        ModelMapper modelMapper = new ModelMapper();
        List<Category> categories = categoryDao.getCategoriesOfCookById(cookId);
        List<CategoryDTO> categoryDTOs = new ArrayList<>();
        CategoryDTO categoryDTO = null;
        for (Category c : categories) {
            categoryDTO = modelMapper.map(c, CategoryDTO.class);
            categoryDTOs.add(categoryDTO);
        }
        return categoryDTOs;
    }

}
