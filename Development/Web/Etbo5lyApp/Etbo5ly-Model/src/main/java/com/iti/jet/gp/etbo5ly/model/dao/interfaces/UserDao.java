package com.iti.jet.gp.etbo5ly.model.dao.interfaces;

import com.iti.jet.gp.etbo5ly.model.pojo.User;
import com.iti.jet.gp.etbo5ly.model.generic.dao.GenericDao;


public interface UserDao extends GenericDao<User>{
    public User getUserByEmail(String email);
    public User getUserByEmailAndPassword(String email,String password);
}
