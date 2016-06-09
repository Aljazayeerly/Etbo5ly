/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iti.jet.gp.etbo5ly.model.dao.impl;

import com.iti.jet.gp.etbo5ly.model.dao.interfaces.RegionDao;
import com.iti.jet.gp.etbo5ly.model.generic.dao.GenericDaoImpl;
import com.iti.jet.gp.etbo5ly.model.pojo.Customer;
import com.iti.jet.gp.etbo5ly.model.pojo.Region;
import java.io.Serializable;
import java.util.List;
import javax.annotation.PostConstruct;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Nada
 */

@Repository("regionDaoImpl")
public class RegionDaoImpl  extends GenericDaoImpl<Region> implements RegionDao{

   
    @PostConstruct
    public void init() {
        System.out.println("hena fl init");
        super.setEntityClass(Region.class);
    }

    public RegionDaoImpl() {
        super();
    }
    
//    List<Region> getAllRegions(){
//      List  <Region> allRegions=(List  <Region>) getHibernateTemplate().getSessionFactory().getCurrentSession().createCriteria(Region.class).list();
//        
//        return allRegions;
//    }
}
