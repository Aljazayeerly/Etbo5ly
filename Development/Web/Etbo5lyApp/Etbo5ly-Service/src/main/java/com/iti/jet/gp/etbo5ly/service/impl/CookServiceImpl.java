/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iti.jet.gp.etbo5ly.service.impl;

import com.iti.jet.gp.etbo5ly.model.dao.interfaces.CookDao;
import com.iti.jet.gp.etbo5ly.model.pojo.Cook;
import com.iti.jet.gp.etbo5ly.service.CookService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author salma
 */
@Service
public class CookServiceImpl implements CookService{

    @Autowired
    CookDao cookDao;
    
    
    @Override
    public List<Cook> getAllCooks() {
        System.out.println("seervice layer");
        List<Cook> cooks =   cookDao.getAll();
        System.out.println("cooks size : " + cooks.size());
        return cooks;
    }
    
}
