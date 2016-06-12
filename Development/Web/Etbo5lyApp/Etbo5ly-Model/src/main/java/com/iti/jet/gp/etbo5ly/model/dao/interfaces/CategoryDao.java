package com.iti.jet.gp.etbo5ly.model.dao.interfaces;

import com.iti.jet.gp.etbo5ly.model.generic.dao.GenericDao;
import com.iti.jet.gp.etbo5ly.model.pojo.Category;
import java.util.List;

public interface CategoryDao extends GenericDao<Category> {

    List<Category> getCategoriesOfCookById(int cookId);
}
