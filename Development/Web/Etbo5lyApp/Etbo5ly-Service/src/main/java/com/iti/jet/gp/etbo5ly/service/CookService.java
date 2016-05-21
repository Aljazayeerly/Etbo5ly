/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iti.jet.gp.etbo5ly.service;

import com.iti.jet.gp.etbo5ly.service.dto.CookDTO;
import com.iti.jet.gp.etbo5ly.model.pojo.Cook;
import java.util.List;

/**
 *
 * @author salma
 */
public interface CookService {
      public List<Cook> getAllCooks();
      public List<CookDTO> getAllCookDTOs();
<<<<<<< HEAD
      public List<Cook> getAllNearbyCooks(double Clongtitude,double Clatitude);
      public List<CookDTO> getAllNearbyCooksDTO(double cLongtitude,double cLatitude);
=======
      List<CookDTO> getCooksByPage(int page);
>>>>>>> 6b0afbfb3c0b5b931b7d5e887740282367dad435
}
