/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iti.jet.gp.etbo5ly.service.impl;

import com.iti.jet.gp.etbo5ly.model.dao.interfaces.CategoryDao;
import com.iti.jet.gp.etbo5ly.model.dao.interfaces.CountryDao;
import com.iti.jet.gp.etbo5ly.model.dao.interfaces.RegionDao;
import com.iti.jet.gp.etbo5ly.model.pojo.Category;
import com.iti.jet.gp.etbo5ly.model.pojo.Country;
import com.iti.jet.gp.etbo5ly.model.pojo.Region;
import com.iti.jet.gp.etbo5ly.service.RegionService;
import com.iti.jet.gp.etbo5ly.service.TestService;
import java.util.ArrayList;
import java.util.Collection;
import java.util.LinkedHashSet;
import java.util.List;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author AlJazayeerly
 */
@Service
public class RegionServiceImpl implements RegionService {

    @Autowired
    CountryDao countryDao;
    
    @Autowired
    RegionDao regionDao;

    @Override
    @Transactional
    public List<Country> getAllCountries() {
        
        // This step becuase hibernate retieve data redunant based on outer join that is generated
        // when you set fetch strategy to eager with collection 
        Collection<Country> result = new LinkedHashSet(countryDao.getAll());
        List<Country> filteredResult = new ArrayList<>();
        filteredResult.addAll(0, result);

        return filteredResult;
    }

    @Override
    @Transactional
    public List<Region> getAllRegions() {
        System.out.println("inside all Region service");
        List<Region> allRegion = regionDao.getAll();
        return allRegion;
       
    }

}
