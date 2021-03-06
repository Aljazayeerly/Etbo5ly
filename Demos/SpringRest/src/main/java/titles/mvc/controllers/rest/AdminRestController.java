package titles.mvc.controllers.rest;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.util.UriComponentsBuilder;
import titles.exceptions.UserExistsException;
import titles.model.pojos.Title;
import titles.model.pojos.User;
import titles.model.pojos.UserRating;
import titles.service.TitleService;
import titles.service.UserService;

@RestController
public class AdminRestController {
    
    @Autowired
    UserService userService;
    
    @Autowired
    TitleService titleService;

    // delete titles usedby admin
    @RequestMapping(value = "/admin/title/delete/{titleId}", method = RequestMethod.POST)
    public ResponseEntity<Title> deleteTitle(@PathVariable("titleId") int id) {
        
        System.out.println("Fetching & Deleting Title with id " + id);
        
        Title title = titleService.retrieveTitle(new Title(id));
        if (title == null) {
            System.out.println("Unable to delete. title with id " + id + " not found");
            return new ResponseEntity<Title>(HttpStatus.NOT_FOUND);
        }
        
        titleService.delete(title);
        return new ResponseEntity<Title>(HttpStatus.OK);
    }

    //update title used by admin
    //------------------- Update a User --------------------------------------------------------
    @RequestMapping(value = "admin/title/update/{id}", method = RequestMethod.POST)
    public ResponseEntity<Title> updateUser(@PathVariable("id") int id, @RequestBody Title title) {
        System.out.println("Updating title " + id);
        
        Title titleToBeUpdated = titleService.retrieveTitle(title);
        if (titleToBeUpdated == null) {
            System.out.println("Title with id " + id + " not found");
            return new ResponseEntity<Title>(HttpStatus.NOT_FOUND);
        }

        // updating title with new data
        titleToBeUpdated.setActors(title.getActors());
        titleToBeUpdated.setAwards(title.getAwards());
        titleToBeUpdated.setCountry(title.getCountry());
        titleToBeUpdated.setDirector(title.getCountry());
        titleToBeUpdated.setGenre(title.getGenre());
        titleToBeUpdated.setImdbId(title.getImdbId());
        titleToBeUpdated.setImdbrating(title.getImdbrating());
        titleToBeUpdated.setImdbvotes(title.getImdbvotes());
        titleToBeUpdated.setLanguage(title.getLanguage());
        titleToBeUpdated.setPlot(title.getPlot());
        titleToBeUpdated.setPoster(title.getPoster());
        titleToBeUpdated.setRated(title.getRated());
        titleToBeUpdated.setReleased(title.getReleased());
        titleToBeUpdated.setRuntime(title.getRuntime());
        titleToBeUpdated.setTitle(title.getTitle());
        titleToBeUpdated.setType(title.getType());
        titleToBeUpdated.setWriter(title.getWriter());
        titleToBeUpdated.setYear(title.getYear());
        
        titleService.update(titleToBeUpdated);
        return new ResponseEntity<Title>(titleToBeUpdated, HttpStatus.OK);
    }

    // add title
    //create user
    @RequestMapping(value = "/admin/create/title", method = RequestMethod.POST)
    public ResponseEntity<Void> createTitle(@RequestBody Title title, UriComponentsBuilder ucBuilder) {
        System.out.println("Creating titles " + title.getTitle());
        
        titleService.addTitle(title);
        
        HttpHeaders headers = new HttpHeaders();
        return new ResponseEntity<Void>(headers, HttpStatus.CREATED);
    }
}
