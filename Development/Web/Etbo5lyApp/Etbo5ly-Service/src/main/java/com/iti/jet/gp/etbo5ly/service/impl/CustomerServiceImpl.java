/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iti.jet.gp.etbo5ly.service.impl;

import com.iti.jet.gp.etbo5ly.model.dao.interfaces.CustomerDao;
import com.iti.jet.gp.etbo5ly.model.pojo.Customer;
import com.iti.jet.gp.etbo5ly.service.CustomerService;
import com.iti.jet.gp.etbo5ly.service.dto.CustomerDTO;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;

/**
 *
 * @author menna
 */
public class CustomerServiceImpl implements CustomerService {

    @Autowired
    CustomerDao customerDao;

    @Override
    public CustomerDTO signIn(String email, String password) {

        Customer customer = customerDao.signIn(email, password);

        ModelMapper modelMapper = new ModelMapper();

        CustomerDTO customerDTO = modelMapper.map(customer, CustomerDTO.class);

        return customerDTO;
    }

}
