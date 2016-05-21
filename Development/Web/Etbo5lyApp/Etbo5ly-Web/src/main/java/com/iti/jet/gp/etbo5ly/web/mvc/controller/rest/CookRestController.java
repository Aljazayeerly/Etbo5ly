/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iti.jet.gp.etbo5ly.web.mvc.controller.rest;

import com.iti.jet.gp.etbo5ly.service.dto.CookDTO;
import com.iti.jet.gp.etbo5ly.model.pojo.Cook;
import com.iti.jet.gp.etbo5ly.service.CookService;
import java.util.List;
import javax.ws.rs.QueryParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author salma
 */
@RestController
public class CookRestController {

    @Autowired
    CookService cookService;

    @RequestMapping(value = "/test/cooks", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<List<Cook>> getCooks() {
        System.out.println("in cooooooooooooooooook service controller");
        List<Cook> cooks = cookService.getAllCooks();

        return new ResponseEntity<List<Cook>>(cooks, HttpStatus.OK);
    }

    @RequestMapping(value = "/rest/cook/page", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<List<CookDTO>> getCooksByPage(@RequestParam(value = "page") int page) {
        List<CookDTO> cooks = cookService.getCooksByPage(page);

        if (cooks != null && cooks.size() != 0) {
            return new ResponseEntity<List<CookDTO>>(cooks, HttpStatus.OK);
        } else {
            return new ResponseEntity<List<CookDTO>>(cooks, HttpStatus.NOT_FOUND);
        }
    }


    @RequestMapping(value = "/rest/cooks/byRegion", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<List<CookDTO>> getCooksByRegion(@RequestParam(value = "region") int regionId) {

        List<CookDTO> cooks = cookService.getCooksByRegion(regionId);
        System.out.println("country size is: " + cooks.size());
        if (cooks != null && cooks.size() != 0) {
            return new ResponseEntity<List<CookDTO>>(cooks, HttpStatus.OK);
        } else {
            return new ResponseEntity<List<CookDTO>>(cooks, HttpStatus.NOT_FOUND);
        }
    }

    
    
    @RequestMapping(value="/nearbyCooks" , method=RequestMethod.GET, produces=MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<List<Cook>> getNearbyCooks(@RequestParam(value="long")Double cLongtitude,@RequestParam(value="latit")Double cLatitude){
        System.out.println("getting nearby cooks ");
        System.out.println("long is "+ cLongtitude+" latit is " + cLatitude);
        List<Cook> nearbyCooks=cookService.getAllNearbyCooks(cLongtitude, cLatitude);
        return new ResponseEntity<List<Cook>>(nearbyCooks,HttpStatus.OK);
    }
    
      @RequestMapping(value="/nearbyCooks2" , method=RequestMethod.GET, produces=MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<List<CookDTO>> getNearbyCooksDto(@RequestParam(value="long")Double cLongtitude,@RequestParam(value="latit")Double cLatitude){
        System.out.println("getting nearby cooks ");
        System.out.println("long is "+ cLongtitude+" latit is " + cLatitude);
        List<CookDTO> nearbyCooks=cookService.getAllNearbyCooksDTO(cLongtitude, cLatitude);
        return new ResponseEntity<List<CookDTO>>(nearbyCooks,HttpStatus.OK);
    }
    
}
