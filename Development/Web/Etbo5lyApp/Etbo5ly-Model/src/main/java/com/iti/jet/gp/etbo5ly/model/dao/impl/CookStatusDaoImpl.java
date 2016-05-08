package  com.iti.jet.gp.etbo5ly.model.dao.impl;

import  com.iti.jet.gp.etbo5ly.model.generic.dao.GenericDaoImpl;

import javax.annotation.PostConstruct;

import org.springframework.stereotype.Repository;

import com.iti.jet.gp.etbo5ly.model.pojo.CookStatus;
import com.iti.jet.gp.etbo5ly.model.dao.interfaces.CookStatusDao;

@Repository("cookStatusDaoImpl")
public class CookStatusDaoImpl extends GenericDaoImpl<CookStatus> implements
CookStatusDao{
	
	
	 @PostConstruct
     public void init(){
		  System.out.println("hena fl init");
        super.setEntityClass(CookStatus.class);
     }
	 


	public CookStatusDaoImpl() {
		super();
		// TODO Auto-generated constructor stub
	}

	



}
