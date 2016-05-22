package titles.service;


import java.util.List;
import titles.exceptions.UserExistsException;
import titles.model.pojos.Title;
import titles.model.pojos.User;
import titles.model.pojos.UserRating;

public interface UserService {
	public User login(User user);
        public void signup(User user) throws UserExistsException;
        public boolean isUserExist(User user);
        public void addRate(UserRating rating);
        public void updateRate(UserRating rating);
        public UserRating userhasRateOntitle(int userId,int titleId);
        public List<Title> searchTitlesByTitleName(String titleName);
        
}
