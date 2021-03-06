/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iti.jet.gp.etbo5ly.service;

import com.iti.jet.gp.etbo5ly.model.pojo.Customer;
import com.iti.jet.gp.etbo5ly.service.dto.CustomerDTO;

/**
 *
 * @author menna
 */
public interface CustomerService {

    public CustomerDTO signIn(String email, String password);
    public Customer signUp(CustomerDTO customer);
    public CustomerDTO checkEmail(String email);

}
