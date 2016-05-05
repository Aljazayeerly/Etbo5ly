package  com.iti.jet.gp.etbo5ly.model.dao.impl;

import  com.iti.jet.gp.etbo5ly.model.generic.dao.GenericDaoImpl;

import javax.annotation.PostConstruct;

import org.springframework.stereotype.Repository;

import  com.iti.jet.gp.etbo5ly.model.pojos.Category;
import  com.iti.jet.gp.etbo5ly.model.dao.interfaces.CategoryDao;

@Repository("categoryDaoImpl")
public class CategoryDaoImpl extends GenericDaoImpl<Category> implements
CategoryDao{
	
	  @PostConstruct
      public void init(){
		  System.out.println("hena fl init");
         super.setEntityClass(Category.class);
      }

	public CategoryDaoImpl() {
		super();
		// TODO Auto-generated constructor stub
	}

	





}
