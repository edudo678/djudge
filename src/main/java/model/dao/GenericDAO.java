/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import java.lang.reflect.ParameterizedType;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import util.ConnectionFactory;

/**
 *
 * @author eddunic
 * @param <T>
 */
public class GenericDAO<T extends BaseEntity> {

    private static EntityManager manager = ConnectionFactory.getEntityManager();

    public T findById(Class<T> clazz, Long id) {
	return manager.find(clazz, id);
    }

//    public List<T> getList() {
//	CriteriaBuilder builder = manager.getCriteriaBuilder();
//	CriteriaQuery<T> query = builder.createQuery(clazz);
//	query.from(clazz);
//	return manager.createQuery(query).getResultList();

//	Class<T> clazz;
//	return manager.createQuery(
//		String.format("from %s", clazz.getName()))
//		.getResultList();
 //   }

//    public List<T> findAll() {
//	return manager.createQuery(("FROM " + getTypeClass().getName()))
//		.getResultList();
//    }
//
//    private Class<T> getTypeClass() {
//	Class<T> clazz = (Class<T>) (((ParameterizedType) getClass().getGenericSuperclass()).getActualTypeArguments()[0]);
//	return clazz;
//    }
    public void saveOrUpdate(T obj) {
	try {
	    manager.getTransaction().begin();
	    if (obj.getId() == null) {
		manager.persist(obj);
	    } else {
		manager.merge(obj);
	    }
	    manager.getTransaction().commit();
	} catch (Exception e) {
	    manager.getTransaction().rollback();
	}
    }

    public void remove(Class<T> clazz, Long id) {
	T t = findById(clazz, id);
	try {
	    manager.getTransaction().begin();
	    manager.remove(t);
	    manager.getTransaction().commit();
	} catch (Exception e) {
	    manager.getTransaction().rollback();
	}
    }

}
