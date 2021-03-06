/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.iti.jet.gp.etbo5ly.service;

import com.iti.jet.gp.etbo5ly.model.pojo.User;
import com.iti.jet.gp.etbo5ly.service.dto.LoginDTO;

/**
 *
 * @author AlJazayeerly
 */
public interface UserService {
    User loadUserByEmail(String email);
    User loginIn(LoginDTO loginDTO);
    User checkEmail(String email);
}
