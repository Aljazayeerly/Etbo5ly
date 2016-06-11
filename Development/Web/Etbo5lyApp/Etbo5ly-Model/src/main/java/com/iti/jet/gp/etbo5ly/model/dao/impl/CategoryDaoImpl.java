package com.iti.jet.gp.etbo5ly.model.dao.impl;

import com.iti.jet.gp.etbo5ly.model.generic.dao.GenericDaoImpl;

import javax.annotation.PostConstruct;

import org.springframework.stereotype.Repository;

import com.iti.jet.gp.etbo5ly.model.pojo.Category;
import com.iti.jet.gp.etbo5ly.model.dao.interfaces.CategoryDao;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

@Repository("categoryDaoImpl")
public class CategoryDaoImpl extends GenericDaoImpl<Category> implements
        CategoryDao {

    @PostConstruct
    public void init() {
        System.out.println("hena fl init");
        super.setEntityClass(Category.class);
    }

    public CategoryDaoImpl() {
        super();
        // TODO Auto-generated constructor stub
    }

    @Override
    public List<Category> getCategoriesOfCookById(int cookId) {

        Session session = getHibernateTemplate().getSessionFactory().getCurrentSession();
        List<Category> categories = session.createCriteria(Category.class, "c").createAlias("c.menuItems", "cm").createAlias("cm.cook", "cc").add(Restrictions.eq("cc.id", cookId)).list();
        System.out.println("size of categories  : " + categories.size());
        return categories;
    }

}
