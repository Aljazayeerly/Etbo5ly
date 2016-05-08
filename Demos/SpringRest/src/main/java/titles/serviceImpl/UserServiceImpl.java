package titles.serviceImpl;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import titles.exceptions.UserExistsException;
import titles.model.daos.TitleJpaController;

import titles.model.daos.UserJpaController;
import titles.model.daos.UserRatingJpaController;
import titles.model.pojos.Title;
import titles.model.pojos.User;
import titles.model.pojos.UserRating;
import titles.service.UserService;

@Service
public class UserServiceImpl implements UserService {

   @Autowired
    UserJpaController userJpaController;
   
   @Autowired
   UserRatingJpaController userRatingJpaController;
   
   @Autowired
   TitleJpaController titleJpaController;
   
  
    @Transactional
    public User login(User user) {
        return userJpaController.findByEmail(user.getEmail());
    }

    @Transactional
    public void signup(User user) throws UserExistsException{
        userJpaController.create(user);
    }

    public boolean isUserExist(User user) {

        User checkUserExit=userJpaController.findByEmail(user.getEmail());
        if(checkUserExit!=null)
            return true;
        else 
            return false;
    }

    @Transactional
    public void addRate(UserRating rating) {
       try {
           userRatingJpaController.create(rating);
       } catch (Exception ex) {
           Logger.getLogger(UserServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
       }
    
    }

    public UserRating userhasRateOntitle(int userId, int titleId) {

       return userRatingJpaController.findUserRatingforTitle(userId, titleId);
    }

    @Transactional
    public void updateRate(UserRating rating) {
       try {
           userRatingJpaController.edit(rating);
       } catch (Exception ex) {
           Logger.getLogger(UserServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
       }
    }

    public List<Title> searchTitlesByTitleName(String titleName) {
        return titleJpaController.findTitlesByTitle(titleName);
    }
    
    

}
