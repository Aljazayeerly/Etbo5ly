package com.iti.jet.gp.etbo5ly.model.dao.impl;

import com.iti.jet.gp.etbo5ly.model.generic.dao.GenericDaoImpl;

import javax.annotation.PostConstruct;

import org.springframework.stereotype.Repository;

import com.iti.jet.gp.etbo5ly.model.pojo.MenuItems;
import com.iti.jet.gp.etbo5ly.model.dao.interfaces.MenuItemsDao;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.HibernateCallback;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.TransactionCallback;
import org.springframework.transaction.support.TransactionTemplate;

@Repository("menuItemsDaoImpl")
public class MenuItemsDaoImpl extends GenericDaoImpl<MenuItems> implements
        MenuItemsDao {

//	@PersistenceContext
//    private EntityManager entityManager;
//
//    public EntityManager getEntityManager() {
//        return entityManager;
//    }
    @Autowired
    HibernateTemplate hibernateTemplate;

    @Autowired
    TransactionTemplate transactionTemplate;

    public HibernateTemplate getHibernateTemplate() {
        return hibernateTemplate;
    }

    public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
        this.hibernateTemplate = hibernateTemplate;
    }

    public TransactionTemplate getTransactionTemplate() {
        return transactionTemplate;
    }

    public void setTransactionTemplate(TransactionTemplate transactionTemplate) {
        this.transactionTemplate = transactionTemplate;
    }

    @PostConstruct
    public void init() {
        System.out.println("hena fl init");
        super.setEntityClass(MenuItems.class);
    }

    public MenuItemsDaoImpl() {
        super();
        // TODO Auto-generated constructor stub
    }

    @Override
    public List<MenuItems> searchByMealName(final String mealName) {
        return (List<MenuItems>) transactionTemplate.execute(new TransactionCallback<Object>() {

            @Override
            public Object doInTransaction(TransactionStatus ts) {

                return hibernateTemplate.findByCriteria(DetachedCriteria.forClass(MenuItems.class).add((Restrictions.eq("nameEn", mealName))));

            }
        });
    }

    @Override
    public List<MenuItems> getMenuItemsPage(int page) {

        final int pageSize = 5;
        final int max = page * pageSize;
        final int min = max - pageSize;

        return (List<MenuItems>) hibernateTemplate.execute(new HibernateCallback<Object>() {

            @Override
            public Object doInHibernate(Session sn) throws HibernateException {
                Criteria criteria = sn.createCriteria(MenuItems.class, "mi");
                criteria.setFirstResult(min);
                criteria.setMaxResults(max);
                return criteria.list();

            }
        });
    }

    @Override
    public List<MenuItems> getMealsOfCateogry(final int categoryID) {
        return (List<MenuItems>) transactionTemplate.execute(new TransactionCallback<Object>() {

            @Override
            public Object doInTransaction(TransactionStatus ts) {

                return hibernateTemplate.findByCriteria(DetachedCriteria.forClass(MenuItems.class, "item").createAlias("item.categories", "categories").add((Restrictions.eq("categories.categoryId", categoryID))));

            }
        });
    }

}
