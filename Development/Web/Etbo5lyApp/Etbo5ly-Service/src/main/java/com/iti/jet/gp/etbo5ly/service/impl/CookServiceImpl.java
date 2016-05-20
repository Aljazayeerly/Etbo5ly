/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iti.jet.gp.etbo5ly.service.impl;

import com.iti.jet.gp.etbo5ly.model.dao.interfaces.CookDao;
import com.iti.jet.gp.etbo5ly.service.dto.CookDTO;
import com.iti.jet.gp.etbo5ly.model.pojo.Cook;
import com.iti.jet.gp.etbo5ly.service.CookService;
import java.util.ArrayList;
import java.util.List;
import javax.transaction.Transactional;
import org.modelmapper.ModelMapper;
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
    @Transactional
    public List<Cook> getAllCooks() {
        System.out.println("seervice layer");
        List<Cook> cooks =   cookDao.getAll();
        System.out.println("cooks size : " + cooks.size());
        return cooks;
    }
    
    @Transactional
    public List<CookDTO> getAllCookDTOs(){
        List<CookDTO> cookDTOs=new ArrayList<CookDTO>();
        List<Cook> cooks=cookDao.getAll();
        ModelMapper modelMapper=new ModelMapper();
        for(Cook cook:cooks){
            CookDTO cookDTO=modelMapper.map(cook, CookDTO.class);
            cookDTOs.add(cookDTO);
        }
        return cookDTOs;
    }
}
