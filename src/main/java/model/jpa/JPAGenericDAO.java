package model.jpa;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Persistence;
import javax.persistence.Query;

import model.dao.GenericDAO;

public class JPAGenericDAO<T, ID> implements GenericDAO<T, ID> {

	private Class<T> persistentClass;
	protected EntityManager entityManager;

	public JPAGenericDAO(Class<T> persistentClass) {
		this.persistentClass = persistentClass;
		this.entityManager = Persistence.createEntityManagerFactory("Chaucherita").createEntityManager();
	}

	@Override
	public T getById(ID id) {
		return entityManager.find(persistentClass, id);
	}

	@Override
	public List<T> getAll() {
		String sentence = "SELECT t FROM " + persistentClass.getName();
		Query query = entityManager.createQuery(sentence);
		return query.getResultList();
	}

	@Override
	public void create(T entity) {
		entityManager.getTransaction().begin();
		try {
			entityManager.persist(entity);
			entityManager.getTransaction().commit();
		} catch (Exception e) {
			System.out.println("Error inserting the object");
			if (entityManager.getTransaction().isActive()) {
				entityManager.getTransaction().rollback();
			}
		}
	}

	@Override
	public void update(T entity) {
		entityManager.getTransaction().begin();
		try {
			entityManager.merge(entity);
			entityManager.getTransaction().commit();
		} catch (Exception e) {
			System.out.println("Error updating the object");
			if (entityManager.getTransaction().isActive()) {
				entityManager.getTransaction().rollback();
			}
		}
	}

	@Override
	public void delete(T entity) {
		entityManager.getTransaction().begin();
		try {
			entityManager.remove(entity);
			entityManager.getTransaction().commit();
		} catch (Exception e) {
			System.out.println("Error deleting the object");
			if (entityManager.getTransaction().isActive()) {
				entityManager.getTransaction().rollback();
			}
		}
	}

	@Override
	public void deleteById(ID id) {
		T entity = this.getById(id);
		if (entity != null) {
			this.delete(entity);
		}
	}

}
