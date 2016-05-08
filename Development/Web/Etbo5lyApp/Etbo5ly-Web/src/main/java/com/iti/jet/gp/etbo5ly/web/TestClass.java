/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.iti.jet.gp.etbo5ly.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author AlJazayeerly
 */
@Controller
public class TestClass {
	
	 @RequestMapping(value="/home.htm")
	    public String index() {
	        return "home";
	    }
}
