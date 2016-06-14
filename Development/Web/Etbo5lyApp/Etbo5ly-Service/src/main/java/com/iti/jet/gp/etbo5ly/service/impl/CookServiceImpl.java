/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iti.jet.gp.etbo5ly.service.impl;

import com.iti.jet.gp.etbo5ly.model.dao.interfaces.CookDao;
import com.iti.jet.gp.etbo5ly.service.dto.CookDTO;
import com.iti.jet.gp.etbo5ly.model.pojo.Cook;
import com.iti.jet.gp.etbo5ly.model.pojo.Customer;
import com.iti.jet.gp.etbo5ly.model.pojo.Role;
import com.iti.jet.gp.etbo5ly.service.CookService;
import com.iti.jet.gp.etbo5ly.service.dto.CookDocumentDTO;
import com.iti.jet.gp.etbo5ly.service.dto.CustomerDTO;
import com.iti.jet.gp.etbo5ly.service.dto.RoleDTO;
import com.iti.jet.gp.etbo5ly.service.util.DTOConverter;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;
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

    double longitude;
    double latitude;

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
//        longitude=Clongtitude;
//        latitude=Clatitude;
//        System.out.println("long" + longitude);
//        System.out.println("Service cooks");
//       return (List<Cook>) transactionTemplate.execute(new TransactionCallback<Object>() {
//           
//            @Override
//            public Object doInTransaction(TransactionStatus ts) {
//               List<Cook> myCooks= hibernateTemplate.getSessionFactory().getCurrentSession().getNamedQuery("callCooksStoreProcedure").setParameter("longitude", longitude).setParameter("latitude", latitude).list();
//                for (Cook myCook : myCooks) {
//                    System.out.println("myCooks" + myCook.getName());
//                }           
//               return myCooks;
//            }
//           
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

    @Override
    @Transactional
    public Cook getCookByLocation(double cLongtitude, double cLatitude) {
        System.out.println("inside Location");
        System.out.println("long" + cLongtitude + "lat" + cLatitude);
        Cook cook = cookDao.getCookByLocation(cLongtitude, cLatitude);
        System.out.println("cook " + cook.getName());
        return cook;
    }

    @Override
    @Transactional
    public CookDTO getCookDataForProfile(int cookId) {

        Cook cookData = cookDao.getCookData(cookId);
        ModelMapper modelMapper = new ModelMapper();
        CookDTO cookDTO = modelMapper.map(cookData, CookDTO.class);

        return cookDTO;
    }

    @Override
    @Transactional
    public void changeCookStatus(Cook cook) {

//        System.out.println("change cook status" + cook.getName() + " " + cook.getId());
        cookDao.changeCookStatus(cook);
    }

    public CookDTO registerCook(CookDTO cook) {
        System.out.println("inside the cook register service");
        Cook cookConverter = DTOConverter.cookDTOTOCook(cook);
        cookConverter = cookDao.registerCook(cookConverter);
        if (cookConverter != null) {
            return cook;
        } else {
            return null;
        }

    }

    @Override
    @Transactional
    public CookDTO checkEmail(String email) {

        ModelMapper modelMapper = new ModelMapper();
        Cook cook = cookDao.CheckEmail(email);
        if (cook != null) {
            //  System.out.println("inside customer not equal null");
            CookDTO newCookDTO = modelMapper.map(cook, CookDTO.class);
            return newCookDTO;
        } else {
            // System.out.println("inside customer  equal null");

            return null;
        }
    }

    @Override
    @Transactional
    public void insertCook(CookDocumentDTO cook) {
        CookDTO newCook = new CookDTO();
        DateFormat timeFormat = new SimpleDateFormat("hh:mm");
        DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        Date date = new Date();
        RoleDTO role = new RoleDTO();
        Set<RoleDTO> roles = new HashSet<>();
        role.setRole("COOK");
        role.setId(1);
        roles.add(role);
        System.out.println(dateFormat.format(date)); //2014/08/06 15:59:48
        newCook.setName(cook.getName());
        newCook.setEmail(cook.getEmail());
        newCook.setAddress(cook.getAddress());
        newCook.setPassword(cook.getPassword());
        newCook.setPhone(cook.getPhone());
        newCook.setRegionId(Integer.parseInt(cook.getRegionid()));
        newCook.setEnabled(Boolean.FALSE);
        newCook.setCookStatusStatusId(2);
        newCook.setLongitude(Double.parseDouble(cook.getLongitude()));
        newCook.setLatitude(Double.parseDouble(cook.getLongitude()));
        newCook.setRoles(roles);

        try {
            newCook.setStartWorkingHours(timeFormat.parse(cook.getStartWorkingHours()));
            newCook.setEndWorkingHours(timeFormat.parse(cook.getEndWorkingHours()));
            newCook.setRegisterationDate(dateFormat.parse(dateFormat.format(date)));

        } catch (ParseException ex) {
            Logger.getLogger(CookServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
        }

        System.out.println("cook registered is " + newCook.toString());
        Cook cook1 = DTOConverter.cookDTOTOCook(newCook);
        cookDao.insertCook(cook1);

    }

    @Override
    @Transactional
    public int getCookId(String email) {
        int id = cookDao.getCookId(email);
        return id;
    }

    @Override
    public Cook findById(int id) {
        Cook cook = cookDao.find(id);
        return cook;
    }

//    @Override
//   
//    public void uploadImage(CookDTO cookDTO) {
//        Cook cook=null;
//        cook=DTOConverter.cookDTOTOCook(cookDTO);
//        cookDao.uploadImage(cook);
//        
//        
//    }
    @Override
    @Transactional
    public void uploadImage(int id, String imageUrl, byte[] image) {
        cookDao.uploadImage(id, imageUrl, image);
    }

}
