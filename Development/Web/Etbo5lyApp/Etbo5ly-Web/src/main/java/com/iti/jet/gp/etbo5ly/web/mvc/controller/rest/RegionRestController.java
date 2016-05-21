/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iti.jet.gp.etbo5ly.web.mvc.controller.rest;

import com.iti.jet.gp.etbo5ly.model.dao.interfaces.CountryDao;
import com.iti.jet.gp.etbo5ly.model.pojo.Category;
import com.iti.jet.gp.etbo5ly.model.pojo.Country;
import com.iti.jet.gp.etbo5ly.service.RegionService;
import com.iti.jet.gp.etbo5ly.service.TestService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author AlJazayeerly
 */
@RestController
public class RegionRestController {

    @Autowired
    RegionService regionService;

    @RequestMapping(value = "/rest/countries", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<List<Country>> getCountries() {

        List<Country> countries = regionService.getAllCountries();
        System.out.println("country size is: "+countries.size());
        if(countries !=null && countries.size() !=0)
            return new ResponseEntity<List<Country>>(countries, HttpStatus.OK);
        else
            return new ResponseEntity<List<Country>>(countries,HttpStatus.NOT_FOUND);
    }
}
