/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iti.jet.gp.etbo5ly.web.util;

import com.iti.jet.gp.etbo5ly.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;

/**
 *
 * @author AlJazayeerly
 */
@Component
public class LoggedInUserChecker {

    @Autowired
    UserService userService;

    public com.iti.jet.gp.etbo5ly.model.pojo.User getLoggedUser() {
        try {
            org.springframework.security.core.userdetails.User userDetails = (org.springframework.security.core.userdetails.User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
            return userService.loadUserByEmail(userDetails.getUsername());

        } catch (Exception e) {
            return null;
        }

    }
}
