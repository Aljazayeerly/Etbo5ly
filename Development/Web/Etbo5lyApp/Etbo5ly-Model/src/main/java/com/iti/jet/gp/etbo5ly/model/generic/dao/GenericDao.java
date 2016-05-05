package com.iti.jet.gp.etbo5ly.model.generic.dao;

import java.io.Serializable;

public interface GenericDao <T>{


    T create(T t);

    void delete(Serializable id);

    Object find(Serializable id);

    T update(final T t); 
    

    
}
