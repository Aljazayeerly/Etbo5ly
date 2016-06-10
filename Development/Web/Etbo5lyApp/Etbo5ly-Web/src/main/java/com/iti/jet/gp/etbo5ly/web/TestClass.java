/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iti.jet.gp.etbo5ly.web;

import javax.ws.rs.QueryParam;
import jdk.nashorn.internal.ir.annotations.Reference;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author salma
 */
@Controller
public class TestClass {

    
    @RequestMapping(value = "/login.htm", method = RequestMethod.GET)
    public String login(@RequestParam(value = "error", required = false) String error,
            @RequestParam(value = "logout", required = false) String logout, Model model) {

        if (error != null) {
            model.addAttribute("error", error+"invalid user name and password");
        }

        if (logout != null) {
            model.addAttribute("msg", "You've been logged out successfully.");
        }

        return "login";

    }

    //for 403 access denied page
    @RequestMapping(value = "/403", method = RequestMethod.GET)
    public ModelAndView accesssDenied() {

        ModelAndView model = new ModelAndView();

        //check if user is login
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (!(auth instanceof AnonymousAuthenticationToken)) {
            UserDetails userDetail = (UserDetails) auth.getPrincipal();
            model.addObject("username", userDetail.getUsername());
        }

        model.setViewName("403");
        return model;

    }

    @RequestMapping(value = "/home.htm")
    public String index() {
        return "home";
    }

    @RequestMapping(value = "/register.htm")
    public String register() {
        return "register";
    }

    @RequestMapping(value = "/orderReview.htm")
    public String orderReview() {
        return "orderReview";
    }

    @RequestMapping(value = "/login.htm")
    public String login() {
        return "login";
    }

    @RequestMapping(value = "/kitchen.htm")
    public String showKitchens() {
        return "kitchen";
    }

    @RequestMapping(value = "/neighbouringKitchen.htm")
    public String neighbouringKitchens() {
        return "neighbouringKitchens";
    }

    @RequestMapping(value = "/cart.htm")
    public String cart() {
        return "cart";
    }

    @RequestMapping(value = "/cooksInformation.htm")
    public String cookInformation() {
        return "cookInfo";
    }

    @RequestMapping(value = "/orderReview2.htm")
    public String orderReview2() {
        return "orderReview2";

    }

    @RequestMapping(value = "/customerOrders.htm")
    public String customerOrders() {
        return "customerOrders";
    }

    @RequestMapping(value = "/customerOrder.htm")
    public String customerOrder() {
        return "customerOrder";
    }

    @RequestMapping(value = "/cookKitchen.htm")
    @QueryParam("id")
    public String cookKitchen(@RequestParam(value = "id") int id) {
        return "cookKitchen";

    }

    @RequestMapping(value = "/orderReviewDialog.htm")
    public String orderReviewDialog() {
        return "orderReviewDialog";
    }

    @RequestMapping(value = "/addressDetailsDialog.htm")

    public String addressDetailsDialog() {
        return "addressDetailsDialog";
    }

    @RequestMapping(value = "/customerOrderDialog.htm")
    public String customerOrderDialog() {
        return "customerOrderDialog";
    }

    @RequestMapping(value = "/orderDialog.htm")
    public String orderDialog() {
        return "orderDialog";
    }

    @RequestMapping(value = "/customerOrderRatingDialog.htm")
    public String customerOrderRatingDialog() {
        return "customerOrderRatingDialog";
    }

    @RequestMapping(value = "/cookOrders.htm")
    public String cookOrders() {
        return "cookOrders";
    }

    @RequestMapping(value = "/cookOrderDialog.htm")
    public String cookOrderDialog() {
        return "cookOrderDialog";
    }

    @RequestMapping(value = "/cookOrderRatingDialog.htm")
    public String cookOrderRatingDialog() {
        return "cookOrderRatingDialog";
    }

    @RequestMapping(value = "/joinUS.htm")
    public String cookRegister() {
        return "cookRegister";
    }
    
     @RequestMapping(value = "/cookProfile.htm")
    public String cookProfile() {
        return "cookProfile";

    }
}
