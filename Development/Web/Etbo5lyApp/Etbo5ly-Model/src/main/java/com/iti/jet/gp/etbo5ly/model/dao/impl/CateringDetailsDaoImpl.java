package  com.iti.jet.gp.etbo5ly.model.dao.impl;

import  com.iti.jet.gp.etbo5ly.model.generic.dao.GenericDaoImpl;

import javax.annotation.PostConstruct;

import org.springframework.stereotype.Repository;

import com.iti.jet.gp.etbo5ly.model.pojo.CateringDetails;
import com.iti.jet.gp.etbo5ly.model.dao.interfaces.CateringDetailsDao;

@Repository("cateringDetailsDaoImpl")
public class CateringDetailsDaoImpl extends GenericDaoImpl<CateringDetails> implements
CateringDetailsDao{
	
	  @PostConstruct
      public void init(){
		  System.out.println("hena fl init");
         super.setEntityClass(CateringDetails.class);
      }


	public CateringDetailsDaoImpl() {
		super();
		// TODO Auto-generated constructor stub
	}

	

}
