/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package spring.mvc.view.controller;

/**
 *
 * @author AlJazayeerly
 */
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import pojo.Person;
@Controller
public class SpringTilesController {
    @RequestMapping(value="/index.htm")
    public String index() {
        return "index";
    }
    @RequestMapping(value="/viewPeson.htm")
    public ModelAndView viewPersons(Model model) {
        Map<String, List<Person>> persons =
                new HashMap<String, List<Person>>();
        persons.put("persons", Person.createPersons());
        return new ModelAndView("personList", persons);
    }
}