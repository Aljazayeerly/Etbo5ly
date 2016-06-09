package com.iti.jet.gp.etbo5ly.model.dao.impl;

import com.iti.jet.gp.etbo5ly.model.dao.interfaces.CookDao;
import com.iti.jet.gp.etbo5ly.model.generic.dao.GenericDaoImpl;
import com.iti.jet.gp.etbo5ly.model.pojo.Cook;
import com.iti.jet.gp.etbo5ly.model.pojo.Customer;
import com.iti.jet.gp.etbo5ly.model.pojo.MenuItems;
import com.iti.jet.gp.etbo5ly.model.pojo.Region;
import java.io.Serializable;
import java.util.List;
import javax.annotation.PostConstruct;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.HibernateCallback;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.support.TransactionTemplate;

@Repository("cookDaoImpl")
public class CookDaoImpl extends GenericDaoImpl<Cook> implements
        CookDao {

    @PostConstruct
    public void init() {
        System.out.println("hena fl init");
        super.setEntityClass(Cook.class);
    }

    public CookDaoImpl() {
        super();
        // TODO Auto-generated constructor stub
    }

    @Override
    public List<Cook> getCooksPage(int page) {
        final int pageSize = 2;
        final int max = page * pageSize;
        final int min = max - pageSize;

        return (List<Cook>) getHibernateTemplate().execute(new HibernateCallback<Object>() {

            @Override
            public Object doInHibernate(Session sn) throws HibernateException {
                Criteria criteria = sn.createCriteria(Cook.class, "c");
                criteria.setFirstResult(min);
                criteria.setMaxResults(max);
                return criteria.list();

            }
        });

    }

    @Override
    public List<Cook> getCooksByRegion(int regionId) {

        System.out.println("Regiooooooooooooooon : " + regionId);
        Session session = getHibernateTemplate().getSessionFactory().getCurrentSession();
        Region regionObject = (Region) getHibernateTemplate().getSessionFactory().getCurrentSession().get(Region.class, regionId);//createCriteria(Region.class).add(Restrictions.like("regionName", region)).uniqueResult();
        if (regionObject == null) {
            System.out.println("null");
        } else {
            System.out.println("not null");
        }
        List<Cook> cooks = session.createCriteria(Cook.class, "c").add(Restrictions.eq("c.region", regionObject)).list();
        System.out.println("size : " + cooks.size());
        return cooks;
    }

    @Override
    public Cook getCookByLocation(double longitude, double latitude) {
        System.out.println("model getCookByLocation");
        final double longitud = longitude;
        final double latitiude = latitude;

        return (Cook) getHibernateTemplate().execute(new HibernateCallback<Object>() {

            @Override
            public Object doInHibernate(Session sn) throws HibernateException {
                Cook selectedCook = new Cook();
                // selectedCook = (Cook) sn.createCriteria(Cook.class).add(Restrictions.and(Restrictions.eq("latitude", latitiude), Restrictions.eq("longitude", longitud))).uniqueResult();
                selectedCook = (Cook) sn.createCriteria(Cook.class).add(Restrictions.eq("latitude", latitiude)).uniqueResult();
                // System.out.println(selectedCook.getName());
                return selectedCook;

            }
        });
    }

    @Override
    public Cook registerCook(Cook cook) {
        Session session = getHibernateTemplate().getSessionFactory().getCurrentSession();
        Serializable saved = session.save(cook);
        if (saved != null) {
            return cook;
        } else {
            return null;
        }
    }

    @Override
    public Cook CheckEmail(String email) {
        Session session = getHibernateTemplate().getSessionFactory().getCurrentSession();
        Cook cook = (Cook) session.createCriteria(Cook.class).add(Restrictions.eq("email", email)).uniqueResult();
        //Customer customer=(Customer) session.get(Customer.class,email);
        return cook;
    }

}
