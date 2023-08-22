package model.jpa;

import javax.persistence.Query;

import model.dao.PersonDAO;
import model.entities.Person;

public class JPAPersonDAO extends JPAGenericDAO<Person, Integer> implements PersonDAO {

	public JPAPersonDAO() {
		super(Person.class);
	}

	@Override
	public Person allow(String username, String password) {
		String sentence = "SELECT p FROM Person WHERE p.username = :username AND p.password = :password";
		Query query = entityManager.createQuery(sentence);
		query.setParameter("username", username);
		query.setParameter("password", password);
		Person authenticatedPerson = (Person) query.getSingleResult();
		return authenticatedPerson;
	}

}
