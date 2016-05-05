package  com.iti.jet.gp.etbo5ly.model.generic.dao;

import java.io.Serializable;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.TransactionCallback;
import org.springframework.transaction.support.TransactionTemplate;

@Component("genericDaoImpl")
public class GenericDaoImpl<T> implements GenericDao<T> {

	private Class<T> entityClass;
	private T object;

	@Autowired
	TransactionTemplate transactionTemplate;
	@Autowired
	HibernateTemplate hibernateTemplate;

	public GenericDaoImpl() {

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

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	public T create(final T t) {

		try {
			transactionTemplate.execute(new TransactionCallback<Object>() {
				@Override
				public Object doInTransaction(TransactionStatus ts) {
					System.out.println("henaaa");
					hibernateTemplate.persist(t);
					GenericDaoImpl.this.object = t;
					return t;
				}
			});

		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return (T)GenericDaoImpl.this.object;
	}

	public void delete(final Serializable id) {

		try {
			transactionTemplate.execute(new TransactionCallback<Object>() {
				@Override
				public Object doInTransaction(TransactionStatus ts) {

					T t = (T) hibernateTemplate.load(entityClass, id);

					getHibernateTemplate().delete(t);
					return null;
				}

			});

		} catch (Exception ex) {
			ex.printStackTrace();
		}

	}

	public T find(final Serializable id) {

		
		System.out.println("get Entity class in find : " + this.getEntityClass());

		try {
			transactionTemplate.execute(new TransactionCallback<Object>() {
				@Override
				public Object doInTransaction(TransactionStatus ts) {
					System.out.println("do in transaction");
					System.out.println("Entity class : " + entityClass + " id: " + id);

					T t = (T) hibernateTemplate.load(entityClass, id);
					System.out.println("tt : " + t);
					GenericDaoImpl.this.object = t;
					return t;
				}

			});

		} catch (Exception ex) {
			System.out.println("here error");

			ex.printStackTrace();
		}
		System.out.println("here " + GenericDaoImpl.this.object);
		return (T)GenericDaoImpl.this.object;
	}

	public T update(final T t) {

		try {
			transactionTemplate.execute(new TransactionCallback<Object>() {
				@Override
				public Object doInTransaction(TransactionStatus ts) {

					getHibernateTemplate().saveOrUpdate(t);
					return null;
				}

			});

		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return null;
	}

}
