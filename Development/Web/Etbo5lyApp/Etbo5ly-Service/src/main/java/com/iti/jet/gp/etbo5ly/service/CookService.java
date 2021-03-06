/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iti.jet.gp.etbo5ly.service;

import com.iti.jet.gp.etbo5ly.service.dto.CookDTO;
import com.iti.jet.gp.etbo5ly.model.pojo.Cook;
import com.iti.jet.gp.etbo5ly.service.dto.CookDocumentDTO;
import com.iti.jet.gp.etbo5ly.service.dto.CustomerDTO;
import java.util.List;

/**
 *
 * @author salma
 */
public interface CookService {

    List<CookDTO> getCooksByPage(int page);

    List<CookDTO> getCooksByRegion(int regionId);

    public List<Cook> getAllCooks();

    public List<CookDTO> getAllCookDTOs();

    public List<Cook> getAllNearbyCooks(double Clongtitude, double Clatitude);

    public List<CookDTO> getAllNearbyCooksDTO(double cLongtitude, double cLatitude);

    public Cook getCookByLocation(double cLongtitude, double cLatitude);

    public CookDTO getCookDataForProfile(int cookId);

    public void changeCookStatus(Cook cook);

    public CookDTO registerCook(CookDTO cook);

    public CookDTO checkEmail(String email);

    public void insertCook(CookDocumentDTO cook);

    public int getCookId(String email);

    public Cook findById(int id);

    public void uploadImage(int id,String imageUrl,byte[] image);

}
