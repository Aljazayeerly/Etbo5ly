package titles.mvc.controllers.rest;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.UriComponentsBuilder;
import titles.exceptions.UserExistsException;
import titles.model.pojos.Title;
import titles.model.pojos.User;
import titles.model.pojos.UserRating;
import titles.service.TitleService;
import titles.service.UserService;

@RestController
public class UserRestController {

    @Autowired
    UserService userService;

    @Autowired
    TitleService titleService;

    //-------------------Retrieve Single User--------------------------------------------------------
    @RequestMapping(value = "/user/{email}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<User> getUser(@PathVariable("email") String email) {
        System.out.println("Fetching User with id " + email);
        User user = new User();
        user.setEmail(email);
        User user1 = userService.login(user);
        if (user1 == null) {
            System.out.println("User with id " + email + " not found");
            return new ResponseEntity<User>(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<User>(user1, HttpStatus.OK);
    }

    //create user
    @RequestMapping(value = "/user/", method = RequestMethod.POST)
    public ResponseEntity<Void> createUser(@RequestBody User user, UriComponentsBuilder ucBuilder) {
        System.out.println("Creating User " + user.getEmail());

        boolean userExist = userService.isUserExist(user);
        if (userExist) {
            System.out.println("A User with name " + user.getEmail() + " already exist");
            return new ResponseEntity<Void>(HttpStatus.CONFLICT);
        }

        try {
            user.setEnables(true);
            userService.signup(user);
        } catch (UserExistsException ex) {
            Logger.getLogger(UserRestController.class.getName()).log(Level.SEVERE, null, ex);
        }

        HttpHeaders headers = new HttpHeaders();
        headers.setLocation(ucBuilder.path("/user/{id}").buildAndExpand(user.getId()).toUri());
        return new ResponseEntity<Void>(headers, HttpStatus.CREATED);
    }

    //retrieve all titles// used by normal user and admin
    @RequestMapping(value = "/title", method = RequestMethod.GET)
    public ResponseEntity<List<Title>> listAllTitles() {
        List<Title> titles = titleService.retrieveAllTitles();
        if (titles.isEmpty()) {
            return new ResponseEntity<List<Title>>(HttpStatus.NO_CONTENT);//You many decide to return HttpStatus.NOT_FOUND
        }
        return new ResponseEntity<List<Title>>(titles, HttpStatus.OK);
    }

    //used by normal user
    //-------------------Retrieve Single Title-------------------------------------------------------
    @RequestMapping(value = "/title/{id}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Title> getTitle(@PathVariable("id") int id) {
        System.out.println("Fetching Title with id " + id);
        Title title = new Title(id);
        Title retrievedTitle = titleService.retrieveTitle(title);
        if (retrievedTitle == null) {
            System.out.println("Title with id " + id + " not found");
            return new ResponseEntity<Title>(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<Title>(retrievedTitle, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/title/search/{searchString}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<List<Title>> getTitle(@PathVariable("searchString") String searchString ) {
        System.out.println("Fetching Title with name " + searchString);
        List<Title> retrievedTitles = userService.searchTitlesByTitleName(searchString);
        if (retrievedTitles == null) {
            System.out.println("Someting went wrong null values");
            return new ResponseEntity<List<Title>>(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<List<Title>>(retrievedTitles, HttpStatus.OK);
    }

    //used by normal user -- it rate of user doesn't exist it will create the rate and 
    //if exist it will update it based on values sent by the customer
    //you can add comment and rating one of them or none and update
    //-------------------rate and comment on title-------------------------------------------------------
    @RequestMapping(value = "/rating/{user}/{title}", method = RequestMethod.POST)
    public ResponseEntity<Void> rateAndComment(@RequestParam(value = "rate", required = false) Short rate, @PathVariable("user") int userId, @RequestParam(value = "comment", required = false) String comment, @PathVariable("title") int titleId, UriComponentsBuilder ucBuilder) {

        System.out.println("user with id: " + userId + " has just rated title with id: " + titleId + " with rate: " + rate + " and commented: " + comment);

        //check if this user has rating on this title
        UserRating retrievedUserRating = userService.userhasRateOntitle(userId, titleId);

        if (retrievedUserRating == null) {
            UserRating newRating = new UserRating();
            newRating.setUser(new User(userId));
            newRating.setTitle(new Title(titleId));
            newRating.setComment(comment);
            newRating.setRating(rate);
            userService.addRate(newRating);

        } else {

            if (comment != null) {
                retrievedUserRating.setComment(comment);

            }
            if (rate != null) {
                retrievedUserRating.setRating(rate);
            }
            userService.updateRate(retrievedUserRating);
        }

        HttpHeaders headers = new HttpHeaders();
        return new ResponseEntity<Void>(headers, HttpStatus.CREATED);
    }

    
    // this part is under work now
    /*@RequestMapping(value = "/login", method = RequestMethod.GET)
    public ModelAndView login(
            @RequestParam(value = "error", required = false) String error,
            @RequestParam(value = "logout", required = false) String logout) {

        ModelAndView model = new ModelAndView();
        if (error != null) {
            model.addObject("error", "Invalid username and password!");
        }

        if (logout != null) {
            model.addObject("msg", "You've been logged out successfully.");
        }
        model.setViewName("login");

        return model;

    }*/

    // logout with spring security
    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logOut(HttpServletRequest request, HttpServletResponse response) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication != null) {
            new SecurityContextLogoutHandler().logout(request, response, authentication);
        }
        return "redirect:/login";
    }

}
