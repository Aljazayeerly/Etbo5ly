package com.iti.jet.gp.etbo5ly.model.dao.interfaces;

import com.iti.jet.gp.etbo5ly.model.pojo.Cook;
import com.iti.jet.gp.etbo5ly.model.generic.dao.GenericDao;
import com.iti.jet.gp.etbo5ly.model.pojo.Customer;
import java.util.List;

public interface CookDao extends GenericDao<Cook> {

    public List<Cook> getCooksPage(int page);

    public List<Cook> getCooksByRegion(int regionId);

    public Cook getCookByLocation(double longitude, double latitude);

    public Cook getCookData(int id);

    public Cook registerCook(Cook cook);

    public Cook CheckEmail(String email);
    
    public void insertCook(Cook cook);
    
    public int getCookId(String email);

}
