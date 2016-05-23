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
import com.iti.jet.gp.etbo5ly.service.util.DTOConverter;
import java.util.ArrayList;
import java.util.List;
import javax.transaction.Transactional;
import org.hibernate.Hibernate;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.type.Type;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.TransactionCallback;
import org.springframework.transaction.support.TransactionTemplate;

/**
 *
 * @author salma
 */
@Service
public class CookServiceImpl implements CookService {

    @Autowired
    CookDao cookDao;

    @Autowired
    HibernateTemplate hibernateTemplate;

    @Autowired
    TransactionTemplate transactionTemplate;

    @Override
    @Transactional
    public List<Cook> getAllCooks() {
        List<Cook> cooks = cookDao.getAll();
        return cooks;
    }

    @Transactional
    public List<CookDTO> getAllCookDTOs() {
        List<CookDTO> cookDTOs = new ArrayList<CookDTO>();
        List<Cook> cooks = cookDao.getAll();
        ModelMapper modelMapper = new ModelMapper();
        for (Cook cook : cooks) {
            CookDTO cookDTO = modelMapper.map(cook, CookDTO.class);
            cookDTOs.add(cookDTO);
        }
        return cookDTOs;
    }

    @Override
    @Transactional
    public List<Cook> getAllNearbyCooks(double Clongtitude, double Clatitude) {
//        return (List<Cook>) transactionTemplate.execute(new TransactionCallback<Object>() {
//
//            @Override
//            public Object doInTransaction(TransactionStatus ts) {
//                return hibernateTemplate.getSessionFactory().getCurrentSession().getNamedQuery("callCooksStoreProcedure").setParameters(os, types);
//
//            }
//        });
//    }
        List<Cook> allCooks = getAllCooks();
        System.out.print("Nearby Coooooooooks");
        List<Cook> nearbyCooks = new ArrayList<>();
        for (int i = 0; i < allCooks.size(); i++) {
            
            double distance = 3956 * 2 * Math.asin(Math.sqrt(Math.pow(Math.sin((Clatitude - Math.abs(allCooks.get(i).getLatitude())) * Math.PI / 180 / 2), 2) + Math.cos(Clatitude * Math.PI / 180) * Math.cos(Math.abs(allCooks.get(i).getLatitude()) * Math.PI / 180)
                    * Math.pow(Math.sin((Clongtitude - Math.abs(allCooks.get(i).getLongitude())) * Math.PI / 180 / 2), 2)
            ));
            
            System.out.print("distance value" + distance);
            if (distance <= 5) {
                nearbyCooks.add(allCooks.get(i));
            }
        }
        return nearbyCooks;
    }

    @Override
    @Transactional
    public List<CookDTO> getAllNearbyCooksDTO(double cLongtitude, double cLatitude) {
        List<CookDTO> allCooks = getAllCookDTOs();
        List<CookDTO> nearbyCooks = new ArrayList<>();
        ModelMapper modelMapper = new ModelMapper();
        for (int i = 0; i < allCooks.size(); i++) {
            double distance = 3956 * 2 * Math.asin(Math.sqrt(Math.pow(Math.sin((cLatitude - Math.abs(allCooks.get(i).getLatitude())) * Math.PI / 180 / 2), 2) + Math.cos(cLatitude * Math.PI / 180) * Math.cos(Math.abs(allCooks.get(i).getLatitude()) * Math.PI / 180)
                    * Math.pow(Math.sin((cLongtitude - Math.abs(allCooks.get(i).getLongitude())) * Math.PI / 180 / 2), 2)
            ));
            System.out.print("distance value" + distance);
            if (distance <= 5) {
                CookDTO cookDTO = modelMapper.map(allCooks.get(i), CookDTO.class);
                nearbyCooks.add(cookDTO);
            }
        }
        return nearbyCooks;
    }

    @Override
    @Transactional
    public List<CookDTO> getCooksByPage(int page) {

        List<Cook> Cooks = cookDao.getCooksPage(page);
        return DTOConverter.cookListToCookDTOList(Cooks);

    }

    @Override
    @Transactional
    public List<CookDTO> getCooksByRegion(int regionId) {

        List<Cook> Cooks = cookDao.getCooksByRegion(regionId);
        return DTOConverter.cookListToCookDTOList(Cooks);
    }

}
