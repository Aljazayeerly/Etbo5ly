/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iti.jet.gp.etbo5ly.service.impl;

import com.iti.jet.gp.etbo5ly.model.dao.interfaces.CategoryDao;
import com.iti.jet.gp.etbo5ly.model.dao.interfaces.CookDao;
import com.iti.jet.gp.etbo5ly.model.pojo.Category;
import com.iti.jet.gp.etbo5ly.model.pojo.Cook;
import com.iti.jet.gp.etbo5ly.service.AdminService;
import com.iti.jet.gp.etbo5ly.service.dto.SearchByLocationDTO;
import java.util.List;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author AlJazayeerly
 */
@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
    CategoryDao categoryDao;
    @Autowired
    CookDao cookDao;

    @Transactional
    @Override
    public Category addCategory(Category newCategory) {
        return categoryDao.create(newCategory);
    }

    @Override
    public List<Category> getAllCategories() {
        return categoryDao.getAll();
    }

   

}
