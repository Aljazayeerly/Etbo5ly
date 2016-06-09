package com.iti.jet.gp.etbo5ly.model.dao.interfaces;


import com.iti.jet.gp.etbo5ly.model.generic.dao.GenericDao;
import com.iti.jet.gp.etbo5ly.model.pojo.Customer;

public interface CustomerDao extends GenericDao<Customer>{

    public Customer signIn(String email, String password);
    public Customer signUp(Customer customer);
    public Customer CheckEmail(String email);

}
