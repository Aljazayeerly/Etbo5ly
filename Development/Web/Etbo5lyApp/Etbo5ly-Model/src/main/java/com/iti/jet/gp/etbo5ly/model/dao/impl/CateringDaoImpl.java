package  com.iti.jet.gp.etbo5ly.model.dao.impl;

import  com.iti.jet.gp.etbo5ly.model.generic.dao.GenericDaoImpl;

import javax.annotation.PostConstruct;

import org.springframework.stereotype.Repository;

import com.iti.jet.gp.etbo5ly.model.pojo.Catering;
import com.iti.jet.gp.etbo5ly.model.dao.interfaces.CateringDao;

@Repository("cateringDaoImpl")
public class CateringDaoImpl extends GenericDaoImpl<Catering> implements
CateringDao{
	
	  @PostConstruct
      public void init(){
		  System.out.println("hena fl init");
         super.setEntityClass(Catering.class);
      }



	public CateringDaoImpl() {
		super();
		// TODO Auto-generated constructor stub
	}



	



}
