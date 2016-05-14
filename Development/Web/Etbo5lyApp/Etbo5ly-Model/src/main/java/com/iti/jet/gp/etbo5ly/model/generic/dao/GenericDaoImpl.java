package com.iti.jet.gp.etbo5ly.model.generic.dao;

import java.io.Serializable;
import java.util.List;
import javax.transaction.Transactional;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.DetachedCriteria;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Component;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.TransactionCallback;
import org.springframework.transaction.support.TransactionTemplate;

@Component("genericDaoImpl")
public abstract class GenericDaoImpl<T> implements GenericDao<T> {

    private Class<T> entityClass;

    @Autowired
    HibernateTemplate hibernateTemplate;

    @Autowired
    TransactionTemplate transactionTemplate;

    public GenericDaoImpl() {

    }

    public HibernateTemplate getHibernateTemplate() {
        return hibernateTemplate;
    }

    public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
        this.hibernateTemplate = hibernateTemplate;
    }

    public Class<T> getEntityClass() {
        return entityClass;
    }

    public void setEntityClass(final Class<T> entityClass) {
        this.entityClass = entityClass;
        System.out.println("Entity class in setter : " + this.entityClass);

    }

    public TransactionTemplate getTransactionTemplate() {
        return transactionTemplate;
    }

    public void setTransactionTemplate(TransactionTemplate transactionTemplate) {
        this.transactionTemplate = transactionTemplate;
    }

//    protected Session getSession() {
//        return getSessionFactory().getCurrentSession();
//    }
    public T create(T t) {

        getHibernateTemplate().persist(t);

        return t;

    }

    public void delete(final Serializable id) {

        T t = (T) getHibernateTemplate().get(entityClass, id);

        getHibernateTemplate().delete(t);

    }

    public T find(final Serializable id) {

        System.out.println("get Entity class in find : " + this.getEntityClass());

        T t = (T) getHibernateTemplate().get(entityClass, id);

        return t;
    }

    
    public void update(final T t) {

        getHibernateTemplate().saveOrUpdate(t);

    }

    public List<T> getAll() {
        return (List<T>) transactionTemplate.execute(new TransactionCallback<Object>() {

            @Override
            public Object doInTransaction(TransactionStatus ts) {
                System.out.println("get all generic");
                return getHibernateTemplate().findByCriteria(DetachedCriteria.forClass(entityClass));

            }
        });
    }

}
