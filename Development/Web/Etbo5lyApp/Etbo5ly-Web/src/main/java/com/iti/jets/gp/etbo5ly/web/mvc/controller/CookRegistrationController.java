/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iti.jets.gp.etbo5ly.web.mvc.controller;

import com.iti.jet.gp.etbo5ly.service.dto.CookDocumentDTO;
import javax.validation.Valid;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author Nada
 */
@Controller
//@RequestMapping("/cooks")
public class CookRegistrationController {
    
//     @RequestMapping(method = RequestMethod.GET,value = "/")
//    public String initForm(Model model) {
//        CookDocumentDTO cook = new CookDocumentDTO();
//        model.addAttribute("cook", cook);
//        return "cookRegister";
//    }

    @RequestMapping(value = "/cook/joinus", method = RequestMethod.POST)
    public String RegisterCook(@ModelAttribute("cook")  CookDocumentDTO cook,BindingResult result) {
        System.out.println("inside cook Registeration Controller");
        System.out.println("cook name is " + cook.getName());
        System.out.println("cook email is " + cook.getEmail());
        System.out.println("cook password is " + cook.getPassword());
        System.out.println("cook region is " + cook.getRegionid());
        System.out.println("cook document type is " + cook.getDocumentId());
        System.out.println(" cook document is " + cook.getDocument());
        if (result.hasErrors()) {
            return "cookRegister";
        } else {
            return "login";
        }
    //    return null;
    }

}
