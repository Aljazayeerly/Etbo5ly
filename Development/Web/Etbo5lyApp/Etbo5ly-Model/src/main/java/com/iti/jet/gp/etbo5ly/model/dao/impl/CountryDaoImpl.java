package com.iti.jet.gp.etbo5ly.model.dao.impl;

import com.iti.jet.gp.etbo5ly.model.generic.dao.GenericDaoImpl;
import javax.annotation.PostConstruct;
import org.springframework.stereotype.Repository;
import com.iti.jet.gp.etbo5ly.model.dao.interfaces.CountryDao;
import com.iti.jet.gp.etbo5ly.model.pojo.Country;

@Repository("countryDaoImpl")
public class CountryDaoImpl extends GenericDaoImpl<Country> implements CountryDao {

    @PostConstruct
    public void init() {
        System.out.println("hena fl init");
        super.setEntityClass(Country.class);
    }

    public CountryDaoImpl() {
        super();
        // TODO Auto-generated constructor stub
    }

}
