package com.iti.jet.gp.etbo5ly.model.generic.dao;

import java.io.Serializable;
import java.util.List;

public interface GenericDao <T>{


    T create(T t);

    void delete(Serializable id);

    T find(Serializable id);

    void update(final T t);
    
    List<T> getAll();
    

    
}
