package  com.iti.jet.gp.etbo5ly.model.generic.dao;

import java.io.Serializable;
import java.util.List;
import javax.transaction.Transactional;
import org.hibernate.Session;
import org.hibernate.SessionFactory;



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
    SessionFactory sessionFactory;

    public GenericDaoImpl() {

    }

    public Class<T> getEntityClass() {
        return entityClass;
    }

    public void setEntityClass(final Class<T> entityClass) {
        this.entityClass = entityClass;
        System.out.println("Entity class in setter : " + this.entityClass);

    }

    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    protected Session getSession() {
        return getSessionFactory().getCurrentSession();
    }

    @Transactional
    public T create(T t) {

        getSession().persist(t);

        return t;

    }

    @Transactional
    public void delete(final Serializable id) {

        T t = (T) getSession().get(entityClass, id);

        getSession().delete(t);

    }

    @Transactional
    public T find(final Serializable id) {

        System.out.println("get Entity class in find : " + this.getEntityClass());

        T t = (T) getSession().get(entityClass, id);

        return t;
    }

    @Transactional
    public void update(final T t) {

        getSession().saveOrUpdate(t);

    }

     @Transactional
    public List<T> getAll() {

       return  getSession().createCriteria(entityClass).list();

    }

}
