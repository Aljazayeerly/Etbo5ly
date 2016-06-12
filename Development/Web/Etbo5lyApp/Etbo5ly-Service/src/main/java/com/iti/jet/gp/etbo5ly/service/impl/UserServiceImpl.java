/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iti.jet.gp.etbo5ly.service.impl;

import com.iti.jet.gp.etbo5ly.model.dao.interfaces.UserDao;
import com.iti.jet.gp.etbo5ly.model.pojo.Customer;
import com.iti.jet.gp.etbo5ly.model.pojo.User;
import com.iti.jet.gp.etbo5ly.service.UserService;
import com.iti.jet.gp.etbo5ly.service.dto.LoginDTO;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author AlJazayeerly
 */
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    UserDao userDao;

    @Override
    public User loadUserByEmail(String email) {
        return userDao.getUserByEmail(email);
    }

    @Override
    public User loginIn(LoginDTO loginDTO) {
        return userDao.getUserByEmailAndPassword(loginDTO.getEmail(), loginDTO.getPassword());
    }

    @Override
    @Transactional
    public User checkEmail(String email) {
        User user = userDao.checkEmail(email);
        if (user != null) {
            return user;
        } else {
            return null;
        }

    }

}
