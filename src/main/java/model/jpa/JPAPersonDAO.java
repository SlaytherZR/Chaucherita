package model.jpa;

import model.dao.PersonDAO;
import model.entities.Person;

public class JPAPersonDAO extends JPAGenericDAO<Person, Integer> implements PersonDAO {

	public JPAPersonDAO() {
		super(Person.class);
	}

	@Override
	public Person allow(String username, String password) {
		// TODO Auto-generated method stub
		return null;
	}

}
