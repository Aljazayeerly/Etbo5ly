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
import javax.transaction.Transactional;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author menna
 */
@Service
public class CustomerServiceImpl implements CustomerService {

    @Autowired
    CustomerDao customerDao;

    @Override
    @Transactional
    public CustomerDTO signIn(String email, String password) {

        Customer customer = customerDao.signIn(email, password);

        ModelMapper modelMapper = new ModelMapper();

        CustomerDTO customerDTO = modelMapper.map(customer, CustomerDTO.class);

        return customerDTO;
    }

    @Override
    @Transactional
    public Customer signUp(CustomerDTO customer) {
        System.out.println("sign up service ");
        ModelMapper modelMapper = new ModelMapper();
        Customer newCustomer = modelMapper.map(customer, Customer.class);
        Customer customer1 = customerDao.signUp(newCustomer);
        return customer1;
    }

    @Override
    @Transactional
    public CustomerDTO checkEmail(String email) {
        ModelMapper modelMapper = new ModelMapper();
        Customer customer = customerDao.CheckEmail(email);
        if (customer != null) {
          //  System.out.println("inside customer not equal null");
            CustomerDTO newCustomerDTO = modelMapper.map(customer, CustomerDTO.class);
            return newCustomerDTO;
        } else {
           // System.out.println("inside customer  equal null");
            return null;
        }
    }

}
